package com.techelevator.model;

import java.time.LocalDateTime;

public class Grade {

    private int userId;
    private int assignmentId;
    private boolean isComplete;
    private LocalDateTime timeTurnedIn;

    public Grade() {}

    public Grade (int userId, int assignmentId, boolean isComplete, LocalDateTime timeTurnedIn) {
        this.userId = userId;
        this.assignmentId = assignmentId;
        this.isComplete = isComplete;
        this.timeTurnedIn = timeTurnedIn;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public boolean isComplete() {
        return isComplete;
    }

    public void setComplete(boolean complete) {
        isComplete = complete;
    }

    public LocalDateTime getTimeTurnedIn() {
        return timeTurnedIn;
    }

    public void setTimeTurnedIn(LocalDateTime timeTurnedIn) {
        this.timeTurnedIn = timeTurnedIn;
    }
    @Override
    public String toString() {
        return "Grade{" +
                "userId=" + userId +
                ", assignmentId=" + assignmentId +
                ", isComplete=" + isComplete +
                ", timeTurnedIn='" + timeTurnedIn + '\'' +
                '}';
    }
}
