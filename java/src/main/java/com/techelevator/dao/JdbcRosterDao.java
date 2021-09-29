package com.techelevator.dao;

import com.techelevator.model.CourseRosterEntry;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.ArrayList;
import java.util.List;

@Component
@CrossOrigin
public class JdbcRosterDao implements RosterDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcRosterDao(JdbcTemplate jdbcTemplate) {
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
    @Override
    public List<User> getUsersOnCourseRosterByCourseId(int courseId) {
        List<User> courseRoster = new ArrayList<>();
        String sql = "SELECT *\n" +
                "FROM users\n" +
                "JOIN course_users ON users.user_id = course_users.user_id\n" +
                "WHERE course_users.class_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, courseId);
        while (results.next()) {
            courseRoster.add(mapRowToUser(results));
        }
        return courseRoster;
    }



    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setName(rs.getString("name"));
        user.setEmailAddress(rs.getString("email_address"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(rs.getString("role"));
        user.setActivated(true);
        return user;
    }
}
