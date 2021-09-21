package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.model.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
@PreAuthorize("isAuthenticated()")
@CrossOrigin
public class ApplicationController {

    private TopicDao topicDao;
    private CourseDao courseDao;
    private AssignmentDao assignmentDao;
    private UserDao userDao;
    private GradeDao gradeDao;

    public ApplicationController(TopicDao topicDao, CourseDao courseDao, AssignmentDao assignmentDao, UserDao userDao, GradeDao gradeDao) {
        this.topicDao = topicDao;
        this.courseDao = courseDao;
        this.assignmentDao = assignmentDao;
        this.userDao = userDao;
        this.gradeDao = gradeDao;

    }
}
