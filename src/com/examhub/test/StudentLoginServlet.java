package com.examhub.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.impl.StudentDaoImpl;

@WebServlet("/studentLogin")
public class StudentLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDaoImpl studentImpl = new StudentDaoImpl();

    public StudentLoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");

        if (operation != null && operation.equalsIgnoreCase("logout")) {

            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            request.setAttribute(
                    "studentLogoutSucessMessage",
                    "Student Logout Successfully"
            );

            request.getRequestDispatcher("studentHome.jsp")
                   .forward(request, response);

        } else {

            request.getRequestDispatcher("studentHome.jsp")
                   .forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty()) {

            request.setAttribute(
                    "studentLoginFailedMessage",
                    "Student Login Failed! Please enter your username."
            );

            request.getRequestDispatcher("studentLogin.jsp")
                   .forward(request, response);

            return;
        }

        if (password == null || password.trim().isEmpty()) {

            request.setAttribute(
                    "studentLoginFailedMessage",
                    "Student Login Failed! Please enter your password."
            );

            request.getRequestDispatcher("studentLogin.jsp")
                   .forward(request, response);

            return;
        }

        username = username.trim();

        if (operation != null && operation.equalsIgnoreCase("login")) {

            // First check whether username exists
            if (!studentImpl.usernameExists(username)) {

                request.setAttribute(
                        "studentLoginFailedMessage",
                        "Student Login Failed! Username not found."
                );

                System.out.println("Student Login Failed - Username not found");

                request.getRequestDispatcher("studentLogin.jsp")
                       .forward(request, response);

                return;
            }

            // Same password hashing logic used during student registration
            String hashedPassword =
                    Integer.valueOf(password.hashCode()).toString();

            // Check password
            if (studentImpl.login(username, hashedPassword)) {

                HttpSession oldSession = request.getSession(false);

                if (oldSession != null) {
                    oldSession.invalidate();
                }

                HttpSession session = request.getSession(true);

                session.setAttribute("studentLogin", username);

                request.setAttribute(
                        "studentLoginSucessMessage",
                        "Student Login Successfully"
                );

                System.out.println("Student Login Successfully");

                request.getRequestDispatcher("studentHome.jsp")
                       .forward(request, response);

            } else {

                request.setAttribute(
                        "studentLoginFailedMessage",
                        "Student Login Failed! Incorrect password."
                );

                System.out.println("Student Login Failed - Incorrect password");

                request.getRequestDispatcher("studentLogin.jsp")
                       .forward(request, response);
            }
        }
    }
}