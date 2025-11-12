package com.demo.main.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class Ngo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Basic Info
    private String name;
    private String registrationNumber;
    private String panNumber;
    private String darpanId;
    private String legalCertificatePath;

    // Contact Info
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

    // Banking Info
    private String bankAccountNumber;
    private String bankIFSC;
    private String bankName;
    private String bankBranch;
    private String accountType;

    // Operational Scope
    private String serviceCategories; // comma-separated values
    private String operatingRegions;
    private Integer totalVolunteers;
    private Integer totalStaff;
    private String yearsOfOperation;

    // Status & Verification
    private String status; // e.g., PENDING, VERIFIED
    private boolean trustedBadge;
    private LocalDateTime registeredAt;
    private LocalDateTime verifiedAt;

    // Relationships
    @OneToMany(mappedBy = "ngo", cascade = CascadeType.ALL)
    private List<NgoDocument> documents;

    @OneToMany(mappedBy = "ngo", cascade = CascadeType.ALL)
    private List<HelpAssignment> helpAssignments;

    @OneToMany(mappedBy = "ngo", cascade = CascadeType.ALL)
    private List<Donation> donations;

    @OneToMany(mappedBy = "ngo", cascade = CascadeType.ALL)
    private List<SuccessStory> successStories;

    @OneToMany(mappedBy = "ngo", cascade = CascadeType.ALL)
    private List<Feedback> feedbacks;

    // Location Coordinates
    private Double latitude;
    private Double longitude;

    // Audit Trail
    private LocalDateTime lastUpdated;
    private String updatedBy;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getRegistrationNumber() { return registrationNumber; }
    public void setRegistrationNumber(String registrationNumber) { this.registrationNumber = registrationNumber; }

    public String getPanNumber() { return panNumber; }
    public void setPanNumber(String panNumber) { this.panNumber = panNumber; }

    public String getDarpanId() { return darpanId; }
    public void setDarpanId(String darpanId) { this.darpanId = darpanId; }

    public String getLegalCertificatePath() { return legalCertificatePath; }
    public void setLegalCertificatePath(String legalCertificatePath) { this.legalCertificatePath = legalCertificatePath; }

    public String getContactPerson() { return contactPerson; }
    public void setContactPerson(String contactPerson) { this.contactPerson = contactPerson; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAlternatePhone() { return alternatePhone; }
    public void setAlternatePhone(String alternatePhone) { this.alternatePhone = alternatePhone; }

    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getPincode() { return pincode; }
    public void setPincode(String pincode) { this.pincode = pincode; }

    public String getBankAccountNumber() { return bankAccountNumber; }
    public void setBankAccountNumber(String bankAccountNumber) { this.bankAccountNumber = bankAccountNumber; }

    public String getBankIFSC() { return bankIFSC; }
    public void setBankIFSC(String bankIFSC) { this.bankIFSC = bankIFSC; }

    public String getBankName() { return bankName; }
    public void setBankName(String bankName) { this.bankName = bankName; }

    public String getBankBranch() { return bankBranch; }
    public void setBankBranch(String bankBranch) { this.bankBranch = bankBranch; }

    public String getAccountType() { return accountType; }
    public void setAccountType(String accountType) { this.accountType = accountType; }

    public String getServiceCategories() { return serviceCategories; }
    public void setServiceCategories(String serviceCategories) { this.serviceCategories = serviceCategories; }

    public String getOperatingRegions() { return operatingRegions; }
    public void setOperatingRegions(String operatingRegions) { this.operatingRegions = operatingRegions; }

    public Integer getTotalVolunteers() { return totalVolunteers; }
    public void setTotalVolunteers(Integer totalVolunteers) { this.totalVolunteers = totalVolunteers; }

    public Integer getTotalStaff() { return totalStaff; }
    public void setTotalStaff(Integer totalStaff) { this.totalStaff = totalStaff; }

    public String getYearsOfOperation() { return yearsOfOperation; }
    public void setYearsOfOperation(String yearsOfOperation) { this.yearsOfOperation = yearsOfOperation; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public boolean isTrustedBadge() { return trustedBadge; }
    public void setTrustedBadge(boolean trustedBadge) { this.trustedBadge = trustedBadge; }

    public LocalDateTime getRegisteredAt() { return registeredAt; }
    public void setRegisteredAt(LocalDateTime registeredAt) { this.registeredAt = registeredAt; }

    public LocalDateTime getVerifiedAt() { return verifiedAt; }
    public void setVerifiedAt(LocalDateTime verifiedAt) { this.verifiedAt = verifiedAt; }

    public List<NgoDocument> getDocuments() { return documents; }
    public void setDocuments(List<NgoDocument> documents) { this.documents = documents; }

    public List<HelpAssignment> getHelpAssignments() { return helpAssignments; }
    public void setHelpAssignments(List<HelpAssignment> helpAssignments) { this.helpAssignments = helpAssignments; }

    public List<Donation> getDonations() { return donations; }
    public void setDonations(List<Donation> donations) { this.donations = donations; }

    public List<SuccessStory> getSuccessStories() { return successStories; }
    public void setSuccessStories(List<SuccessStory> successStories) { this.successStories = successStories; }

    public List<Feedback> getFeedbacks() { return feedbacks; }
    public void setFeedbacks(List<Feedback> feedbacks) { this.feedbacks = feedbacks; }

    public Double getLatitude() { return latitude; }
    public void setLatitude(Double latitude) { this.latitude = latitude; }

    public Double getLongitude() { return longitude; }
    public void setLongitude(Double longitude) { this.longitude = longitude; }

    public LocalDateTime getLastUpdated() { return lastUpdated; }
    public void setLastUpdated(LocalDateTime lastUpdated) { this.lastUpdated = lastUpdated; }

    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
}
