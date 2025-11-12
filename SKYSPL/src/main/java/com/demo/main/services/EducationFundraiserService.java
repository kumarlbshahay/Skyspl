package com.demo.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.EducationFundraiser;
import com.demo.main.repository.EducationFundraiserRepository;

@Service
public class EducationFundraiserService {
    @Autowired
    private EducationFundraiserRepository repo;

    public void save(EducationFundraiser fundraiser) {
        repo.save(fundraiser);
    }
}
