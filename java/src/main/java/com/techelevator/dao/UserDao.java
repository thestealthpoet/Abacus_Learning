package com.techelevator.dao;

import com.techelevator.model.User;

import java.util.List;

public interface UserDao {

    List<User> findAll();

    User getUserById(int userId);

    User findByUsername(String username);

    int findIdByUsername(String username);

    User findByUserEmail(String emailAddress);

    boolean create(String username, String password, String role, String emailAddress, String name);

    List<User> getCourseRoster(int courseId);

    void createRosterEntry(int userId, int courseId);
}
