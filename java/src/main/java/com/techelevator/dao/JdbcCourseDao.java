package com.techelevator.dao;

import com.techelevator.model.Course;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
@CrossOrigin
public class JdbcCourseDao implements CourseDao {

    private JdbcTemplate jdbcTemplate;
    public JdbcCourseDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

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
        //adds course into courses table
        String sql = "INSERT INTO courses (" +
                "course_name, course_teacher, description, difficulty_level, class_time) " +
                "VALUES (? ,? ,?, ?, ?)";
        jdbcTemplate.update(sql, course.getCourseName(), course.getCourseTeacher(), course.getCourseDescription(),
                course.getDifficultyLevel(), course.getClassTime());
        //adds into course_users table
        String sql2 = "INSERT INTO course_users (user_id, class_id) \n" +
                "SELECT course_teacher, course_id\n" +
                "FROM courses WHERE course_name = ?;";
        jdbcTemplate.update(sql2, course.getCourseName());

    }


    private Course mapRowToCourse(SqlRowSet results) {
        Course course = new Course();
        course.setCourseId(results.getInt("course_id"));
        course.setCourseName(results.getString("course_name"));
        course.setCourseTeacher(results.getInt("teacher_id"));
        course.setCourseDescription(results.getString("description"));
        course.setDifficultyLevel(results.getString("difficulty_level"));
        course.setClassTime(LocalDateTime.parse(results.getString("class_time")));
        return course;

    }
}
