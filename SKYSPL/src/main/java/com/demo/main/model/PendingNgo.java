package com.demo.main.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class PendingNgo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

   

	// Basic fields (copy from Ngo)
    private String name;
    private String registrationNumber;
    private String panNumber;
    private String darpanId;
    private String legalCertificatePath;

    private String contactPerson;
    private String designation;
    private String email;
    private String phone;
    private String alternatePhone;
    private String website;
    private String address;
    private String city;
    private String state;
    private String pincode;

    private String serviceCategories;
    private String operatingRegions;
    private Integer totalVolunteers;
    private Integer totalStaff;
    private String yearsOfOperation;

    private LocalDateTime registeredAt = LocalDateTime.now();

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getPanNumber() {
		return panNumber;
	}

	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}

	public String getDarpanId() {
		return darpanId;
	}

	public void setDarpanId(String darpanId) {
		this.darpanId = darpanId;
	}

	public String getLegalCertificatePath() {
		return legalCertificatePath;
	}

	public void setLegalCertificatePath(String legalCertificatePath) {
		this.legalCertificatePath = legalCertificatePath;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAlternatePhone() {
		return alternatePhone;
	}

	public void setAlternatePhone(String alternatePhone) {
		this.alternatePhone = alternatePhone;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getServiceCategories() {
		return serviceCategories;
	}

	public void setServiceCategories(String serviceCategories) {
		this.serviceCategories = serviceCategories;
	}

	public String getOperatingRegions() {
		return operatingRegions;
	}

	public void setOperatingRegions(String operatingRegions) {
		this.operatingRegions = operatingRegions;
	}

	public Integer getTotalVolunteers() {
		return totalVolunteers;
	}

	public void setTotalVolunteers(Integer totalVolunteers) {
		this.totalVolunteers = totalVolunteers;
	}

	public Integer getTotalStaff() {
		return totalStaff;
	}

	public void setTotalStaff(Integer totalStaff) {
		this.totalStaff = totalStaff;
	}

	public String getYearsOfOperation() {
		return yearsOfOperation;
	}

	public void setYearsOfOperation(String yearsOfOperation) {
		this.yearsOfOperation = yearsOfOperation;
	}

	public LocalDateTime getRegisteredAt() {
		return registeredAt;
	}

	public void setRegisteredAt(LocalDateTime registeredAt) {
		this.registeredAt = registeredAt;
	}
}
