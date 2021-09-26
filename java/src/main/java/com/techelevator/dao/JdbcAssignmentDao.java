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
    public Assignment getByTopicId(int topicId) {
        return null;
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

    private Assignment mapRowToAssignment(SqlRowSet results) {
        Assignment assignment = new Assignment();
        assignment.setAssignmentId(results.getInt("assignment_id"));
        assignment.setTopicId(results.getInt("topic_id"));
        assignment.setAssignmentName(results.getString("assignment_name"));
        assignment.setGrade(results.getDouble("grade"));
        Timestamp timestamp = results.getTimestamp("due_date");
        try {
            LocalDateTime localDateTime = timestamp.toLocalDateTime();
            assignment.setDueDate(localDateTime);
        } catch (NullPointerException e) {
            System.out.println("null pointer");
        }
        return assignment;
    }

}
