package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.CulturalCollection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CulturalCollectionRepository extends JpaRepository<CulturalCollection, Long> {
    List<CulturalCollection> findByUserIdOrderByCreatedAtDesc(Long userId);
    Optional<CulturalCollection> findByIdAndUserId(Long id, Long userId);
}
