package com.demo.main.services;

import com.demo.main.model.Admin;
import java.util.List;
import java.util.Optional;

public interface AdminService {
    boolean validateAdmin(String username, String password);
    Admin saveAdmin(Admin admin);
    List<Admin> getAllAdmins();
    Optional<Admin> findByUsername(String username);
}
