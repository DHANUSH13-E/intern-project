package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.*;
import com.tamilnadu.culture.entity.OtpVerification;
import com.tamilnadu.culture.entity.Role;
import com.tamilnadu.culture.entity.User;
import com.tamilnadu.culture.repository.OtpVerificationRepository;
import com.tamilnadu.culture.repository.UserRepository;
import com.tamilnadu.culture.security.JwtTokenProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class AuthService {

    private static final Logger logger = LoggerFactory.getLogger(AuthService.class);

    private final UserRepository userRepository;
    private final OtpVerificationRepository otpRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider tokenProvider;
    private final Optional<JavaMailSender> mailSender;

    @Value("${app.otp.dev-mode:true}")
    private boolean devMode;

    @Value("${app.otp.validity-minutes:10}")
    private int otpValidityMinutes;

    @Value("${app.otp.max-attempts:3}")
    private int maxAttempts;

    @Value("${app.otp.cooldown-seconds:60}")
    private int cooldownSeconds;

    private final SecureRandom secureRandom = new SecureRandom();

    public AuthService(UserRepository userRepository,
                       OtpVerificationRepository otpRepository,
                       PasswordEncoder passwordEncoder,
                       JwtTokenProvider tokenProvider,
                       Optional<JavaMailSender> mailSender) {
        this.userRepository = userRepository;
        this.otpRepository = otpRepository;
        this.passwordEncoder = passwordEncoder;
        this.tokenProvider = tokenProvider;
        this.mailSender = mailSender;
    }

    @Transactional
    public String registerUser(RegisterRequest request) {
        if (userRepository.existsByEmail(request.getEmail())) {
            User existing = userRepository.findByEmail(request.getEmail()).get();
            if (existing.isEnabled()) {
                throw new IllegalArgumentException("An account with this email already exists and is active. Please login.");
            } else {
                // Update credentials if user registered earlier but did not complete OTP
                existing.setFullName(request.getFullName());
                existing.setPhoneCountryCode(request.getPhoneCountryCode());
                existing.setMobileNumber(request.getMobileNumber());
                existing.setCountry(request.getCountry());
                existing.setPreferredLanguage(request.getPreferredLanguage());
                existing.setPasswordHash(passwordEncoder.encode(request.getPassword()));
                userRepository.save(existing);
            }
        } else {
            User newUser = new User(
                    request.getFullName(),
                    request.getEmail(),
                    request.getPhoneCountryCode(),
                    request.getMobileNumber(),
                    request.getCountry(),
                    request.getPreferredLanguage(),
                    passwordEncoder.encode(request.getPassword()),
                    Role.ROLE_PUBLIC_USER,
                    false // not enabled until OTP verification
            );
            userRepository.save(newUser);
        }

        return generateAndSendOtp(request.getEmail(), "REGISTRATION");
    }

    @Transactional
    public String generateAndSendOtp(String email, String purpose) {
        Optional<OtpVerification> existingOtpOpt = otpRepository.findTopByEmailAndPurposeOrderByIdDesc(email, purpose);
        if (existingOtpOpt.isPresent()) {
            OtpVerification existing = existingOtpOpt.get();
            if (existing.getLastSentAt().plusSeconds(cooldownSeconds).isAfter(LocalDateTime.now())) {
                throw new IllegalStateException("Please wait " + cooldownSeconds + " seconds before requesting a new OTP.");
            }
        }

        // Generate 6-digit cryptographic OTP
        int otpNum = 100000 + secureRandom.nextInt(900000);
        String plainOtp = String.valueOf(otpNum);
        String hashedOtp = passwordEncoder.encode(plainOtp);

        OtpVerification otpVerification = new OtpVerification(
                email,
                hashedOtp,
                devMode ? plainOtp : null, // dev display only for capstone demo
                purpose,
                LocalDateTime.now().plusMinutes(otpValidityMinutes)
        );

        otpRepository.save(otpVerification);

        // Attempt sending live email if mailSender configured
        try {
            if (mailSender.isPresent()) {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(email);
                message.setSubject("Your Verification OTP - Tamil Nadu Cultural Heritage Platform");
                message.setText("Vanakkam!\n\nYour One-Time Password (OTP) for account verification is: " + plainOtp +
                        "\n\nThis OTP is valid for " + otpValidityMinutes + " minutes.\n\nThank you,\nTamil Nadu Cultural Heritage Discovery Platform");
                mailSender.get().send(message);
            }
        } catch (Exception ex) {
            logger.warn("Live mail sending failed or unconfigured, OTP logged for testing: {}", plainOtp);
        }

        logger.info("Generated OTP for {}: {} (DevMode: {})", email, plainOtp, devMode);
        return devMode ? plainOtp : "OTP sent to email";
    }

    @Transactional
    public boolean verifyOtp(VerifyOtpRequest request) {
        OtpVerification otpVerification = otpRepository.findTopByEmailAndPurposeOrderByIdDesc(request.getEmail(), request.getPurpose())
                .orElseThrow(() -> new IllegalArgumentException("No OTP request found for this email."));

        if (otpVerification.isVerified()) {
            throw new IllegalStateException("This OTP has already been verified.");
        }

        if (LocalDateTime.now().isAfter(otpVerification.getExpiresAt())) {
            throw new IllegalStateException("OTP has expired. Please request a new OTP.");
        }

        if (otpVerification.getAttemptsCount() >= maxAttempts) {
            throw new IllegalStateException("Maximum verification attempts reached. Please request a new OTP.");
        }

        otpVerification.setAttemptsCount(otpVerification.getAttemptsCount() + 1);

        if (!passwordEncoder.matches(request.getOtp(), otpVerification.getOtpHash())) {
            otpRepository.save(otpVerification);
            throw new IllegalArgumentException("Invalid OTP code. " + (maxAttempts - otpVerification.getAttemptsCount()) + " attempts remaining.");
        }

        otpVerification.setVerified(true);
        otpRepository.save(otpVerification);

        // Activate User account
        if ("REGISTRATION".equalsIgnoreCase(request.getPurpose())) {
            User user = userRepository.findByEmail(request.getEmail())
                    .orElseThrow(() -> new IllegalArgumentException("User not found for email: " + request.getEmail()));
            user.setEnabled(true);
            userRepository.save(user);
        }

        return true;
    }

    public AuthResponse login(AuthRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("Invalid email or password."));

        if (!user.isEnabled()) {
            throw new IllegalStateException("Account is not verified. Please complete email OTP verification.");
        }

        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            throw new IllegalArgumentException("Invalid email or password.");
        }

        String token = tokenProvider.generateToken(user.getEmail(), user.getRole().name());

        return new AuthResponse(
                token,
                user.getId(),
                user.getFullName(),
                user.getEmail(),
                user.getRole().name(),
                user.getPreferredLanguage()
        );
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + email));
    }
}
