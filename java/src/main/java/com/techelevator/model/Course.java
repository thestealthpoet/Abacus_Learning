package com.techelevator.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Course {

    private int courseId;
    private String courseName;
    private String courseDescription;
    private String difficultyLevel;
    private LocalDateTime classTime;
    private int courseTeacher;


    public Course() {}

    public Course(int courseId, String courseName, String courseDescription, String difficultyLevel, LocalDateTime classTime, int courseTeacher) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseDescription = courseDescription;
        this.difficultyLevel = difficultyLevel;
        this.classTime = classTime;
        this.courseTeacher = courseTeacher;
    }

    public int getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(int courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }

    public String getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(String difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public LocalDateTime getClassTime() {
        return classTime;
    }

    public void setClassTime(LocalDateTime classTime) {
        this.classTime = classTime;
    }
    @Override
    public String toString() {
        return "Course{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", courseDescription='" + courseDescription + '\'' +
                ", difficultyLevel='" + difficultyLevel + '\'' +
                ", classTime='" + classTime + '\'' +
                ", courseTeacher='" + courseTeacher + '\'' +
                '}';
    }





}
