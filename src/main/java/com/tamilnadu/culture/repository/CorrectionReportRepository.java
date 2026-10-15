package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.CorrectionReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorrectionReportRepository extends JpaRepository<CorrectionReport, Long> {
    List<CorrectionReport> findByUserIdOrderByCreatedAtDesc(Long userId);
    List<CorrectionReport> findByStatusOrderByCreatedAtDesc(String status);
    List<CorrectionReport> findAllByOrderByCreatedAtDesc();
}
