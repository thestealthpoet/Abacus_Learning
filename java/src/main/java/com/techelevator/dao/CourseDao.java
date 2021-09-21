package com.techelevator.dao;

import com.techelevator.model.Course;

public interface CourseDao {

    Course getByCourseId(int courseId);
    Course getByUser(int userId);
}
