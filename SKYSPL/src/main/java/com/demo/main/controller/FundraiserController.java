package com.demo.main.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import com.demo.main.model.*;
import com.demo.main.services.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/fundraiser")
public class FundraiserController {

    @Autowired private MedicalFundraiserService medicalService;
    @Autowired private EducationFundraiserService educationService;
    @Autowired private FoodFundraiserService foodService;
    @Autowired private ElderlyFundraiserService elderlyService;
    @Autowired private OtherFundraiserService otherService;

    @Autowired private HelpService helpService;
    @Autowired private NgoService ngoService;

    @Value("${upload.base-dir}")
    private String uploadBaseDir;

    @PostMapping("/save")
    public String saveFundraiser(
            @RequestParam String category,
            @RequestParam(required = false) String patientName,
            @RequestParam(required = false) String treatmentType,
            @RequestParam(required = false) String hospital,
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String studentName,
            @RequestParam(required = false) String institution,
            @RequestParam(required = false) String educationPurpose,
            @RequestParam(required = false) String foodCampaign,
            @RequestParam(required = false) String foodLocation,
            @RequestParam(required = false) String elderName,
            @RequestParam(required = false) String elderPurpose,
            @RequestParam(required = false) String causeTitle,
            @RequestParam double goalAmount,
            @RequestParam int duration,
            @RequestParam String story,
            @RequestParam String contact,
            @RequestParam String email,
            @RequestParam(value = "documents", required = false) MultipartFile file,
            HttpSession session,
            Model model) {

        try {
            User user = (User) session.getAttribute("user");
            if (user == null) {
                model.addAttribute("message", "⚠️ Please log in to create a fundraiser.");
                return "redirect:/";
            }

            // ✅ Ensure upload directory exists
            Path uploadPath = Paths.get(uploadBaseDir).toAbsolutePath().normalize();
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // ✅ Save file if uploaded
            String imagePath = null;
            if (file != null && !file.isEmpty()) {
                String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path filePath = uploadPath.resolve(filename);
                file.transferTo(filePath.toFile());
                imagePath = "/uploads/" + filename;
            }

            // ✅ Common help request object
            HelpRequest helpRequest = new HelpRequest();
            helpRequest.setCategory(category.toLowerCase());
            helpRequest.setUser(user);
            helpRequest.setStatus("PENDING");
            helpRequest.setCreatedAt(LocalDateTime.now());

            // ✅ Detect fundraiser type and save accordingly
            switch (category.toLowerCase()) {

                case "medical" -> {
                    MedicalFundraiser m = new MedicalFundraiser();
                    m.setPatientName(patientName);
                    m.setTreatmentType(treatmentType);
                    m.setHospital(hospital);
                    m.setCity(city);
                    m.setGoalAmount(goalAmount);
                    m.setDuration(duration);
                    m.setStory(story);
                    m.setContact(contact);
                    m.setEmail(email);
                    m.setImagePath(imagePath);
                    medicalService.save(m);

                    helpRequest.setTitle("Medical Aid: " + patientName);
                    helpRequest.setDescription(story);
                    model.addAttribute("message", "✅ Medical fundraiser created successfully!");
                }

                case "education" -> {
                    EducationFundraiser e = new EducationFundraiser();
                    e.setStudentName(studentName);
                    e.setInstitution(institution);
                    e.setEducationPurpose(educationPurpose);
                    e.setGoalAmount(goalAmount);
                    e.setDuration(duration);
                    e.setStory(story);
                    e.setContact(contact);
                    e.setEmail(email);
                    e.setImagePath(imagePath);
                    educationService.save(e);

                    helpRequest.setTitle("Education Support: " + studentName);
                    helpRequest.setDescription(story);
                    model.addAttribute("message", "🎓 Education fundraiser created successfully!");
                }

                case "food" -> {
                    FoodFundraiser f = new FoodFundraiser();
                    f.setFoodCampaign(foodCampaign);
                    f.setFoodLocation(foodLocation);
                    f.setGoalAmount(goalAmount);
                    f.setDuration(duration);
                    f.setStory(story);
                    f.setContact(contact);
                    f.setEmail(email);
                    f.setImagePath(imagePath);
                    foodService.save(f);

                    helpRequest.setTitle("Food Relief Campaign: " + foodCampaign);
                    helpRequest.setDescription(story);
                    model.addAttribute("message", "🍱 Food fundraiser created successfully!");
                }

                case "elderly" -> {
                    ElderlyFundraiser e = new ElderlyFundraiser();
                    e.setElderName(elderName);
                    e.setElderPurpose(elderPurpose);
                    e.setGoalAmount(goalAmount);
                    e.setDuration(duration);
                    e.setStory(story);
                    e.setContact(contact);
                    e.setEmail(email);
                    e.setImagePath(imagePath);
                    elderlyService.save(e);

                    helpRequest.setTitle("Elderly Care: " + elderName);
                    helpRequest.setDescription(story);
                    model.addAttribute("message", "👵 Elderly support fundraiser created successfully!");
                }

                case "others" -> {
                    OtherFundraiser o = new OtherFundraiser();
                    o.setCauseTitle(causeTitle);
                    o.setGoalAmount(goalAmount);
                    o.setDuration(duration);
                    o.setStory(story);
                    o.setContact(contact);
                    o.setEmail(email);
                    o.setImagePath(imagePath);
                    otherService.save(o);

                    helpRequest.setTitle("Personal Cause: " + causeTitle);
                    helpRequest.setDescription(story);
                    model.addAttribute("message", "❤️ Personal cause fundraiser created successfully!");
                }

                default -> {
                    model.addAttribute("message", "⚠️ Invalid category selected!");
                    return "user/StartFundraiser";
                }
            }

            // ✅ Save help request
            helpService.save(helpRequest);

            // ✅ Notify all NGOs with matching serviceCategories
            List<Ngo> matchingNgos = ngoService.findByServiceCategory(category);
            model.addAttribute("matchingNgos", matchingNgos);

            if (matchingNgos.isEmpty()) {
                model.addAttribute("ngoMessage", "No matching NGOs found for this fundraiser category.");
            } else {
                model.addAttribute("ngoMessage", matchingNgos.size() + " NGOs notified successfully!");
            }

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "❌ Error uploading image. Please try again.");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "❌ Error creating fundraiser. Please try again.");
        }

        return "user/StartFundraiser";
    }
}
