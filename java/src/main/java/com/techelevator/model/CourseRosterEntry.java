package com.techelevator.model;

public class CourseRosterEntry {

    private int userId;
    private int courseId;

    public CourseRosterEntry(int userId, int courseId) {
        this.userId = userId;
        this.courseId = courseId;
    }

    public CourseRosterEntry() { }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }
}
