package com.demo.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.main.model.HelpRequest;
import com.demo.main.model.User;

public interface HelpRequestRepository extends JpaRepository<HelpRequest, Long> {
    List<HelpRequest> findByCategoryInAndStatus(List<String> categories, String status);

	List<HelpRequest> findByUser(User user);
}

