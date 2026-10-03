package com.examhub.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.examhub.dao.StudentDao;
import com.examhub.pojo.Student;

import static com.examhub.utility.DatabaseConnection.establishConnection;

public class StudentDaoImpl implements StudentDao {

    private Connection con = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;

    @Override
    public boolean login(String username, String password) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "SELECT username FROM student WHERE username=? AND password=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, username);
            pst.setString(2, password);

            rs = pst.executeQuery();

            return rs.next();

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closeResultSet();
            closePreparedStatement();
        }

        return false;
    }

    @Override
    public boolean usernameExists(String username) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "SELECT username FROM student WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, username);

            rs = pst.executeQuery();

            return rs.next();

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closeResultSet();
            closePreparedStatement();
        }

        return false;
    }

    @Override
    public boolean changePassword(String username, String newPassword) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "UPDATE student SET password=? WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, newPassword);
            pst.setString(2, username);

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closePreparedStatement();
        }

        return false;
    }

    @Override
    public String getEmailByUsername(String username) {

        con = establishConnection();

        if (con == null) {
            return null;
        }

        String query =
                "SELECT email FROM student WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, username);

            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getString("email");
            }

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closeResultSet();
            closePreparedStatement();
        }

        return null;
    }

    @Override
    public boolean registerStudent(Student student) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "INSERT INTO student "
                + "(username, password, name, address, gender, dateofbirth, email, contact, regdate) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {

            con.setAutoCommit(true);

            pst = con.prepareStatement(query);

            pst.setString(1, student.getUsername());
            pst.setString(2, student.getPassword());
            pst.setString(3, student.getName());
            pst.setString(4, student.getAddress());
            pst.setString(5, student.getGender());
            pst.setString(6, student.getDateOfBirth());
            pst.setString(7, student.getEmail());
            pst.setString(8, student.getContact());
            pst.setString(9, student.getRegDate());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closePreparedStatement();
        }

        return false;
    }

    @Override
    public boolean updateProfile(Student student) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "UPDATE student SET "
                + "name=?, address=?, gender=?, dateofbirth=?, email=?, contact=? "
                + "WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, student.getName());
            pst.setString(2, student.getAddress());
            pst.setString(3, student.getGender());
            pst.setString(4, student.getDateOfBirth());
            pst.setString(5, student.getEmail());
            pst.setString(6, student.getContact());
            pst.setString(7, student.getUsername());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closePreparedStatement();
        }

        return false;
    }

    @Override
    public List<Student> viewAllStudent() {

        List<Student> listOfStudents =
                new ArrayList<Student>();

        con = establishConnection();

        if (con == null) {
            return listOfStudents;
        }

        String query =
                "SELECT * FROM student";

        try {

            pst = con.prepareStatement(query);

            rs = pst.executeQuery();

            while (rs.next()) {

                Student student = new Student();

                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));
                student.setName(rs.getString("name"));
                student.setAddress(rs.getString("address"));
                student.setGender(rs.getString("gender"));
                student.setDateOfBirth(rs.getString("dateofbirth"));
                student.setEmail(rs.getString("email"));
                student.setContact(rs.getString("contact"));
                student.setRegDate(rs.getString("regdate"));

                listOfStudents.add(student);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closeResultSet();
            closePreparedStatement();
        }

        return listOfStudents;
    }

    @Override
    public Student viewProfile(String username) {

        con = establishConnection();

        if (con == null) {
            return null;
        }

        String query =
                "SELECT * FROM student WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, username);

            rs = pst.executeQuery();

            if (rs.next()) {

                Student student = new Student();

                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));
                student.setName(rs.getString("name"));
                student.setAddress(rs.getString("address"));
                student.setGender(rs.getString("gender"));
                student.setDateOfBirth(rs.getString("dateofbirth"));
                student.setEmail(rs.getString("email"));
                student.setContact(rs.getString("contact"));
                student.setRegDate(rs.getString("regdate"));

                return student;
            }

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            closeResultSet();
            closePreparedStatement();
        }

        return null;
    }

    private void closeResultSet() {

        if (rs != null) {

            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            rs = null;
        }
    }

    private void closePreparedStatement() {

        if (pst != null) {

            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            pst = null;
        }
    }
}