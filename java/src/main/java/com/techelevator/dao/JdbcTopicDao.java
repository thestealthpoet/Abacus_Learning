package com.techelevator.dao;

import com.techelevator.model.Topic;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@CrossOrigin
@Component
public class JdbcTopicDao implements TopicDao{
    private JdbcTemplate jdbcTemplate;
    public JdbcTopicDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}


    @Override
    public Topic getByTopic(int topicId) {
        return null;
    }

    @Override
    public List<Topic> getByCourse(int courseId) {
        List<Topic> topicsList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM topics " +
                "WHERE topics.course_id = ? "+
                "ORDER BY topic_due_date";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, courseId);
        while (results.next()) {
            topicsList.add(mapRowToTopic(results));
        }
        return topicsList;
    }

    @Override
    public Topic getByName(String topicName) {
        return null;
    }

    @Override
    public List<Topic> getByUser(int userId) {
        List<Topic> topicsByUser = new ArrayList<>();

        String sql = "SELECT * FROM topics " +
                "JOIN course_users ON topics.course_id = course_users.class_id  " +
                "WHERE course_users.user_id = ? " +
                "ORDER BY course_users.class_id, topics.topic_teach_date";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            topicsByUser.add(mapRowToTopic(results));
        }
                return topicsByUser;
    }

    @Override
    public void createTopic(Topic topic) {
        String sql = "INSERT INTO topics (" +
                "course_id, topic_name, description, " +
                "topic_due_date, topic_teach_date) " +
                "VALUES(?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, topic.getCourseId(), topic.getTopicName(),
                topic.getTopicDescription(), topic.getTopicDueDate(),
                topic.getTopicTeachDate());
    }

    @Override
    public List<Topic> getAllTopics() {
        List<Topic> topicsAllList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM topics ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            topicsAllList.add(mapRowToTopic(results));
        }
        return topicsAllList;
    }

    @Override
    public List<Topic> topicsByCourseAndUser(int userId, int courseId) {
        List <Topic> topicsByUserAndCourse = new ArrayList<>();
        String sql = "SELECT * FROM topics " +
                "JOIN courses ON courses.course_id = topics.course_id " +
                "JOIN course_users ON course_users.class_id = courses.course_id " +
                "WHERE course_users.user_id = ? AND topics.course_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId, courseId);
        while (results.next()) {
            topicsByUserAndCourse.add(mapRowToTopic(results));
        }
        return topicsByUserAndCourse;
    }


    private Topic mapRowToTopic(SqlRowSet results) {
        Topic topic = new Topic();
        topic.setTopicId(results.getInt("topic_id"));
        topic.setCourseId(results.getInt("course_id"));
        topic.setTopicName(results.getString("topic_name"));
        try {
            topic.setTopicDescription(results.getString("description"));}
        catch (NullPointerException e) {
            System.out.println("another");
        }
        Timestamp timestamp = results.getTimestamp("topic_due_date");
        assert timestamp != null;
        LocalDateTime localDateTime = timestamp.toLocalDateTime();
        topic.setTopicDueDate(localDateTime);
        Timestamp timestamp1 = results.getTimestamp("topic_teach_date");

        try {
            LocalDateTime localDateTime1 = timestamp1.toLocalDateTime();
            topic.setTopicTeachDate(localDateTime1);
        } catch (NullPointerException e) {
            System.out.println("null pointer");
        }
        return topic;
    }
}
