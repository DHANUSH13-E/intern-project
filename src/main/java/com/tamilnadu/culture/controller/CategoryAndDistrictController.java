package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.entity.Category;
import com.tamilnadu.culture.entity.District;
import com.tamilnadu.culture.repository.CategoryRepository;
import com.tamilnadu.culture.repository.DistrictRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CategoryAndDistrictController {

    private final CategoryRepository categoryRepository;
    private final DistrictRepository districtRepository;

    public CategoryAndDistrictController(CategoryRepository categoryRepository, DistrictRepository districtRepository) {
        this.categoryRepository = categoryRepository;
        this.districtRepository = districtRepository;
    }

    @GetMapping("/categories")
    public ResponseEntity<ApiResponse<List<Category>>> getCategories() {
        return ResponseEntity.ok(ApiResponse.ok(categoryRepository.findByActiveTrueOrderByDisplayOrderAsc()));
    }

    @GetMapping("/districts")
    public ResponseEntity<ApiResponse<List<District>>> getDistricts() {
        return ResponseEntity.ok(ApiResponse.ok(districtRepository.findAllByOrderByNameEnAsc()));
    }

    @GetMapping("/districts/region/{region}")
    public ResponseEntity<ApiResponse<List<District>>> getDistrictsByRegion(@PathVariable String region) {
        return ResponseEntity.ok(ApiResponse.ok(districtRepository.findByRegionOrderByNameEnAsc(region)));
    }
}
