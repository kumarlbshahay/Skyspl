package com.demo.main.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "education_fundraisers")
public class EducationFundraiser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String studentName;
    private String institution;
    private String educationPurpose;
    private double goalAmount;
    private int duration;
    private String story;
    private String contact;
    private String email;
    private String imagePath; // ✅ Uploaded image path

    // ✅ New field for automatic creation date
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    // ✅ Automatically set creation date before saving
    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    // Constructor
    public EducationFundraiser() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getInstitution() { return institution; }
    public void setInstitution(String institution) { this.institution = institution; }

    public String getEducationPurpose() { return educationPurpose; }
    public void setEducationPurpose(String educationPurpose) { this.educationPurpose = educationPurpose; }

    public double getGoalAmount() { return goalAmount; }
    public void setGoalAmount(double goalAmount) { this.goalAmount = goalAmount; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getStory() { return story; }
    public void setStory(String story) { this.story = story; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
