package com.techelevator.dao;

import com.techelevator.model.Assignment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

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
}
