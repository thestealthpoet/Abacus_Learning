package com.techelevator.model;

import java.time.LocalDateTime;

public class Topic {

    private int topicId;
    private int courseId;
    private String topicName;
    private String topicDescription;
    private LocalDateTime topicDueDate;
    private LocalDateTime topicTeachDate;

    public Topic() {
    }

    public Topic(int topicId, int courseId, String topicName, String topicDescription, LocalDateTime topicDueDate, LocalDateTime topicTeachDate) {
        this.topicId = topicId;
        this.courseId = courseId;
        this.topicName = topicName;
        this.topicDescription = topicDescription;
        this.topicDueDate = topicDueDate;
        this.topicTeachDate = topicTeachDate;
    }


    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getTopicDescription() {
        return topicDescription;
    }

    public LocalDateTime getTopicDueDate() {
        return topicDueDate;
    }

    public void setTopicDueDate(LocalDateTime topicDueDate) {
        this.topicDueDate = topicDueDate;
    }

    public LocalDateTime getTopicTeachDate() {
        return topicTeachDate;
    }

    public void setTopicTeachDate(LocalDateTime topicTeachDate) {
        this.topicTeachDate = topicTeachDate;
    }
    public void setTopicDescription(String topicDescription) {
        this.topicDescription = topicDescription;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "topicId=" + topicId +
                ", courseId=" + courseId +
                ", topicName='" + topicName + '\'' +
                ", topicDescription='" + topicDescription + '\'' +
                ", topicDueDate=" + topicDueDate +
                ", topicTeachDate=" + topicTeachDate +
                '}';
    }

}



