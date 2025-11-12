package com.demo.main.repository;

import com.demo.main.model.Ngo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NgoRepository extends JpaRepository<Ngo, Long> {
    List<Ngo> findByStatus(String status);
    List<Ngo> findByTrustedBadgeTrue();
    List<Ngo> findByCityAndStatus(String city, String status);
	Ngo findByNameAndDarpanId(String name ,String darpanId);
	Ngo findByDarpanId(String darpanId);
	Ngo findByEmail(String Email);
	
	  // ✅ Custom query to find NGOs that have the category keyword in their serviceCategories (case-insensitive)
    @Query("SELECT n FROM Ngo n WHERE LOWER(n.serviceCategories) LIKE LOWER(CONCAT('%', :category, '%'))")
    List<Ngo> findByServiceCategory(@Param("category") String category);
}
