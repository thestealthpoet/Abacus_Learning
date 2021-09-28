package com.techelevator.dao;

import com.techelevator.model.Course;
import com.techelevator.model.CourseRosterEntry;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.sql.PreparedStatement;
import java.util.List;
@Component
@CrossOrigin
public class JdbcRegisterDao implements RegisterDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcRegisterDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void registerUsersToCourse(CourseRosterEntry[] rosterEntries) {
        for (CourseRosterEntry entry : rosterEntries) {

            String sql = "INSERT into course_users (" +
                    "user_id, class_id) " +
                    "VALUES (?, ?);";

            jdbcTemplate.update(sql,entry.getSelectedUserId(), entry.getSelectedCourseId());

            /*jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                return ps;
            });

            jdbcTemplate.update(sql, newCourseRosterEntry);
            newCourseRosterEntry = new CourseRosterEntry();*/

        }
    }
}
