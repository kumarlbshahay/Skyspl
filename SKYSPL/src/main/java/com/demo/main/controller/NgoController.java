package com.demo.main.controller;

import com.demo.main.model.HelpRequest;
import com.demo.main.model.Ngo;
import com.demo.main.model.NgoDocument;
import com.demo.main.repository.HelpRequestRepository;
import com.demo.main.services.HelpService;
import com.demo.main.services.NgoService;
import com.demo.main.util.EmailUtil;
import com.demo.main.util.FileStorageUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ngo")
public class NgoController {

    @Autowired
    private NgoService ngoService;

    @Autowired
    private HelpService helpService;
    
    @Autowired
    private FileStorageUtil fileStorageUtil;

    @Autowired
    private EmailUtil emailUtil;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("ngo", new Ngo());
        return "ngo/NGORegister";
    }

    @PostMapping("/register")
    public String registerNgo(
            @ModelAttribute Ngo ngo,
            @RequestParam("certificateFile") MultipartFile certificateFile,
            @RequestParam("panFile") MultipartFile panFile,
            @RequestParam("darpanFile") MultipartFile darpanFile,
            Model model) {

        // Save uploaded files
        String certPath = fileStorageUtil.saveFile(certificateFile);
        String panPath = fileStorageUtil.saveFile(panFile);
        String darpanPath = fileStorageUtil.saveFile(darpanFile);

        ngo.setLegalCertificatePath(certPath);

        // Attach documents
        List<NgoDocument> docs = new ArrayList<>();
        if (!certificateFile.isEmpty()) {
            docs.add(new NgoDocument("Registration Certificate", certPath, ngo));
        }
        if (!panFile.isEmpty()) {
            docs.add(new NgoDocument("PAN", panPath, ngo));
        }
        if (!darpanFile.isEmpty()) {
            docs.add(new NgoDocument("Darpan ID", darpanPath, ngo));
        }
        ngo.setDocuments(docs);

        ngo.setStatus("PENDING");
        Ngo savedNgo = ngoService.registerNgo(ngo);

        // Notify Admin
        StringBuilder adminMessage = new StringBuilder();
        adminMessage.append("A new NGO has registered and awaits verification.\n\n");
        adminMessage.append("🔹 Name: ").append(savedNgo.getName()).append("\n");
        adminMessage.append("🔹 Registration No: ").append(savedNgo.getRegistrationNumber()).append("\n");
        adminMessage.append("🔹 PAN: ").append(savedNgo.getPanNumber()).append("\n");
        adminMessage.append("🔹 Darpan ID: ").append(savedNgo.getDarpanId()).append("\n");
        adminMessage.append("🔹 Contact Person: ").append(savedNgo.getContactPerson()).append("\n");
        adminMessage.append("🔹 Designation: ").append(savedNgo.getDesignation()).append("\n");
        adminMessage.append("🔹 Email: ").append(savedNgo.getEmail()).append("\n");
        adminMessage.append("🔹 Phone: ").append(savedNgo.getPhone()).append("\n");
        adminMessage.append("🔹 City: ").append(savedNgo.getCity()).append("\n");
        adminMessage.append("🔹 State: ").append(savedNgo.getState()).append("\n");
        adminMessage.append("🔹 Website: ").append(savedNgo.getWebsite()).append("\n");
        adminMessage.append("🔹 Service Categories: ").append(savedNgo.getServiceCategories()).append("\n");
        adminMessage.append("🔹 Operating Regions: ").append(savedNgo.getOperatingRegions()).append("\n");
        adminMessage.append("🔹 Total Volunteers: ").append(savedNgo.getTotalVolunteers()).append("\n");
        adminMessage.append("🔹 Total Staff: ").append(savedNgo.getTotalStaff()).append("\n");
        adminMessage.append("🔹 Years of Operation: ").append(savedNgo.getYearsOfOperation()).append("\n");
        adminMessage.append("🔹 Registered At: ").append(savedNgo.getRegisteredAt()).append("\n");
        adminMessage.append("🔹 Trusted Badge: ").append(savedNgo.isTrustedBadge() ? "Yes" : "No").append("\n");

        emailUtil.sendEmail("yogeshyogi2707@gmail.com", "New NGO Registration", adminMessage.toString());

        // Confirm to NGO
        emailUtil.sendEmail(savedNgo.getEmail(), "Registration Received",
                "Dear " + savedNgo.getContactPerson() + ", your NGO registration has been received and is under review.");

        model.addAttribute("message", "Registration submitted. Awaiting admin verification.");
        model.addAttribute("ngo", savedNgo);
        return "ngo/verify-status";
    }

    @GetMapping("/dashboard/{id}")
    public String viewDashboard(@PathVariable Long id, Model model) {
        Ngo ngo = ngoService.getNgoById(id);
        model.addAttribute("ngo", ngo);
        return "ngo/dashboard";
    }

    @GetMapping("/verify/{id}")
    public String verifyNgo(@PathVariable Long id, Model model) {
        Ngo verifiedNgo = ngoService.verifyNgo(id);
        model.addAttribute("ngo", verifiedNgo);
        model.addAttribute("message", "NGO verified and trusted badge assigned.");
        return "admin/verify-ngos";
    }
    
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> loginNgo(
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String darpanId,
            HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Ngo ngo = null;
        // Find NGO by either Darpan ID or Email
        if (darpanId != null && !darpanId.isEmpty()) {
            ngo = ngoService.loginByDarpanId(darpanId);
        } else if (email != null && !email.isEmpty()) {
            ngo = ngoService.loginByEmail(email);
        }
        // Check if NGO exists
        if (ngo != null) {
            // ✅ Allow login only if NGO is APPROVED
            if ("APPROVED".equalsIgnoreCase(ngo.getStatus())) {
                session.setAttribute("ngo", ngo);
                response.put("status", "success");
                response.put("message", "Welcome, " + ngo.getName() + "!");
                response.put("id", ngo.getId());
            } else {
                // ❌ Block login if NGO is still pending or rejected
                response.put("status", "error");
                response.put("message", "Your NGO account is not yet approved. Current status: " + ngo.getStatus());
            }
        } else {
            response.put("status", "error");
            response.put("message", "Invalid Email or DARPAN ID. Please try again.");
        }
        return response;
    }

    @PostMapping("/update")
    public String updateNgoProfile(@ModelAttribute Ngo ngo, Model model) {
        Ngo updated = ngoService.updateNgoProfile(ngo);
        model.addAttribute("ngo", updated);
        model.addAttribute("message", "Profile updated successfully!");
        return "ngo/dashboard";
    }
    
    @GetMapping("/profile/edit/{id}")
    public String editNgoProfile(@PathVariable Long id, Model model) {
        Ngo ngo = ngoService.getNgoById(id);
        model.addAttribute("ngo", ngo);
        return "ngo/editNgoProfile";
    }

    @GetMapping("/requests")
    public String viewMatchingRequests(HttpSession session, Model model) {
        Ngo ngo = (Ngo) session.getAttribute("ngo");
        List<String> categories = Arrays.asList(ngo.getServiceCategories().split(","));
        List<HelpRequest> matchingRequests = helpService.findByCategories(categories);
        model.addAttribute("requests", matchingRequests);
        return "ngo/requests";
    }

    @PostMapping("/requests/accept/{id}")
    public String acceptRequest(@PathVariable Long id, HttpSession session) {
        Ngo ngo = (Ngo) session.getAttribute("ngo");
        HelpRequest req = helpService.getById(id);
        if (req != null) {
            req.setAssignedNgo(ngo);
            req.setStatus("ASSIGNED");
            helpService.save(req);
        }
        return "redirect:/ngo/requests";
    }

    @PostMapping("/requests/reject/{id}")
    public String rejectRequest(@PathVariable Long id) {
        HelpRequest req = helpService.getById(id);
        if (req != null) {
            req.setStatus("REJECTED");
            helpService.save(req);
        }
        return "redirect:/ngo/requests";
    }

    
}
