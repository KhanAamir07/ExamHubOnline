package com.examhub.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.examhub.dao.TestDao;
import com.examhub.pojo.Test;

import static com.examhub.utility.DatabaseConnection.establishConnection;

public class TestDaoImpl implements TestDao {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public boolean createTest(Test test) {

        con = establishConnection();

        String query = "insert into test "
                + "(testname,testtype,maxquestion,maxmarks,duration,testfee,examid,open,closes) "
                + "values(?,?,?,?,?,?,?,?,?)";

        String openDate = dateFormat.format(test.getOpen());
        String closeDate = dateFormat.format(test.getclose());

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, test.getTestName());
            pst.setString(2, test.getTestType());
            pst.setInt(3, test.getMaxQuestion());
            pst.setInt(4, test.getMaxMarks());
            pst.setInt(5, test.getDuration());
            pst.setInt(6, test.getTestFee());
            pst.setInt(7, test.getExamId());
            pst.setString(8, openDate);

            if (closeDate.equalsIgnoreCase("0001-01-01")) {
                pst.setString(9, "no CLosing Date");
            } else {
                pst.setString(9, closeDate);
            }

            int rowsAffected = pst.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateTest(Test test) {

        con = establishConnection();

        String query = "update test set "
                + "testname=?,"
                + "testtype=?,"
                + "maxquestion=?,"
                + "maxmarks=?,"
                + "duration=?,"
                + "testfee=?,"
                + "examid=?,"
                + "open=?,"
                + "closes=? "
                + "where testid=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, test.getTestName());
            pst.setString(2, test.getTestType());
            pst.setInt(3, test.getMaxQuestion());
            pst.setInt(4, test.getMaxMarks());
            pst.setInt(5, test.getDuration());
            pst.setInt(6, test.getTestFee());
            pst.setInt(7, test.getExamId());

            String openDate = dateFormat.format(test.getOpen());
            String closeDate = dateFormat.format(test.getclose());

            pst.setString(8, openDate);

            if (closeDate.equalsIgnoreCase("0001-01-01")) {
                pst.setString(9, "no CLosing Date");
            } else {
                pst.setString(9, closeDate);
            }

            pst.setInt(10, test.getTestId());

            int rowsAffected = pst.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean daleteTest(int testId) {

        con = establishConnection();

        String query = "delete from test where testid=?";

        try {

            pst = con.prepareStatement(query);
            pst.setInt(1, testId);

            int rowsAffected = pst.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteTestByExam(int examId) {

        con = establishConnection();

        String query = "delete from test where examid=?";

        try {

            pst = con.prepareStatement(query);
            pst.setInt(1, examId);

            int rowsAffected = pst.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Test viewTest(int testId) {

        Test test = null;

        con = establishConnection();

        String query = "select * from test where testid=?";

        try {

            pst = con.prepareStatement(query);
            pst.setInt(1, testId);

            rs = pst.executeQuery();

            if (rs.next()) {
                test = mapTest(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    @Override
    public List<Test> viewAllTest() {

        List<Test> listOfAllTest = new ArrayList<Test>();

        con = establishConnection();

        String query = "select * from test";

        try {

            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {

                Test test = mapTest(rs);

                if (test != null) {
                    listOfAllTest.add(test);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfAllTest;
    }

    @Override
    public List<Test> viewAllUpcomingTest() {

        List<Test> listOfAllTest = new ArrayList<Test>();

        con = establishConnection();

        /*
         * Show Practice Tests which are:
         *
         * 1. Already opened today or earlier
         * 2. Not closed yet
         *
         * This fixes the old problem where:
         *
         * testtype = 'practice'
         *
         * was used while database contains:
         *
         * 'Practice Test'
         *
         * Also, comparing yyyy-MM-dd midnight with new Date()
         * was excluding tests opened today.
         */

        String query =
                "select * from test "
                + "where lower(trim(testtype)) = 'practice test' "
                + "and STR_TO_DATE(open,'%Y-%m-%d') <= CURDATE() "
                + "and ("
                + "closes = 'no CLosing Date' "
                + "or STR_TO_DATE(closes,'%Y-%m-%d') >= CURDATE()"
                + ") "
                + "order by STR_TO_DATE(open,'%Y-%m-%d') asc";

        try {

            pst = con.prepareStatement(query);

            rs = pst.executeQuery();

            while (rs.next()) {

                Test test = mapTest(rs);

                if (test != null) {
                    listOfAllTest.add(test);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return listOfAllTest;
    }

    @Override
    public List<Test> viewAllTest(String type) {

        List<Test> listOfAllTest = new ArrayList<Test>();

        con = establishConnection();

        /*
         * Return tests of selected type which are already opened
         * and are still active.
         */

        String query =
                "select * from test "
                + "where lower(trim(testtype)) = lower(trim(?)) "
                + "and STR_TO_DATE(open,'%Y-%m-%d') <= CURDATE() "
                + "and ("
                + "closes = 'no CLosing Date' "
                + "or STR_TO_DATE(closes,'%Y-%m-%d') >= CURDATE()"
                + ") "
                + "order by STR_TO_DATE(open,'%Y-%m-%d') asc";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, type);

            rs = pst.executeQuery();

            while (rs.next()) {

                Test test = mapTest(rs);

                if (test != null) {
                    listOfAllTest.add(test);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfAllTest;
    }

    @Override
    public List<Test> viewAllTest(String type, int examId) {

        List<Test> listOfAllTest = new ArrayList<Test>();

        con = establishConnection();

        String query =
                "select * from test "
                + "where lower(trim(testtype)) = lower(trim(?)) "
                + "and examid=? "
                + "order by STR_TO_DATE(open,'%Y-%m-%d') asc";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, type);
            pst.setInt(2, examId);

            rs = pst.executeQuery();

            while (rs.next()) {

                Test test = mapTest(rs);

                if (test != null) {
                    listOfAllTest.add(test);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfAllTest;
    }

    @Override
    public List<Test> viewAllTest(int examId) {

        List<Test> listOfAllTest = new ArrayList<Test>();

        con = establishConnection();

        String query =
                "select * from test "
                + "where examid=? "
                + "order by STR_TO_DATE(open,'%Y-%m-%d') asc";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, examId);

            rs = pst.executeQuery();

            while (rs.next()) {

                Test test = mapTest(rs);

                if (test != null) {
                    listOfAllTest.add(test);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listOfAllTest;
    }

    /*
     * ============================================================
     * COMMON TEST MAPPER
     * ============================================================
     */

    private Test mapTest(ResultSet rs) throws SQLException, ParseException {

        Test test = new Test();

        test.setTestId(rs.getInt(1));

        test.setTestName(rs.getString(2));

        test.setTestType(rs.getString(3));

        test.setMaxQuestion(rs.getInt(4));

        test.setMaxMarks(rs.getInt(5));

        test.setDuration(rs.getInt(6));

        test.setTestFee(rs.getInt(7));

        test.setExamId(rs.getInt(8));

        /*
         * OPEN DATE
         */

        String openDateString = rs.getString(9);

        if (openDateString != null
                && !openDateString.trim().isEmpty()) {

            Date openDate = dateFormat.parse(openDateString);

            test.setOpen(openDate);
        }

        /*
         * CLOSE DATE
         */

        String closeDateString = rs.getString(10);

        if (closeDateString == null
                || closeDateString.trim().isEmpty()
                || closeDateString.equalsIgnoreCase("no CLosing Date")) {

            test.setclose(dateFormat.parse("0001-01-01"));

        } else {

            Date closeDate = dateFormat.parse(closeDateString);

            test.setclose(closeDate);
        }

        return test;
    }
}