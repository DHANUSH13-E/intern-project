package com.tamilnadu.culture.repository;

import com.tamilnadu.culture.entity.District;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DistrictRepository extends JpaRepository<District, Long> {
    Optional<District> findByCode(String code);
    Optional<District> findByNameEnIgnoreCase(String nameEn);
    List<District> findAllByOrderByNameEnAsc();
    List<District> findByRegionOrderByNameEnAsc(String region);
}
