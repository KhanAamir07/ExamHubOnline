package com.examhub.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static Connection con = null;

    public static Connection establishConnection() {

        if (con == null) {

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/exam?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8",
                    "root",
                    "root"
                );

            } catch (ClassNotFoundException e) {

                e.printStackTrace();

            } catch (SQLException e) {

                e.printStackTrace();
            }
        }

        return con;
    }
}