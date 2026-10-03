package com.examhub.dao;

import java.util.List;

import com.examhub.pojo.Student;

public interface StudentDao extends AdminDao {

    boolean registerStudent(Student student);

    boolean updateProfile(Student student);

    List<Student> viewAllStudent();

    Student viewProfile(String username);

    boolean login(String username, String password);

    boolean usernameExists(String username);

    boolean changePassword(String username, String newPassword);

    String getEmailByUsername(String username);
}