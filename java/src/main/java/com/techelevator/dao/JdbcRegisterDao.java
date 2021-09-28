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
    public void registerUsersToCourse(List<CourseRosterEntry> rosterEntries) {
        CourseRosterEntry newCourseRosterEntry = new CourseRosterEntry();
        for (CourseRosterEntry entry : rosterEntries) {
            newCourseRosterEntry.setCourseId(entry.getCourseId());
            int courseId = newCourseRosterEntry.getCourseId();
            newCourseRosterEntry.setUserId(entry.getUserId());;
            int userId = newCourseRosterEntry.getUserId();
            String sql = "INSERT into course_users (" +
                    "user_id, class_id) " +
                    "VALUES (?, ?);";

            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                return ps;
            });

            jdbcTemplate.update(sql, newCourseRosterEntry);
            newCourseRosterEntry = new CourseRosterEntry();

        }
    }
}
