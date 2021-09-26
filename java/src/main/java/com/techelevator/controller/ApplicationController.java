package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.model.Course;
import com.techelevator.model.Topic;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping
//@PreAuthorize("isAuthenticated()")
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

    @RequestMapping(path = "/courses/teach/{teachId}", method= RequestMethod.GET)
    public List<Course> getByTeacher(@PathVariable int teacherName, Principal principal) {
        int teachId = userDao.findIdByUsername(principal.getName());
        return courseDao.getByTeacher(teachId);

    }

    @RequestMapping(path = "/courses", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void createNewCourse(@Valid @RequestBody Course course) {
        courseDao.createCourse(course);
    }

    @RequestMapping(path = "/course-roster/{courseId}", method= RequestMethod.GET)
    public List<User> getCourseRoster(@PathVariable int courseId) {
        return userDao.getCourseRoster(courseId);
    }

    @RequestMapping(path = "/courses/{courseId}/roster", method = RequestMethod.POST)
    public void createCourseRosterEntry(@RequestBody @PathVariable int userId, @PathVariable int courseId) {
        userDao.createRosterEntry(userId, courseId);
    }

    @RequestMapping(path ="/{course}/topics", method = RequestMethod.GET)
    public List<Topic> getTopicByCourse(@PathVariable int courseId) {
        return topicDao.getByCourse(courseId);
    }

    @RequestMapping(path="/courses/all/{userId}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<Course> getAllCoursesByUserId(@PathVariable int userId) {
        return courseDao.getCourseListByUserId(userId);
    }
    @PostMapping(path = "topics")
    @ResponseStatus(HttpStatus.CREATED)
    public void createNewTopic(@Valid @RequestBody Topic topic) {
        topicDao.createTopic(topic);
    }

    @GetMapping(path = "/topics/all")
    @ResponseStatus(HttpStatus.OK)
    public List<Topic> getAllTopics(){
        return topicDao.getAllTopics();
    }
}
