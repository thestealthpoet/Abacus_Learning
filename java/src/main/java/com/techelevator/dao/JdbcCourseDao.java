package com.techelevator.dao;

import com.techelevator.model.Course;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@CrossOrigin
public class JdbcCourseDao implements CourseDao {

    private JdbcTemplate jdbcTemplate;
    public JdbcCourseDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

    @Override
    public List<Course> getAllCourses() {
        List<Course> courseList = new ArrayList<>();
        String sql = "SELECT * FROM courses;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Course course = mapRowToCourse(results);
            courseList.add(course);
        }
        return courseList;
    }

    @Override
    public Course getByCourseId(int courseId) {
        return null;
    }

    @Override
    public Course getByUser(int userId) {
        return null;
    }

    @Override
    public List<Course>  getByTeacher(int teacherId) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses WHERE teacher_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, teacherId);
        if (results.next()) {
            Course course = mapRowToCourse(results);
            courses.add(course);
        }
        return courses;
    }

    @Override
    public List<Course> getCourseListByUserId(int userId) {
        List<Course> userCourseList = new ArrayList<>();
        String sql = "SELECT course_id, course_name, course_teacher, description, difficulty_level, class_time " +
                "FROM courses " +
                "JOIN course_users ON courses.course_id = course_users.class_id " +
                "WHERE course_users.user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            Course course = mapRowToCourse(results);
            userCourseList.add(course);
        }

        return userCourseList;
    }

    @Override
    public void createCourse(Course course) {
        //first adds course into courses table
        String sql = "INSERT INTO courses (" +
                "course_name, course_teacher, description, difficulty_level, class_time) " +
                "VALUES (? ,? ,?, ?, ?)";
        jdbcTemplate.update(sql, course.getCourseName(), course.getCourseTeacher(), course.getCourseDescription(),
                course.getDifficultyLevel(), course.getClassTime());
        //then adds into course_users table
        String sql2 = "INSERT INTO course_users (user_id, class_id) \n" +
                "SELECT course_teacher, course_id\n" +
                "FROM courses WHERE course_name = ?;";
        jdbcTemplate.update(sql2, course.getCourseName());

    }


    private Course mapRowToCourse(SqlRowSet results) {
        Course course = new Course();
        course.setCourseId(results.getInt("course_id"));
        course.setCourseName(results.getString("course_name"));
        course.setCourseTeacher(results.getInt("course_teacher"));
        course.setCourseDescription(results.getString("description"));
        course.setDifficultyLevel(results.getString("difficulty_level"));
        Timestamp timestamp = results.getTimestamp("class_time");
        assert timestamp != null;
        LocalDateTime localDateTime = timestamp.toLocalDateTime();
        course.setClassTime(localDateTime);
        return course;

    }
}
