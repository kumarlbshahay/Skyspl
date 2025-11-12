package com.demo.main.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "elderly_fundraisers")
public class ElderlyFundraiser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String elderName;
    private String elderPurpose;
    private double goalAmount;
    private int duration;
    private String story;
    private String contact;
    private String email;
    private String imagePath; // ✅ Uploaded image path

    // ✅ New field for creation date/time
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    // ✅ Automatically assign current date/time before saving
    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    // Constructor
    public ElderlyFundraiser() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getElderName() { return elderName; }
    public void setElderName(String elderName) { this.elderName = elderName; }

    public String getElderPurpose() { return elderPurpose; }
    public void setElderPurpose(String elderPurpose) { this.elderPurpose = elderPurpose; }

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
