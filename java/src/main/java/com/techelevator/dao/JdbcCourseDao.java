package com.techelevator.dao;

import com.techelevator.model.Course;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
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
    public void createCourse(Course course) {
        String sql = "INSERT INTO courses (" +
                "course_name, course_teacher, description, difficulty_level, class_time) " +
                "VALUES (? ,? ,?, ?, ?)";
        jdbcTemplate.update(sql, course.getCourseName(), course.getCourseTeacher(), course.getCourseDescription(),
                course.getDifficultyLevel(), course.getClassTime());

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
