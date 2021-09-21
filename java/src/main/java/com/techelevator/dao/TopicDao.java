package com.techelevator.dao;

import com.techelevator.model.Topic;

public interface TopicDao {

    Topic getByTopic (int topicId);
    Topic getByCourse (int courseId);
    Topic getByName (String topicName);

}
