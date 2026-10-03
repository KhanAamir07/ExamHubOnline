package com.examhub.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.impl.AdminDaoImpl;

@WebServlet("/auth")
public class Auth extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDaoImpl adminImpl = new AdminDaoImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String logout = request.getParameter("logout");

        if (login != null) {

            adminLogin(request, response);

        } else if (logout != null) {

            adminLogout(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/adminLogin.jsp"
            );
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");

        if (login != null) {

            adminLogin(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/adminLogin.jsp"
            );
        }
    }

    private void adminLogin(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Username validation
        if (username == null || username.trim().isEmpty()) {

            request.setAttribute(
                    "adminLoginFailedMessage",
                    "Username is required."
            );

            request.getRequestDispatcher(
                    "adminLogin.jsp"
            ).forward(request, response);

            return;
        }

        // Password validation
        if (password == null || password.trim().isEmpty()) {

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
         * ADMIN PASSWORD:
         *
         * Password is NOT hashed here.
         * The exact password entered by the admin
         * is sent to AdminDaoImpl.
         */
        boolean loginSuccess =
                adminImpl.login(username, password);

        if (loginSuccess) {

            /*
             * Create session
             */
            HttpSession oldSession =
                    request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession session =
                    request.getSession(true);

            /*
             * Keep all commonly used admin session attributes
             * so existing admin pages are not affected.
             */
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
                    "Admin Login Successfully"
            );

            System.out.println(
                    "Admin Login Successfully"
            );

            /*
             * IMPORTANT:
             * adminHome.jsp does not exist in WebContent.
             * home.jsp exists, so forward to home.jsp.
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

    private void adminLogout(
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
                "Admin Logout Successfully"
        );

        request.getRequestDispatcher(
                "adminLogin.jsp"
        ).forward(request, response);
    }
}