package com.demo.main.repository;

import com.demo.main.model.Ngo;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NgoRepository extends JpaRepository<Ngo, Long> {
    List<Ngo> findByStatus(String status);
    List<Ngo> findByTrustedBadgeTrue();
    List<Ngo> findByCityAndStatus(String city, String status);
	Ngo findByNameAndDarpanId(String name ,String darpanId);
	Ngo findByDarpanId(String darpanId);
	Ngo findByEmail(String Email);
}
