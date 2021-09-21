package com.techelevator.dao;

import com.techelevator.model.Assignment;
import org.springframework.cglib.core.Local;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
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
        return null;
    }

    private Assignment mapRowToAssignment(SqlRowSet results) {
        Assignment assignment = new Assignment();
        assignment.setAssignmentId(results.getInt("assignment_id"));
        assignment.setTopicId(results.getInt("topic_id"));
        assignment.setAssignmentName(results.getString("assignment_name"));
        assignment.setGrade(results.getBigDecimal("grade"));
        assignment.setDueDate(LocalDateTime.parse(results.getString("due_date")));
        return assignment;
    }

}
