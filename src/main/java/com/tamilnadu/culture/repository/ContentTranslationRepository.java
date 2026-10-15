package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.ContentTranslation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ContentTranslationRepository extends JpaRepository<ContentTranslation, Long> {
    Optional<ContentTranslation> findByEntryIdAndLanguageCode(Long entryId, String languageCode);
    List<ContentTranslation> findByEntryId(Long entryId);
}
