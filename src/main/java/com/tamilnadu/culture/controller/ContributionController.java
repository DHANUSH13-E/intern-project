package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.dto.ContributionRequest;
import com.tamilnadu.culture.entity.CulturalEntry;
import com.tamilnadu.culture.service.CulturalEntryService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/contributions")
public class ContributionController {

    private final CulturalEntryService entryService;

    public ContributionController(CulturalEntryService entryService) {
        this.entryService = entryService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse<CulturalEntry>> submitContribution(
            @Valid @RequestBody ContributionRequest request,
            Authentication authentication) {
        String email = authentication.getName();
        CulturalEntry entry = entryService.submitContribution(email, request);
        return ResponseEntity.ok(ApiResponse.ok("Contribution submitted successfully for review.", entry));
    }

    @GetMapping("/my")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getMyContributions(Authentication authentication) {
        String email = authentication.getName();
        List<CulturalEntry> list = entryService.getUserContributions(email);
        return ResponseEntity.ok(ApiResponse.ok(list));
    }
}
