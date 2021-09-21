package com.techelevator.dao;

import com.techelevator.model.Topic;
import org.springframework.stereotype.Component;

@Component
public class JdbcTopicDao implements TopicDao{
    @Override
    public Topic getByTopic(int topicId) {
        return null;
    }

    @Override
    public Topic getByCourse(int courseId) {
        return null;
    }

    @Override
    public Topic getByName(String topicName) {
        return null;
    }
}
