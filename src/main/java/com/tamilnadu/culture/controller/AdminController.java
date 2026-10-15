package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.dto.ModerationRequest;
import com.tamilnadu.culture.entity.*;
import com.tamilnadu.culture.service.AdminService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/dashboard")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getDashboardStats() {
        return ResponseEntity.ok(ApiResponse.ok(adminService.getDashboardStats()));
    }

    @GetMapping("/submissions")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getSubmissions(
            @RequestParam(required = false, defaultValue = "PENDING") SubmissionStatus status) {
        return ResponseEntity.ok(ApiResponse.ok(adminService.getSubmissionsByStatus(status)));
    }

    @PutMapping("/submissions/{id}/moderate")
    public ResponseEntity<ApiResponse<CulturalEntry>> moderateSubmission(
            @PathVariable Long id,
            @Valid @RequestBody ModerationRequest request) {
        CulturalEntry entry = adminService.moderateSubmission(id, request);
        return ResponseEntity.ok(ApiResponse.ok("Submission moderation status updated.", entry));
    }

    @GetMapping("/reports")
    public ResponseEntity<ApiResponse<List<CorrectionReport>>> getReports() {
        return ResponseEntity.ok(ApiResponse.ok(adminService.getAllReports()));
    }

    @PutMapping("/reports/{id}/resolve")
    public ResponseEntity<ApiResponse<CorrectionReport>> resolveReport(
            @PathVariable Long id,
            @RequestParam String status,
            @RequestParam(required = false) String adminNotes) {
        CorrectionReport report = adminService.resolveReport(id, status, adminNotes);
        return ResponseEntity.ok(ApiResponse.ok("Report updated.", report));
    }

    @GetMapping("/users")
    public ResponseEntity<ApiResponse<List<User>>> getUsers() {
        return ResponseEntity.ok(ApiResponse.ok(adminService.getAllUsers()));
    }

    @PutMapping("/users/{id}/toggle-status")
    public ResponseEntity<ApiResponse<User>> toggleUserStatus(
            @PathVariable Long id,
            @RequestParam boolean enabled) {
        User user = adminService.toggleUserStatus(id, enabled);
        return ResponseEntity.ok(ApiResponse.ok("User status updated.", user));
    }

    @GetMapping("/feedback")
    public ResponseEntity<ApiResponse<List<ApplicationFeedback>>> getFeedback() {
        return ResponseEntity.ok(ApiResponse.ok(adminService.getAllFeedback()));
    }
}
