package com.techelevator.dao;

import com.techelevator.model.Topic;
import org.springframework.jdbc.support.rowset.SqlRowSet;
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

    private Topic mapRowToTopic(SqlRowSet results) {
        Topic topic = new Topic();
        topic.setTopicId(results.getInt("topic_id"));
        topic.setCourseId(results.getInt("course_id"));
        topic.setTopicName(results.getString("topic_name"));
        topic.setTopicDescription(results.getString("description"));
        return topic;
    }
}
