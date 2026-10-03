package com.examhub.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.dao.AdminDao;
import com.examhub.impl.AdminDaoImpl;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDao adminImpl = new AdminDaoImpl();

    public AdminLogin() {
        super();
    }

    // =========================================================
    // ADMIN LOGOUT
    // =========================================================

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        request.setAttribute(
                "adminLogoutSucessMessage",
                "Admin Logout Success"
        );

        request.getRequestDispatcher(
                "adminLogin.jsp"
        ).forward(request, response);
    }

    // =========================================================
    // ADMIN LOGIN
    // =========================================================

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        if (username == null
                || username.trim().isEmpty()) {

            request.setAttribute(
                    "adminLoginFailedMessage",
                    "Username is required."
            );

            request.getRequestDispatcher(
                    "adminLogin.jsp"
            ).forward(request, response);

            return;
        }

        if (password == null
                || password.trim().isEmpty()) {

            request.setAttribute(
                    "adminLoginFailedMessage",
                    "Password is required."
            );

            request.getRequestDispatcher(
                    "adminLogin.jsp"
            ).forward(request, response);

            return;
        }

        username = username.trim();

        /*
         * Admin password is stored and checked
         * as the exact password.
         *
         * NO hashCode() here.
         */
        boolean loginResult =
                adminImpl.login(
                        username,
                        password
                );

        if (loginResult) {

            /*
             * Invalidate old session
             */
            HttpSession oldSession =
                    request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            /*
             * Create fresh admin session
             */
            HttpSession session =
                    request.getSession(true);

            session.setAttribute(
                    "adminLogin",
                    username
            );

            session.setAttribute(
                    "admin",
                    username
            );

            session.setAttribute(
                    "adminUsername",
                    username
            );

            request.setAttribute(
                    "adminLoginSucessMessage",
                    "Admin Login Success"
            );

            System.out.println(
                    "Admin Login Success"
            );

            /*
             * Existing project page
             */
            request.getRequestDispatcher(
                    "home.jsp"
            ).forward(request, response);

        } else {

            request.setAttribute(
                    "adminLoginFailedMessage",
                    "Incorrect username or password."
            );

            System.out.println(
                    "Admin Login Failed"
            );

            request.getRequestDispatcher(
                    "adminLogin.jsp"
            ).forward(request, response);
        }
    }
}