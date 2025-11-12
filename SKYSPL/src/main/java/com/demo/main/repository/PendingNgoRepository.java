package com.demo.main.repository;

import com.demo.main.model.PendingNgo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PendingNgoRepository extends JpaRepository<PendingNgo, Long> {
}
