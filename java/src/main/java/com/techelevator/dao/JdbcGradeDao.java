package com.techelevator.dao;

import com.techelevator.model.Grade;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

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

    private Grade mapRowToGrade(SqlRowSet results) {
        Grade grade = new Grade();
        grade.setUserId(results.getInt("user_id"));
        grade.setAssignmentId(results.getInt("assignment_id"));
        grade.setComplete(results.getBoolean("is_complete"));
        grade.setTimeTurnedIn(LocalDateTime.parse(results.getString("time_turned_in")));
        return grade;
    }
}
