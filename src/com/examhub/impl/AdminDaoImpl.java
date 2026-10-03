package com.examhub.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.examhub.dao.AdminDao;

import static com.examhub.utility.DatabaseConnection.establishConnection;

public class AdminDaoImpl implements AdminDao {

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
                "SELECT username FROM admin WHERE username=? AND password=?";

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
    public boolean changePassword(
            String username,
            String newPassword) {

        con = establishConnection();

        if (con == null) {
            return false;
        }

        String query =
                "UPDATE admin SET password=? WHERE username=?";

        try {

            pst = con.prepareStatement(query);

            /*
             * IMPORTANT:
             * Admin password is stored exactly as entered.
             * NO hashCode() is used here.
             */
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
                "SELECT email FROM admin WHERE username=?";

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