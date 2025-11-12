package com.demo.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.ElderlyFundraiser;
import com.demo.main.repository.ElderlyFundraiserRepository;

@Service
public class ElderlyFundraiserService {
    @Autowired
    private ElderlyFundraiserRepository repo;

    public void save(ElderlyFundraiser fundraiser) {
        repo.save(fundraiser);
    }
}
