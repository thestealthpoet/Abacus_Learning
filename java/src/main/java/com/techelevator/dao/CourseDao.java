package com.techelevator.dao;

import com.techelevator.model.Course;

import java.util.List;

public interface CourseDao {

    Course getByCourseId(int courseId);
    Course getByUser(int userId);
    List<Course> getAllCourses();
    List<Course> getByTeacher(int teacherId);
    List<Course> getCourseListByUserId(int userId);
    void createCourse(Course course);


}
