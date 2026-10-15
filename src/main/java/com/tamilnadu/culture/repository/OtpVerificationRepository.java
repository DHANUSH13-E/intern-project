package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.OtpVerification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OtpVerificationRepository extends JpaRepository<OtpVerification, Long> {
    Optional<OtpVerification> findTopByEmailAndPurposeOrderByIdDesc(String email, String purpose);
    void deleteByEmail(String email);
}
