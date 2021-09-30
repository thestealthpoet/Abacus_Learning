package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
//@PreAuthorize("isAuthenticated()")
@CrossOrigin
public class ApplicationController {

    private TopicDao topicDao;
    private CourseDao courseDao;
    private AssignmentDao assignmentDao;
    private UserDao userDao;
    private GradeDao gradeDao;
    private RosterDao rosterDao;

    public ApplicationController(TopicDao topicDao, CourseDao courseDao, AssignmentDao assignmentDao, UserDao userDao, GradeDao gradeDao, RosterDao rosterDao) {
        this.topicDao = topicDao;
        this.courseDao = courseDao;
        this.assignmentDao = assignmentDao;
        this.userDao = userDao;
        this.gradeDao = gradeDao;
        this.rosterDao = rosterDao;

    }

    //COURSE RELATED ENDPOINTS/METHODS
    @RequestMapping(path = "/courses/teach/{teachId}", method = RequestMethod.GET)
    public List<Course> getByTeacher(@PathVariable int teacherName, Principal principal) {
        int teachId = userDao.findIdByUsername(principal.getName());
        return courseDao.getByTeacher(teachId);

    }

    @RequestMapping(path = "/courses/all", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<Course> getAllCoursesList() {
        return courseDao.getAllCourses();
    }

    @RequestMapping(path = "/courses", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void createNewCourse(@Valid @RequestBody Course course) {
        courseDao.createCourse(course);
    }

    @RequestMapping(path = "/course-roster/{courseId}", method = RequestMethod.GET)
    public List<User> getCourseRoster(@PathVariable int courseId) {
        return userDao.getCourseRoster(courseId);
    }

    @RequestMapping(path = "/courses/roster/{courseId}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void createCourseRosterEntry(@RequestBody CourseRosterEntry[] courseRosterEntries , @PathVariable int courseId) {
        /*for (CourseRosterEntry entry : courseRosterEntries) {
            System.out.println(entry.getCourseId());
            System.out.println(entry.getUserId());
        }*/
        rosterDao.registerUsersToCourse(courseRosterEntries);
    }

    @RequestMapping(path = "/courses/{courseId}/roster", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<User> getUsersOnCourseRosterByCourseId(@PathVariable int courseId) {
        return rosterDao.getUsersOnCourseRosterByCourseId(courseId);
    }

    @RequestMapping(path = "/topics/courses/{courseId}", method = RequestMethod.GET)
    public List<Topic> getByCourse(@PathVariable int courseId) {
        return topicDao.getByCourse(courseId);
    }

    @RequestMapping(path = "/courses/all/{userId}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public List<Course> getAllCoursesByUserId(@PathVariable int userId) {
        return courseDao.getCourseListByUserId(userId);
    }


    //COURSE TOPIC RELATED ENDPOINTS/METHODS
    @PostMapping(path = "/topics")
    @ResponseStatus(HttpStatus.CREATED)
    public void createNewTopic(@Valid @RequestBody Topic topic) {
        topicDao.createTopic(topic);
    }

    @GetMapping(path = "/topics/all")
    @ResponseStatus(HttpStatus.OK)
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    @GetMapping(path = "/assignments/all")
    @ResponseStatus(HttpStatus.OK)
    public List<Assignment> getAllAssignments() {
        return assignmentDao.listAssignments();
    }

    @PostMapping(path = "/assignments")
    @ResponseStatus(HttpStatus.CREATED)
    public void createNewAssignment(@Valid @RequestBody Assignment assignment) {
        assignmentDao.createAssignment(assignment);
    }


    @GetMapping(path = "/topics/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public List<Topic> listTopicByUser(@Valid @PathVariable int userId) {
        return topicDao.getByUser(userId);
    }


    //USER RELATED ENDPOINTS/METHODS
    @RequestMapping(path = "/users/all")
    @ResponseStatus(HttpStatus.OK)
    public List<User> getAllUsers() {
        return userDao.findAll();
    }

    @GetMapping(path = "/assignments/user/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public List<Assignment> getByUser(@Valid @PathVariable int userId) {
        return assignmentDao.getAssignmentsByUserId(userId);
    }
    @GetMapping(path = "/assignments/{topicId}")
    @ResponseStatus(HttpStatus.OK)
    public List<Assignment> getByTopicId(@Valid @PathVariable int topicId) {
        return assignmentDao.getByTopicId(topicId);
    }

}











