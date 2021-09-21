package com.techelevator.dao;

import com.techelevator.model.Grade;

public interface GradeDao {

    Grade getByUserId(int userId);
    Grade getByAssignmentId(int assignmentId);
}
