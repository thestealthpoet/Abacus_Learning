package com.techelevator.dao;

import com.techelevator.model.Assignment;

import java.math.BigDecimal;
import java.util.List;

public interface AssignmentDao {

    Assignment getByAssignmentId(int assignmentId);
    List<Assignment> getByTopicId(int topicId);
    public List<Assignment> listAssignments();
    void createAssignment(Assignment assignment);
    public List<Assignment> getAssignmentsByUserId(int userId);

}
