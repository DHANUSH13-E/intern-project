package com.tamilnadu.culture.service;

import com.tamilnadu.culture.dto.FeedbackRequest;
import com.tamilnadu.culture.dto.RatingRequest;
import com.tamilnadu.culture.dto.ReportRequest;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@SuppressWarnings("null")
public class RatingAndFeedbackService {

    private final RatingReviewRepository ratingRepository;
    private final CorrectionReportRepository reportRepository;
    private final ApplicationFeedbackRepository feedbackRepository;
    private final CulturalEntryRepository entryRepository;
    private final UserRepository userRepository;

    public RatingAndFeedbackService(RatingReviewRepository ratingRepository,
                                    CorrectionReportRepository reportRepository,
                                    ApplicationFeedbackRepository feedbackRepository,
                                    CulturalEntryRepository entryRepository,
                                    UserRepository userRepository) {
        this.ratingRepository = ratingRepository;
        this.reportRepository = reportRepository;
        this.feedbackRepository = feedbackRepository;
        this.entryRepository = entryRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public RatingReview submitRating(String userEmail, Long entryId, RatingRequest request) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userEmail));

        CulturalEntry entry = entryRepository.findById(entryId)
                .orElseThrow(() -> new IllegalArgumentException("Entry not found: " + entryId));

        Optional<RatingReview> existingOpt = ratingRepository.findByUserIdAndEntryId(user.getId(), entryId);
        RatingReview review;
        if (existingOpt.isPresent()) {
            review = existingOpt.get();
            review.setRating(request.getRating());
            review.setReviewText(request.getReviewText());
        } else {
            review = new RatingReview(user, entry, request.getRating(), request.getReviewText());
        }
        review = ratingRepository.save(review);

        // Update entry aggregated rating
        Double avg = ratingRepository.calculateAverageRatingForEntry(entryId);
        int count = ratingRepository.countRatingsForEntry(entryId);
        entry.setAverageRating(avg != null ? Math.round(avg * 10.0) / 10.0 : 0.0);
        entry.setTotalRatings(count);
        entryRepository.save(entry);

        return review;
    }

    public List<RatingReview> getEntryReviews(Long entryId) {
        return ratingRepository.findByEntryIdOrderByCreatedAtDesc(entryId);
    }

    @Transactional
    public CorrectionReport submitReport(String userEmail, ReportRequest request) {
        User user = null;
        if (userEmail != null && !userEmail.isBlank()) {
            user = userRepository.findByEmail(userEmail).orElse(null);
        }

        CulturalEntry entry = entryRepository.findById(request.getEntryId())
                .orElseThrow(() -> new IllegalArgumentException("Entry not found with id: " + request.getEntryId()));

        CorrectionReport report = new CorrectionReport(user, entry, request.getReportType(), request.getDetails());
        return reportRepository.save(report);
    }

    @Transactional
    public ApplicationFeedback submitFeedback(String userEmail, FeedbackRequest request) {
        User user = null;
        if (userEmail != null && !userEmail.isBlank()) {
            user = userRepository.findByEmail(userEmail).orElse(null);
        }

        ApplicationFeedback feedback = new ApplicationFeedback(user, request.getCategory(), request.getRating(), request.getComments());
        return feedbackRepository.save(feedback);
    }
}
