package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.dto.FeedbackRequest;
import com.tamilnadu.culture.dto.RatingRequest;
import com.tamilnadu.culture.dto.ReportRequest;
import com.tamilnadu.culture.entity.ApplicationFeedback;
import com.tamilnadu.culture.entity.CorrectionReport;
import com.tamilnadu.culture.entity.RatingReview;
import com.tamilnadu.culture.service.RatingAndFeedbackService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class RatingAndFeedbackController {

    private final RatingAndFeedbackService service;

    public RatingAndFeedbackController(RatingAndFeedbackService service) {
        this.service = service;
    }

    @PostMapping("/ratings/{entryId}")
    public ResponseEntity<ApiResponse<RatingReview>> rateEntry(
            @PathVariable Long entryId,
            @Valid @RequestBody RatingRequest request,
            Authentication authentication) {
        RatingReview review = service.submitRating(authentication.getName(), entryId, request);
        return ResponseEntity.ok(ApiResponse.ok("Thank you for your rating!", review));
    }

    @GetMapping("/ratings/{entryId}")
    public ResponseEntity<ApiResponse<List<RatingReview>>> getEntryReviews(@PathVariable Long entryId) {
        List<RatingReview> reviews = service.getEntryReviews(entryId);
        return ResponseEntity.ok(ApiResponse.ok(reviews));
    }

    @PostMapping("/reports")
    public ResponseEntity<ApiResponse<CorrectionReport>> submitReport(
            @Valid @RequestBody ReportRequest request,
            Authentication authentication) {
        String email = authentication != null ? authentication.getName() : null;
        CorrectionReport report = service.submitReport(email, request);
        return ResponseEntity.ok(ApiResponse.ok("Report submitted for administrator verification.", report));
    }

    @PostMapping("/feedback")
    public ResponseEntity<ApiResponse<ApplicationFeedback>> submitFeedback(
            @Valid @RequestBody FeedbackRequest request,
            Authentication authentication) {
        String email = authentication != null ? authentication.getName() : null;
        ApplicationFeedback feedback = service.submitFeedback(email, request);
        return ResponseEntity.ok(ApiResponse.ok("Thank you for your feedback!", feedback));
    }
}
