package com.demo.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.main.model.HelpRequest;
import com.demo.main.model.User;
import com.demo.main.repository.HelpRequestRepository;

@Service
public class HelpService {
    @Autowired
    private HelpRequestRepository repo;

    public List<HelpRequest> findByCategories(List<String> categories) {
        return repo.findByCategoryInAndStatus(categories, "PENDING");
    }

    public HelpRequest save(HelpRequest request) {
        return repo.save(request);
    }

    public HelpRequest getById(Long id) {
        return repo.findById(id).orElse(null);
    }
    
    public List<HelpRequest> getRequestsByUser(User user) {
        return repo.findByUser(user);
    }

}

