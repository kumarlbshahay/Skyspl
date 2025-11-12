package com.demo.main.model;

import jakarta.persistence.*;

@Entity
public class NgoDocument {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String documentType;
    private String filePath;

    @ManyToOne
    @JoinColumn(name = "ngo_id")
    private Ngo ngo;

    // Constructors
    public NgoDocument() {
        // Required by JPA
    }

    public NgoDocument(String documentType, String filePath, Ngo ngo) {
        this.documentType = documentType;
        this.filePath = filePath;
        this.ngo = ngo;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Ngo getNgo() {
        return ngo;
    }

    public void setNgo(Ngo ngo) {
        this.ngo = ngo;
    }
}
