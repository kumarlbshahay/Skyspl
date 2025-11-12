package com.demo.main.controller;

import com.demo.main.model.Admin;
import com.demo.main.model.Ngo;
import com.demo.main.model.User;
import com.demo.main.repository.NgoRepository;
import com.demo.main.services.AdminService;
import com.demo.main.services.NgoService;
import com.demo.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

@Autowired
private NgoRepository ngoRepository;
	 
@Autowired
private AdminService adminService;

@Autowired
private UserService userService;

@Autowired
private NgoService ngoService;

// Show registration page
@GetMapping("/register")
public String showRegisterPage() {
    return "admin/AdminRegister";
}

// Handle registration
@PostMapping("/register")
public String register(@RequestParam("username") String username,
                       @RequestParam("password") String password,
                       @RequestParam("email") String email,
                       Model model) {

    if (adminService.findByUsername(username).isPresent()) {
        model.addAttribute("error", "Username already exists!");
        return "admin/AdminRegister";
    }

    Admin admin = new Admin();
    admin.setUsername(username);
    admin.setPassword(password);
    admin.setEmail(email);

    adminService.saveAdmin(admin);
    return "admin/AdminLogin";
}

// Show login page
@GetMapping("/login")
public String showLoginPage() {
    return "/admin/AdminLogin";
}

// Handle login
@PostMapping("/login")
public String login(@RequestParam("username") String username,
                    @RequestParam("password") String password,
                    HttpSession session,
                    Model model) {

	 	List<User> users = userService.getAllUsers(); // or userRepository.findAll()
	    List<Ngo> ngos = ngoService.getAllNgos();     // or ngoRepository.findAll()
	    System.out.println(users);
	    System.out.println(ngos);
	    model.addAttribute("users", users);
	    model.addAttribute("ngos", ngos);
	    
    boolean valid = adminService.validateAdmin(username, password);

    if (valid) {
        session.setAttribute("adminUsername", username); // store admin session
        return "admin/AdminDashboard";
    } else {
        model.addAttribute("error", "Invalid username or password");
        return "admin/AdminLogin";
    }
    
    
}

// Logout
@GetMapping("/logout")
public String logout(HttpSession session) {
    session.invalidate(); // clear admin session
    return "admin/AdminLogin";
}



@PostMapping("/admin/approveNgo")
public String approveNgo(@RequestParam("id") Long id) {
    Ngo ngo = ngoService.getNgoById(id);
    if (ngo != null) {
        ngo.setStatus("APPROVED");
        ngoRepository.save(ngo);
    }
    return "redirect:/admin/dashboard"; // refresh dashboard
}

@PostMapping("/admin/rejectNgo")
public String rejectNgo(@RequestParam("id") Long id) {
    Ngo ngo = ngoService.getNgoById(id);
    if (ngo != null) {
        ngo.setStatus("REJECTED");
        ngoRepository.save(ngo);
    }
    return "redirect:/admin/dashboard";
}

@GetMapping("/admin/dashboard")
public String showDashboard(Model model, HttpSession session) {
    if (session.getAttribute("adminUsername") == null) {
        return "admin/AdminLogin";
    }

    model.addAttribute("users", userService.getAllUsers());
    model.addAttribute("ngos",  ngoService.getAllNgos());

    return "admin/AdminDashboard"; // your JSP file name
}

}
