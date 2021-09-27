package com.techelevator.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Assignment {
    private int assignmentId;
    private int topicId;
    private String assignmentName;
    private Double grade;
    private LocalDateTime dueDate;
    private String assignmentType;

    public Assignment() {}

    public Assignment(int assignmentId, int topicId, String assignmentName, Double grade, LocalDateTime dueDate, String assignmentType) {
        this.assignmentId = assignmentId;
        this.topicId = topicId;
        this.assignmentName = assignmentName;
        this.grade = grade;
        this.dueDate = dueDate;
        this.assignmentType = assignmentType;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public String getAssignmentName() {
        return assignmentName;
    }

    public void setAssignmentName(String assignmentName) {
        this.assignmentName = assignmentName;
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(Double grade) {
        this.grade = grade;
    }

    public LocalDateTime getDueDate() {
        return dueDate;
    }

    public String getAssignmentType() {
        return assignmentType;
    }

    public void setAssignmentType(String assignmentType) {
        this.assignmentType = assignmentType;
    }

    public void setDueDate(LocalDateTime dueDate) {
        this.dueDate = dueDate;
    }
    @Override
    public String toString() {
        return "Assignment{" +
                "assignmentId=" + assignmentId +
                ", topicId=" + topicId +
                ", assignmentName='" + assignmentName + '\'' +
                ", grade=" + grade +
                ", dueDate=" + dueDate +
                ", assignmentType='" + assignmentType + '\'' +
                '}';
    }

}
