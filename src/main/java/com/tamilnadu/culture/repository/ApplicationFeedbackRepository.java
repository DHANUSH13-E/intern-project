package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.ApplicationFeedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationFeedbackRepository extends JpaRepository<ApplicationFeedback, Long> {
    List<ApplicationFeedback> findAllByOrderByCreatedAtDesc();
}
