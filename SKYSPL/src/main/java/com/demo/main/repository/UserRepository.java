package com.demo.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.main.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	 User findByEmailAndPassword(String email, String password);
	 User findByEmail(String email);
}


