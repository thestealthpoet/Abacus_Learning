package com.techelevator.dao;

import com.techelevator.model.Grade;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcGradeDao implements GradeDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcGradeDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Grade getByUserId(int userId) {
        return null;
    }

    @Override
    public Grade getByAssignmentId(int assignmentId) {
        return null;
    }
}
