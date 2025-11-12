package com.demo.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.main.model.User;
import com.demo.main.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	 public boolean registerUser(User user) {
	        try {
	            if (userRepository.findByEmail(user.getEmail()) == null) {
	            	userRepository.save(user);
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    public User loginUser(String email, String password) {
	        return userRepository.findByEmailAndPassword(email, password);
	    }

	    public boolean existsByEmail(String email) {
	        return userRepository.findByEmail(email) != null;
	    }

		public List<User> getAllUsers() {
			
			return null;
		}

	    
}


