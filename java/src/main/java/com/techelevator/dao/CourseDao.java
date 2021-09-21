package com.techelevator.dao;

import com.techelevator.model.Course;

import java.util.List;

public interface CourseDao {

    Course getByCourseId(int courseId);
    Course getByUser(int userId);
    List<Course> getByTeacher(int teacherId);
    void createCourse(Course course);

}
