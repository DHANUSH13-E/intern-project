package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.AuthenticityType;
import com.tamilnadu.culture.entity.CulturalEntry;
import com.tamilnadu.culture.entity.SubmissionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CulturalEntryRepository extends JpaRepository<CulturalEntry, Long> {

    Optional<CulturalEntry> findBySlug(String slug);

    Optional<CulturalEntry> findByTitle(String title);

    List<CulturalEntry> findByStatus(SubmissionStatus status);

    List<CulturalEntry> findByStatusAndFeaturedTrue(SubmissionStatus status);

    List<CulturalEntry> findByStatusAndHiddenGemTrue(SubmissionStatus status);

    List<CulturalEntry> findByStatusAndDistrictId(SubmissionStatus status, Long districtId);

    List<CulturalEntry> findByStatusAndCategoryId(SubmissionStatus status, Long categoryId);

    List<CulturalEntry> findByContributorIdOrderByCreatedAtDesc(Long contributorId);

    long countByStatus(SubmissionStatus status);

    @Query("SELECT e FROM CulturalEntry e WHERE e.status = :status AND " +
           "(:categoryId IS NULL OR e.category.id = :categoryId) AND " +
           "(:districtId IS NULL OR e.district.id = :districtId) AND " +
           "(:authenticityType IS NULL OR e.authenticityType = :authenticityType) AND " +
           "(:keyword IS NULL OR LOWER(e.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(e.shortDescription) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(e.tags) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    Page<CulturalEntry> searchPublishedEntries(
            @Param("status") SubmissionStatus status,
            @Param("categoryId") Long categoryId,
            @Param("districtId") Long districtId,
            @Param("authenticityType") AuthenticityType authenticityType,
            @Param("keyword") String keyword,
            Pageable pageable
    );

    @Query("SELECT e FROM CulturalEntry e WHERE e.status = 'APPROVED' AND e.latitude IS NOT NULL AND e.longitude IS NOT NULL")
    List<CulturalEntry> findMappedEntries();

    List<CulturalEntry> findTop6ByStatusOrderByCreatedAtDesc(SubmissionStatus status);
}
