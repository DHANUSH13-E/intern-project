package com.tamilnadu.culture.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "otp_verifications")
public class OtpVerification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 120)
    private String email;

    @Column(nullable = false, length = 100)
    private String otpHash;

    // Kept only for local dev profile / capstone demo display when app.otp.dev-mode=true
    @Column(length = 10)
    private String devOtpDisplay;

    @Column(nullable = false, length = 30)
    private String purpose;

    @Column(nullable = false)
    private LocalDateTime expiresAt;

    @Column(nullable = false)
    private int attemptsCount = 0;

    @Column(nullable = false)
    private LocalDateTime lastSentAt = LocalDateTime.now();

    @Column(nullable = false)
    private boolean verified = false;

    public OtpVerification() {}

    public OtpVerification(String email, String otpHash, String devOtpDisplay, String purpose, LocalDateTime expiresAt) {
        this.email = email;
        this.otpHash = otpHash;
        this.devOtpDisplay = devOtpDisplay;
        this.purpose = purpose;
        this.expiresAt = expiresAt;
        this.lastSentAt = LocalDateTime.now();
        this.attemptsCount = 0;
        this.verified = false;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getOtpHash() { return otpHash; }
    public void setOtpHash(String otpHash) { this.otpHash = otpHash; }

    public String getDevOtpDisplay() { return devOtpDisplay; }
    public void setDevOtpDisplay(String devOtpDisplay) { this.devOtpDisplay = devOtpDisplay; }

    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }

    public LocalDateTime getExpiresAt() { return expiresAt; }
    public void setExpiresAt(LocalDateTime expiresAt) { this.expiresAt = expiresAt; }

    public int getAttemptsCount() { return attemptsCount; }
    public void setAttemptsCount(int attemptsCount) { this.attemptsCount = attemptsCount; }

    public LocalDateTime getLastSentAt() { return lastSentAt; }
    public void setLastSentAt(LocalDateTime lastSentAt) { this.lastSentAt = lastSentAt; }

    public boolean isVerified() { return verified; }
    public void setVerified(boolean verified) { this.verified = verified; }
}
