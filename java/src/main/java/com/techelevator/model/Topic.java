package com.techelevator.model;

public class Topic {

    private int topicId;
    private int courseId;
    private String topicName;



    private String topicDescription;

    public Topic() {}

    public Topic(int topicId, int courseId, String topicName, String topicDescription) {
        this.topicId = topicId;
        this.courseId = courseId;
        this.topicName = topicName;
        this.topicDescription = topicDescription;
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
                '}';
    }



}
