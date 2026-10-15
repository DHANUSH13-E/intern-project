package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.CollectionItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CollectionItemRepository extends JpaRepository<CollectionItem, Long> {
    List<CollectionItem> findByCollectionIdOrderByAddedAtDesc(Long collectionId);
    Optional<CollectionItem> findByCollectionIdAndEntryId(Long collectionId, Long entryId);
    boolean existsByCollectionIdAndEntryId(Long collectionId, Long entryId);
    void deleteByCollectionIdAndEntryId(Long collectionId, Long entryId);
}
