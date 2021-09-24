package com.techelevator.dao;

import com.techelevator.model.Topic;

import java.util.List;

public interface TopicDao {

    Topic getByTopic (int topicId);
    Topic getByCourse (int courseId);
    Topic getByName (String topicName);
    List<Topic> getByUser (int userId);

}
