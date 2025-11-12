package com.demo.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.FoodFundraiser;
import com.demo.main.repository.FoodFundraiserRepository;

@Service
public class FoodFundraiserService {
    @Autowired
    private FoodFundraiserRepository repo;

    public void save(FoodFundraiser fundraiser) {
        repo.save(fundraiser);
    }
}
