package com.techelevator.dao;

import com.techelevator.model.CourseRosterEntry;

import java.util.List;

public interface RegisterDao {

    void registerUsersToCourse(List<CourseRosterEntry> rosterEntries);
}
