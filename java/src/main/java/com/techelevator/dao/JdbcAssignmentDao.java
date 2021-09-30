package com.techelevator.dao;

import com.techelevator.model.Assignment;
import com.techelevator.model.Course;
import org.springframework.cglib.core.Local;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcAssignmentDao implements AssignmentDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcAssignmentDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Assignment getByAssignmentId(int assignmentId) {
        return null;
    }

    @Override
    public List<Assignment> getByTopicId(int topicId) {
        List<Assignment> assignmentList = new ArrayList<>();
        String sql = "SELECT * FROM assignments WHERE assignments.topic_id = ? ORDER BY assignments.due_date";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, topicId);
        while (results.next()) {
            Assignment assignment = mapRowToAssignment(results);
            assignmentList.add(assignment);
        }
        return assignmentList;
    }

    @Override
    public List<Assignment> listAssignments() {
        List<Assignment> assignmentList = new ArrayList<>();
        String sql = "SELECT * FROM assignments;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Assignment assignment = mapRowToAssignment(results);
            assignmentList.add(assignment);
        }
        return assignmentList;
    }

    @Override
    public void createAssignment(Assignment assignment) {
        String sql = "INSERT INTO assignments (" +
                "topic_id, assignment_name, " +
                "due_date, assignment_type) " +
                "VALUES(?, ?, ?, ?)";
        jdbcTemplate.update(sql, assignment.getTopicId(), assignment.getAssignmentName(),
                 assignment.getDueDate(), assignment.getAssignmentType());

    }

    @Override
    public List<Assignment> getAssignmentsByUserId(int userId) {
        List<Assignment> assignmentList = new ArrayList<>();
        String sql = "SELECT * FROM assignments " +
                                "JOIN topics ON assignments.topic_id = topics.topic_id " +
                                "JOIN courses ON topics.course_id = courses.course_id " +
                                "JOIN course_users ON courses.course_id = course_users.class_id " +
                                "WHERE course_users.user_id = ? " +
                                "ORDER BY courses.course_id, assignments.due_date";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            Assignment assignment = mapRowToAssignment(results);
            assignmentList.add(assignment);
        }
        return assignmentList;
    }

    private Assignment mapRowToAssignment(SqlRowSet results) {
        Assignment assignment = new Assignment();
        assignment.setAssignmentId(results.getInt("assignment_id"));
        assignment.setTopicId(results.getInt("topic_id"));
        assignment.setAssignmentName(results.getString("assignment_name"));
        //assignment.setGrade(results.getDouble("grade"));
        Timestamp timestamp = results.getTimestamp("due_date");
        try {
            LocalDateTime localDateTime = timestamp.toLocalDateTime();
            assignment.setDueDate(localDateTime);
        } catch (NullPointerException e) {
            System.out.println("null pointer");
        }
        assignment.setAssignmentType(results.getString("assignment_type"));
        return assignment;
    }

}
