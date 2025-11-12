package com.demo.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import com.demo.main.model.HelpRequest;
import com.demo.main.model.User;
import com.demo.main.services.UserService;
import com.demo.main.services.EmailService;
import com.demo.main.services.HelpService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userServices;
    
    @Autowired
    private HelpService helpService;

    @Autowired
    private EmailService emailService;

    /* ============================
     *   SEND OTP
     * ============================ */
    @PostMapping("/send-otp")
    @ResponseBody
    public Map<String, String> sendOtp(@RequestParam String email, HttpSession session) {
        Map<String, String> response = new HashMap<>();

        // Check if email already exists
        if (userServices.existsByEmail(email)) {
            response.put("status", "error");
            response.put("message", "Email already registered!");
            return response;
        }

        int otp = emailService.sendOtpEmail(email);
        session.setAttribute("otp", otp);
        session.setAttribute("otpEmail", email);

        response.put("status", "success");
        response.put("message", "OTP sent successfully to " + email);
        return response;
    }

    /* ============================
     *   VERIFY OTP & REGISTER
     * ============================ */
    @PostMapping("/verify-otp")
    @ResponseBody
    public Map<String, String> verifyOtp(@ModelAttribute User user,
                                         @RequestParam int otp,
                                         HttpSession session) {
        Map<String, String> response = new HashMap<>();

        Integer sessionOtp = (Integer) session.getAttribute("otp");
        String sessionEmail = (String) session.getAttribute("otpEmail");

        if (sessionOtp == null || sessionEmail == null) {
            response.put("status", "error");
            response.put("message", "Session expired! Please try again.");
            return response;
        }

        if (sessionOtp == otp && sessionEmail.equals(user.getEmail())) {
            boolean saved = userServices.registerUser(user);
            if (saved) {
                session.removeAttribute("otp");
                session.removeAttribute("otpEmail");
                response.put("status", "success");
                response.put("message", "Registration successful!");
            } else {
                response.put("status", "error");
                response.put("message", "Failed to save user. Try again!");
            }
        } else {
            response.put("status", "error");
            response.put("message", "Invalid OTP! Please try again.");
        }

        return response;
    }

    /* ============================
     *   USER LOGIN
     * ============================ */
    @PostMapping("/login")
    @ResponseBody
    public Map<String, String> loginUser(@RequestParam String email,
                                         @RequestParam String password,
                                         HttpSession session) {
        Map<String, String> response = new HashMap<>();
        User u = userServices.loginUser(email, password);

        if (u != null) {
            session.setAttribute("user", u);
            response.put("status", "success");
            response.put("message", "Login successful! Welcome " + u.getName());
            response.put("redirectUrl", "/user/home");
        } else {
            response.put("status", "error");
            response.put("message", "Invalid credentials! Please try again.");
        }

        return response;
    }

    /* ============================
     *   USER HOME PAGE
     * ============================ */
    @GetMapping("/home")
    public String userHome(HttpSession session, Map<String, Object> model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/";
        model.put("user", user);
        return "user/Home";
    }

    @GetMapping("/StartFundraiser")
    public String startFundraiser(HttpSession session, Map<String, Object> model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/";
        model.put("user", user);
        return "user/StartFundraiser"; // /WEB-INF/views/user/StartFundraiser.jsp
    }



    /* ============================
     *   USER LOGOUT
     * ============================ */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";  // Redirect to landing/login page
    }
    
    @PostMapping("/help/create")
    public String createHelp(@ModelAttribute HelpRequest helpRequest, HttpSession session) {
        User user = (User) session.getAttribute("user");
        helpRequest.setUser(user);
        helpRequest.setStatus("PENDING");
        helpService.save(helpRequest);
        return "redirect:/user/my-requests";
    }

    @GetMapping("/my-requests")
    public String viewRequests(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<HelpRequest> requests = helpService.getRequestsByUser(user);
        model.addAttribute("requests", requests);
        return "user/myRequests";
    }

    
}
