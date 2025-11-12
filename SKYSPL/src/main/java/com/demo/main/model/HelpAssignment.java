package com.demo.main.model;

import jakarta.persistence.*;

@Entity
public class HelpAssignment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String helpType;
    private String status;
    private String assignedTo;
    private String notes;

    @ManyToOne
    @JoinColumn(name = "ngo_id")
    private Ngo ngo;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getHelpType() { return helpType; }
    public void setHelpType(String helpType) { this.helpType = helpType; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getAssignedTo() { return assignedTo; }
    public void setAssignedTo(String assignedTo) { this.assignedTo = assignedTo; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Ngo getNgo() { return ngo; }
    public void setNgo(Ngo ngo) { this.ngo = ngo; }
}
