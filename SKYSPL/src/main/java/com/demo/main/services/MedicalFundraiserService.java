package com.demo.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.MedicalFundraiser;
import com.demo.main.repository.MedicalFundraiserRepository;

@Service
public class MedicalFundraiserService {

    @Autowired
    private MedicalFundraiserRepository repo;

    public void save(MedicalFundraiser fundraiser) {
        repo.save(fundraiser);
    }
}
