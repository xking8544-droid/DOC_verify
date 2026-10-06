package com.docuverify.model;

import java.sql.Timestamp;

/**
 * Certificate model class
 */
public class Certificate {
    private int id;
    private String certId;
    private String studentName;
    private String rollNo;
    private String courseName;
    private String category;
    private String eventName;
    private String grade;
    private String cryptoHash;
    private int issuedBy;
    private Timestamp issueDate;
    private boolean isRevoked;

    public Certificate() {}

    public String getCategory() { return category != null ? category : "Cultural"; }
    public void setCategory(String category) { this.category = category; }

    public String getEventName() { return eventName != null ? eventName : "College Event"; }
    public void setEventName(String eventName) { this.eventName = eventName; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCertId() { return certId; }
    public void setCertId(String certId) { this.certId = certId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getRollNo() { return rollNo; }
    public void setRollNo(String rollNo) { this.rollNo = rollNo; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }

    public String getCryptoHash() { return cryptoHash; }
    public void setCryptoHash(String cryptoHash) { this.cryptoHash = cryptoHash; }

    // Aliases for JSP compatibility
    public String getCertificateId() { return certId; }
    public String getHashValue() { return cryptoHash; }
    public String getCourse() { return courseName; }

    public int getIssuedBy() { return issuedBy; }
    public void setIssuedBy(int issuedBy) { this.issuedBy = issuedBy; }

    public Timestamp getIssueDate() { return issueDate; }
    public void setIssueDate(Timestamp issueDate) { this.issueDate = issueDate; }

    public boolean isRevoked() { return isRevoked; }
    public void setRevoked(boolean revoked) { isRevoked = revoked; }
}
