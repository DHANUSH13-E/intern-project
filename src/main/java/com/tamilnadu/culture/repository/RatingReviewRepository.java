package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.RatingReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RatingReviewRepository extends JpaRepository<RatingReview, Long> {
    List<RatingReview> findByEntryIdOrderByCreatedAtDesc(Long entryId);
    Optional<RatingReview> findByUserIdAndEntryId(Long userId, Long entryId);

    @Query("SELECT AVG(r.rating) FROM RatingReview r WHERE r.entry.id = :entryId")
    Double calculateAverageRatingForEntry(@Param("entryId") Long entryId);

    @Query("SELECT COUNT(r) FROM RatingReview r WHERE r.entry.id = :entryId")
    int countRatingsForEntry(@Param("entryId") Long entryId);
}
