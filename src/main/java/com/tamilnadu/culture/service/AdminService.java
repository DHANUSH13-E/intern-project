package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.ModerationRequest;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@SuppressWarnings("null")
public class AdminService {

    private final CulturalEntryRepository entryRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;
    private final CorrectionReportRepository reportRepository;
    private final ApplicationFeedbackRepository feedbackRepository;

    public AdminService(CulturalEntryRepository entryRepository,
                        UserRepository userRepository,
                        CategoryRepository categoryRepository,
                        CorrectionReportRepository reportRepository,
                        ApplicationFeedbackRepository feedbackRepository) {
        this.entryRepository = entryRepository;
        this.userRepository = userRepository;
        this.categoryRepository = categoryRepository;
        this.reportRepository = reportRepository;
        this.feedbackRepository = feedbackRepository;
    }

    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalPublished", entryRepository.countByStatus(SubmissionStatus.APPROVED));
        stats.put("totalPendingSubmissions", entryRepository.countByStatus(SubmissionStatus.PENDING));
        stats.put("totalUnderReview", entryRepository.countByStatus(SubmissionStatus.UNDER_REVIEW));
        stats.put("totalRejected", entryRepository.countByStatus(SubmissionStatus.REJECTED));
        stats.put("totalUsers", userRepository.count());
        stats.put("totalCategories", categoryRepository.count());
        stats.put("totalReports", reportRepository.count());
        stats.put("totalFeedback", feedbackRepository.count());
        return stats;
    }

    public List<CulturalEntry> getSubmissionsByStatus(SubmissionStatus status) {
        return entryRepository.findByStatus(status);
    }

    @Transactional
    public CulturalEntry moderateSubmission(Long entryId, ModerationRequest request) {
        CulturalEntry entry = entryRepository.findById(entryId)
                .orElseThrow(() -> new IllegalArgumentException("Entry not found with id: " + entryId));

        entry.setStatus(request.getStatus());
        if (request.getNotes() != null && !request.getNotes().isBlank()) {
            entry.setModerationNotes(request.getNotes());
        }

        return entryRepository.save(entry);
    }

    public List<CorrectionReport> getAllReports() {
        return reportRepository.findAllByOrderByCreatedAtDesc();
    }

    @Transactional
    public CorrectionReport resolveReport(Long reportId, String status, String adminNotes) {
        CorrectionReport report = reportRepository.findById(reportId)
                .orElseThrow(() -> new IllegalArgumentException("Report not found with id: " + reportId));

        report.setStatus(status);
        report.setAdminNotes(adminNotes);
        return reportRepository.save(report);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Transactional
    public User toggleUserStatus(Long userId, boolean enabled) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found with id: " + userId));

        // Prevent disabling an admin
        if (user.getRole() == Role.ROLE_ADMIN) {
            throw new IllegalStateException("Administrator accounts cannot be disabled.");
        }

        user.setEnabled(enabled);
        return userRepository.save(user);
    }

    public List<ApplicationFeedback> getAllFeedback() {
        return feedbackRepository.findAllByOrderByCreatedAtDesc();
    }
}
