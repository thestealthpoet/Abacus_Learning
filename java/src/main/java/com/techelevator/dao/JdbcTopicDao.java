package com.techelevator.dao;

import com.techelevator.model.Topic;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Component
public class JdbcTopicDao implements TopicDao{
    private JdbcTemplate jdbcTemplate;
    public JdbcTopicDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}


    @Override
    public Topic getByTopic(int topicId) {
        return null;
    }

    @Override
    public Topic getByCourse(int courseId) {
        String sql = "SELECT topic_name, topic_due_date " +
                "FROM topics " +
                "WHERE course_id = ? "+
                "ORDER BY topic_due_date";
        return null;
    }

    @Override
    public Topic getByName(String topicName) {
        return null;
    }

    @Override
    public List<Topic> getByUser(int userId) {
        return null;
    }

    private Topic mapRowToTopic(SqlRowSet results) {
        Topic topic = new Topic();
        topic.setTopicId(results.getInt("topic_id"));
        topic.setCourseId(results.getInt("course_id"));
        topic.setTopicName(results.getString("topic_name"));
        topic.setTopicDescription(results.getString("description"));
        topic.setTopicDueDate(LocalDate.parse(results.getString("due_date")));
        topic.setTopicTeachDate(LocalDate.parse(results.getString("teach_date")));
        return topic;
    }
}
