package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.Favourite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavouriteRepository extends JpaRepository<Favourite, Long> {
    List<Favourite> findByUserIdOrderByCreatedAtDesc(Long userId);
    Optional<Favourite> findByUserIdAndEntryId(Long userId, Long entryId);
    boolean existsByUserIdAndEntryId(Long userId, Long entryId);
    void deleteByUserIdAndEntryId(Long userId, Long entryId);
}
