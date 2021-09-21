package com.techelevator.model;

import java.math.BigDecimal;

public class Assignment {

    private int assignmentId;
    private int topicId;
    private String assignmentName;
    private BigDecimal grade;
    private String dueDate;

    public Assignment() {}

    public Assignment(int assignmentId, int topicId, String assignmentName, BigDecimal grade, String dueDate) {
        this.assignmentId = assignmentId;
        this.topicId = topicId;
        this.assignmentName = assignmentName;
        this.grade = grade;
        this.dueDate = dueDate;
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

    public BigDecimal getGrade() {
        return grade;
    }

    public void setGrade(BigDecimal grade) {
        this.grade = grade;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    @Override
    public String toString() {
        return "Assignment{" +
                "assignmentId=" + assignmentId +
                ", topicId=" + topicId +
                ", assignmentName='" + assignmentName + '\'' +
                ", grade=" + grade +
                ", dueDate='" + dueDate + '\'' +
                '}';
    }




}
