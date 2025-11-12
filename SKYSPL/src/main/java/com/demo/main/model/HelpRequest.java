package com.demo.main.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class HelpRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String category; // should match NGO's serviceCategories
    private String status;   // e.g., "PENDING", "ASSIGNED", "RESOLVED"

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user; // who created the request

    @ManyToOne
    @JoinColumn(name = "ngo_id")
    private Ngo assignedNgo; // which NGO accepted

    private LocalDateTime createdAt = LocalDateTime.now();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Ngo getAssignedNgo() {
		return assignedNgo;
	}

	public void setAssignedNgo(Ngo assignedNgo) {
		this.assignedNgo = assignedNgo;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public HelpRequest(Long id, String title, String description, String category, String status, User user,
			Ngo assignedNgo, LocalDateTime createdAt) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.category = category;
		this.status = status;
		this.user = user;
		this.assignedNgo = assignedNgo;
		this.createdAt = createdAt;
	}

	public HelpRequest() {
		super();
	}

	@Override
	public String toString() {
		return "HelpRequest [id=" + id + ", title=" + title + ", description=" + description + ", category=" + category
				+ ", status=" + status + ", user=" + user + ", assignedNgo=" + assignedNgo + ", createdAt=" + createdAt
				+ "]";
	}

}

