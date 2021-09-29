package com.techelevator.model;

public class CourseRosterEntry {

    private int selectedUserId;
    private int selectedCourseId;

    public CourseRosterEntry(int userId, int courseId) {
        this.selectedUserId = userId;
        this.selectedCourseId = courseId;
    }

    public int getSelectedUserId() {
        return selectedUserId;
    }

    public void setSelectedUserId(int selectedUserId) {
        this.selectedUserId = selectedUserId;
    }

    public int getSelectedCourseId() {
        return selectedCourseId;
    }

    public void setSelectedCourseId(int selectedCourseId) {
        this.selectedCourseId = selectedCourseId;
    }
}
