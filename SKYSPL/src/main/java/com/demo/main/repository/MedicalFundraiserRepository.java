package com.demo.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.MedicalFundraiser;

public interface MedicalFundraiserRepository extends JpaRepository<MedicalFundraiser, Long> { }
