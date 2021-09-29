package com.techelevator.dao;

import com.techelevator.model.Course;
import com.techelevator.model.CourseRosterEntry;
import com.techelevator.model.User;

import java.util.List;

public interface RosterDao {

    void registerUsersToCourse(CourseRosterEntry[] rosterEntries);
    List<User> getUsersOnCourseRosterByCourseId(int courseId);
}
