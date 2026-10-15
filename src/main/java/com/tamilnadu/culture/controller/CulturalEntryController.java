package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.entity.AuthenticityType;
import com.tamilnadu.culture.entity.CulturalEntry;
import com.tamilnadu.culture.service.CulturalEntryService;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cultural")
public class CulturalEntryController {

    private final CulturalEntryService entryService;

    public CulturalEntryController(CulturalEntryService entryService) {
        this.entryService = entryService;
    }

    @GetMapping("/featured")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getFeatured() {
        return ResponseEntity.ok(ApiResponse.ok(entryService.getFeaturedEntries()));
    }

    @GetMapping("/hidden-gems")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getHiddenGems() {
        return ResponseEntity.ok(ApiResponse.ok(entryService.getHiddenGems()));
    }

    @GetMapping("/recent")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getRecent() {
        return ResponseEntity.ok(ApiResponse.ok(entryService.getRecentEntries()));
    }

    @GetMapping("/map")
    public ResponseEntity<ApiResponse<List<CulturalEntry>>> getMappedEntries() {
        return ResponseEntity.ok(ApiResponse.ok(entryService.getMappedEntries()));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<Page<CulturalEntry>>> searchEntries(
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Long districtId,
            @RequestParam(required = false) AuthenticityType authenticityType,
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size) {
        Page<CulturalEntry> result = entryService.searchEntries(categoryId, districtId, authenticityType, keyword, page, size);
        return ResponseEntity.ok(ApiResponse.ok(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<CulturalEntry>> getEntryById(@PathVariable Long id,
                                                                   @RequestParam(required = false) String lang) {
        CulturalEntry entry = entryService.getEntryById(id, lang);
        return ResponseEntity.ok(ApiResponse.ok(entry));
    }
}
