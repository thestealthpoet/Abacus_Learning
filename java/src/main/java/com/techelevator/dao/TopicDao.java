package com.techelevator.dao;

import com.techelevator.model.Topic;

import java.util.List;

public interface TopicDao {

    Topic getByTopic (int topicId);
    List<Topic> getByCourse (int courseId);
    Topic getByName (String topicName);
    List<Topic> getByUser (int userId);
    void createTopic(Topic topic);
    List<Topic> getAllTopics();
    List<Topic> topicsByCourseAndUser(int courseId, int userId);
}
