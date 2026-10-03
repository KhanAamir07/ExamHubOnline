package com.examhub.test;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.impl.AdminDaoImpl;
import com.examhub.impl.StudentDaoImpl;
import com.examhub.utility.EmailUtil;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final long OTP_VALIDITY = 10 * 60 * 1000L;

    private final StudentDaoImpl studentDao = new StudentDaoImpl();

    private final AdminDaoImpl adminDao = new AdminDaoImpl();

    private final SecureRandom secureRandom = new SecureRandom();

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "forgotPassword.jsp"
        ).forward(request, response);
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String operation =
                request.getParameter("operation");

        if (operation == null || operation.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword"
            );

            return;
        }

        if (operation.equalsIgnoreCase("sendOtp")) {

            sendOtp(request, response);

        } else if (operation.equalsIgnoreCase("verifyOtp")) {

            verifyOtp(request, response);

        } else if (operation.equalsIgnoreCase("resetPassword")) {

            resetPassword(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword"
            );
        }
    }

    // =========================================================
    // SEND OTP
    // =========================================================

    private void sendOtp(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accountType =
                request.getParameter("accountType");

        String username =
                request.getParameter("username");

        String email =
                request.getParameter("email");

        // -----------------------------------------------------
        // Basic validation
        // -----------------------------------------------------

        if (accountType == null
                || username == null
                || email == null
                || accountType.trim().isEmpty()
                || username.trim().isEmpty()
                || email.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter Account Type, Username and Registered Email."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        accountType = accountType.trim();
        username = username.trim();
        email = email.trim();

        String registeredEmail = null;

        // -----------------------------------------------------
        // Get registered email from database
        // -----------------------------------------------------

        if (accountType.equalsIgnoreCase("student")) {

            registeredEmail =
                    studentDao.getEmailByUsername(username);

        } else if (accountType.equalsIgnoreCase("admin")) {

            registeredEmail =
                    adminDao.getEmailByUsername(username);

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid account type. Please select Student or Administrator."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Username check
        // -----------------------------------------------------

        if (registeredEmail == null
                || registeredEmail.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Username not found. Please enter a valid registered username."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Email check
        // -----------------------------------------------------

        if (!registeredEmail.trim()
                .equalsIgnoreCase(email)) {

            request.setAttribute(
                    "errorMessage",
                    "Incorrect email address. Please enter the email registered with this username."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Generate secure 6 digit OTP
        // -----------------------------------------------------

        String otp = String.format(
                "%06d",
                secureRandom.nextInt(1000000)
        );

        // -----------------------------------------------------
        // Send OTP
        // -----------------------------------------------------

        boolean emailSent =
                EmailUtil.sendOtp(
                        registeredEmail.trim(),
                        otp
                );

        if (!emailSent) {

            request.setAttribute(
                    "errorMessage",
                    "We could not send the OTP right now. Please try again later."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Store OTP information in session
        // -----------------------------------------------------

        HttpSession session =
                request.getSession(true);

        session.setAttribute(
                "forgotUsername",
                username
        );

        session.setAttribute(
                "forgotAccountType",
                accountType
        );

        session.setAttribute(
                "forgotEmail",
                registeredEmail.trim()
        );

        session.setAttribute(
                "forgotOtp",
                otp
        );

        session.setAttribute(
                "forgotOtpTime",
                System.currentTimeMillis()
        );

        session.setAttribute(
                "otpVerified",
                false
        );

        // -----------------------------------------------------
        // Go to OTP page
        // -----------------------------------------------------

        response.sendRedirect(
                request.getContextPath()
                + "/verifyOtp.jsp"
        );
    }

    // =========================================================
    // VERIFY OTP
    // =========================================================

    private void verifyOtp(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword"
            );

            return;
        }

        String enteredOtp =
                request.getParameter("otp");

        String savedOtp =
                (String) session.getAttribute(
                        "forgotOtp"
                );

        Long otpTime =
                (Long) session.getAttribute(
                        "forgotOtpTime"
                );

        // -----------------------------------------------------
        // OTP session check
        // -----------------------------------------------------

        if (enteredOtp == null
                || enteredOtp.trim().isEmpty()
                || savedOtp == null
                || otpTime == null) {

            request.setAttribute(
                    "errorMessage",
                    "OTP session expired. Please request a new OTP."
            );

            request.getRequestDispatcher(
                    "verifyOtp.jsp"
            ).forward(request, response);

            return;
        }

        enteredOtp = enteredOtp.trim();

        // -----------------------------------------------------
        // OTP expiry check
        // -----------------------------------------------------

        long currentTime =
                System.currentTimeMillis();

        if ((currentTime - otpTime)
                > OTP_VALIDITY) {

            session.removeAttribute("forgotOtp");
            session.removeAttribute("forgotOtpTime");
            session.setAttribute("otpVerified", false);

            request.setAttribute(
                    "errorMessage",
                    "Your OTP has expired. Please request a new OTP."
            );

            request.getRequestDispatcher(
                    "verifyOtp.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // OTP comparison
        // -----------------------------------------------------

        if (!savedOtp.equals(enteredOtp)) {

            request.setAttribute(
                    "errorMessage",
                    "Incorrect OTP. Please enter the 6-digit OTP sent to your registered email."
            );

            request.getRequestDispatcher(
                    "verifyOtp.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // OTP verified
        // -----------------------------------------------------

        session.setAttribute(
                "otpVerified",
                true
        );

        session.removeAttribute(
                "forgotOtp"
        );

        session.removeAttribute(
                "forgotOtpTime"
        );

        response.sendRedirect(
                request.getContextPath()
                + "/resetPassword.jsp"
        );
    }

    // =========================================================
    // RESET PASSWORD
    // =========================================================

    private void resetPassword(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword"
            );

            return;
        }

        Boolean otpVerified =
                (Boolean) session.getAttribute(
                        "otpVerified"
                );

        // -----------------------------------------------------
        // OTP verification required
        // -----------------------------------------------------

        if (!Boolean.TRUE.equals(otpVerified)) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword"
            );

            return;
        }

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");

        // -----------------------------------------------------
        // Empty password check
        // -----------------------------------------------------

        if (newPassword == null
                || confirmPassword == null
                || newPassword.trim().isEmpty()
                || confirmPassword.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please enter both New Password and Confirm Password."
            );

            request.getRequestDispatcher(
                    "resetPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Password match
        // -----------------------------------------------------

        if (!newPassword.equals(confirmPassword)) {

            request.setAttribute(
                    "errorMessage",
                    "New Password and Confirm Password do not match."
            );

            request.getRequestDispatcher(
                    "resetPassword.jsp"
            ).forward(request, response);

            return;
        }

        // -----------------------------------------------------
        // Password validation
        // -----------------------------------------------------

        if (!newPassword.matches(
                "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@#$%^&*])[A-Za-z0-9@#$%^&*]{5,15}$"
        )) {

            request.setAttribute(
                    "errorMessage",
                    "Password must be 5 to 15 characters and contain at least one letter, one number and one special character."
            );

            request.getRequestDispatcher(
                    "resetPassword.jsp"
            ).forward(request, response);

            return;
        }

        String username =
                (String) session.getAttribute(
                        "forgotUsername"
                );

        String accountType =
                (String) session.getAttribute(
                        "forgotAccountType"
                );

        // -----------------------------------------------------
        // Session validation
        // -----------------------------------------------------

        if (username == null
                || username.trim().isEmpty()
                || accountType == null
                || accountType.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Password reset session expired. Please start the process again."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

            return;
        }

        username = username.trim();

        boolean changed = false;

        // =====================================================
        // STUDENT
        // =====================================================

        if (accountType.equalsIgnoreCase("student")) {

            /*
             * Existing StudentLoginServlet uses password.hashCode().
             * Therefore student reset password must also be stored
             * using the same hashCode() format.
             */

            String hashedPassword =
                    Integer.valueOf(
                            newPassword.hashCode()
                    ).toString();

            changed =
                    studentDao.changePassword(
                            username,
                            hashedPassword
                    );
        }

        // =====================================================
        // ADMIN
        // =====================================================

        else if (accountType.equalsIgnoreCase("admin")) {

            /*
             * Admin password is stored exactly as entered.
             *
             * NO hashCode()
             * NO conversion
             */

            changed =
                    adminDao.changePassword(
                            username,
                            newPassword
                    );
        }

        // =====================================================
        // SUCCESS
        // =====================================================

        if (changed) {

            session.removeAttribute(
                    "forgotUsername"
            );

            session.removeAttribute(
                    "forgotAccountType"
            );

            session.removeAttribute(
                    "forgotEmail"
            );

            session.removeAttribute(
                    "otpVerified"
            );

            request.setAttribute(
                    "successMessage",
                    "Your password has been reset successfully. Please login with your new password."
            );

            request.getRequestDispatcher(
                    "forgotPassword.jsp"
            ).forward(request, response);

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Password reset failed. Please try again."
            );

            request.getRequestDispatcher(
                    "resetPassword.jsp"
            ).forward(request, response);
        }
    }
}