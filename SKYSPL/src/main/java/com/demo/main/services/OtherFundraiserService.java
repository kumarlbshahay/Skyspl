package com.demo.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.main.model.OtherFundraiser;
import com.demo.main.repository.OtherFundraiserRepository;

@Service
public class OtherFundraiserService {
    @Autowired
    private OtherFundraiserRepository repo;

    public void save(OtherFundraiser fundraiser) {
        repo.save(fundraiser);
    }
}
