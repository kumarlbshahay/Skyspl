package com.demo.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.FoodFundraiser;

public interface FoodFundraiserRepository extends JpaRepository<FoodFundraiser, Long> { }
