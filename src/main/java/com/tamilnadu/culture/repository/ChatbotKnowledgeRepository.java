package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.ChatbotKnowledge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ChatbotKnowledgeRepository extends JpaRepository<ChatbotKnowledge, Long> {
    Optional<ChatbotKnowledge> findByIntentKey(String intentKey);
    List<ChatbotKnowledge> findByDistrictCode(String districtCode);
    List<ChatbotKnowledge> findByCategoryCode(String categoryCode);

    @Query("SELECT k FROM ChatbotKnowledge k WHERE k.verified = true AND " +
           "(LOWER(k.keywords) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           " LOWER(k.intentKey) LIKE LOWER(CONCAT('%', :query, '%')))")
    List<ChatbotKnowledge> searchKnowledge(@Param("query") String query);
}
