package com.examhub.impl;

import static com.examhub.utility.DatabaseConnection.establishConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.examhub.dao.ResultDao;
import com.examhub.pojo.Result;

public class ResultDaoImpl implements ResultDao {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    @Override
    public boolean isTestAttempted(int testId, String studentUsername) {

        con = establishConnection();

        String query =
                "SELECT resultid FROM result " +
                "WHERE testid=? AND studentusername=? " +
                "LIMIT 1";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, testId);
            pst.setString(2, studentUsername);

            rs = pst.executeQuery();

            return rs.next();

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return false;
    }


    @Override
    public Result viewResult(int testId, String studentUsername) {

        con = establishConnection();

        /*
         * IMPORTANT:
         * If student attempts the same test multiple times,
         * latest result must be displayed.
         */
        String query =
                "SELECT resultid,testid,studentusername," +
                "maxquestion,maxmarks,attempted,correct,view,obtained " +
                "FROM result " +
                "WHERE testid=? AND studentusername=? " +
                "ORDER BY resultid DESC " +
                "LIMIT 1";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, testId);
            pst.setString(2, studentUsername);

            rs = pst.executeQuery();

            if (rs.next()) {

                Result res = new Result();

                res.setResultId(rs.getInt("resultid"));
                res.setTestId(rs.getInt("testid"));
                res.setStudUsername(rs.getString("studentusername"));
                res.setMaxQuestions(rs.getInt("maxquestion"));
                res.setMaxMarks(rs.getInt("maxmarks"));
                res.setAttempted(rs.getInt("attempted"));
                res.setCorrect(rs.getInt("correct"));
                res.setView(rs.getInt("view"));
                res.setObtained(rs.getInt("obtained"));

                return res;
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return null;
    }


    @Override
    public boolean updateResult(
            String studentUsername,
            int testId,
            int certificateId) {

        con = establishConnection();

        String query =
                "UPDATE result SET view=? " +
                "WHERE testid=? AND studentusername=?";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, certificateId);
            pst.setInt(2, testId);
            pst.setString(3, studentUsername);

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return false;
    }


    @Override
    public boolean addResult(Result result) {

        con = establishConnection();

        String query =
                "INSERT INTO result " +
                "(testid,studentusername,maxquestion,maxmarks," +
                "attempted,correct,view,obtained) " +
                "VALUES(?,?,?,?,?,?,?,?)";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, result.getTestId());
            pst.setString(2, result.getStudUsername());
            pst.setInt(3, result.getMaxQuestions());
            pst.setInt(4, result.getMaxMarks());
            pst.setInt(5, result.getAttempted());
            pst.setInt(6, result.getCorrect());
            pst.setInt(7, result.getView());
            pst.setInt(8, result.getObtained());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return false;
    }


    @Override
    public Result viewResult(int resultId) {

        con = establishConnection();

        String query =
                "SELECT resultid,testid,studentusername," +
                "maxquestion,maxmarks,attempted,correct,view,obtained " +
                "FROM result WHERE resultid=?";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, resultId);

            rs = pst.executeQuery();

            if (rs.next()) {

                Result res = new Result();

                res.setResultId(rs.getInt("resultid"));
                res.setTestId(rs.getInt("testid"));
                res.setStudUsername(rs.getString("studentusername"));
                res.setMaxQuestions(rs.getInt("maxquestion"));
                res.setMaxMarks(rs.getInt("maxmarks"));
                res.setAttempted(rs.getInt("attempted"));
                res.setCorrect(rs.getInt("correct"));
                res.setView(rs.getInt("view"));
                res.setObtained(rs.getInt("obtained"));

                return res;
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return null;
    }


    @Override
    public List<Result> viewAllResults() {

        List<Result> listOfAllResult =
                new ArrayList<Result>();

        con = establishConnection();

        String query =
                "SELECT resultid,testid,studentusername," +
                "maxquestion,maxmarks,attempted,correct,view,obtained " +
                "FROM result " +
                "ORDER BY resultid DESC";

        try {

            pst = con.prepareStatement(query);

            rs = pst.executeQuery();

            while (rs.next()) {

                Result res = new Result();

                res.setResultId(rs.getInt("resultid"));
                res.setTestId(rs.getInt("testid"));
                res.setStudUsername(rs.getString("studentusername"));
                res.setMaxQuestions(rs.getInt("maxquestion"));
                res.setMaxMarks(rs.getInt("maxmarks"));
                res.setAttempted(rs.getInt("attempted"));
                res.setCorrect(rs.getInt("correct"));
                res.setView(rs.getInt("view"));
                res.setObtained(rs.getInt("obtained"));

                listOfAllResult.add(res);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return listOfAllResult;
    }


    @Override
    public List<Result> viewAllResults(int testId) {

        List<Result> listOfResults =
                new ArrayList<Result>();

        con = establishConnection();

        /*
         * Highest score first.
         * resultid DESC is used as a stable tie-breaker.
         */
        String query =
                "SELECT resultid,testid,studentusername," +
                "maxquestion,maxmarks,attempted,correct,view,obtained " +
                "FROM result " +
                "WHERE testid=? " +
                "ORDER BY obtained DESC,resultid DESC";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, testId);

            rs = pst.executeQuery();

            while (rs.next()) {

                Result res = new Result();

                res.setResultId(rs.getInt("resultid"));
                res.setTestId(rs.getInt("testid"));
                res.setStudUsername(rs.getString("studentusername"));
                res.setMaxQuestions(rs.getInt("maxquestion"));
                res.setMaxMarks(rs.getInt("maxmarks"));
                res.setAttempted(rs.getInt("attempted"));
                res.setCorrect(rs.getInt("correct"));
                res.setView(rs.getInt("view"));
                res.setObtained(rs.getInt("obtained"));

                listOfResults.add(res);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return listOfResults;
    }
}