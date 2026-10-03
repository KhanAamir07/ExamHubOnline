package com.examhub.test;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examhub.dao.StudentDao;
import com.examhub.impl.StudentDaoImpl;
import com.examhub.pojo.Student;

/**
 * Servlet implementation class ManageExamStudent
 */
@WebServlet("/studentServlet")
public class StudenettServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    StudentDao studentDaoImpl = new StudentDaoImpl();

    /**
     * Default constructor
     */
    public StudenettServlet() {
        super();
    }

    /**
     * Handles GET requests
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");

        HttpSession hs = request.getSession();

        String username = (String) hs.getAttribute("studentLogin");

        if (operation != null && operation.equalsIgnoreCase("viewProfile")) {

            Student studentToEdit = studentDaoImpl.viewProfile(username);

            request.setAttribute("studentToEdit", studentToEdit);

            request.getRequestDispatcher("editProfile.jsp")
                   .forward(request, response);
        }
    }

    /**
     * Handles POST requests
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");

        /*
         * =========================
         * STUDENT REGISTRATION
         * =========================
         */
        if (operation != null && operation.equalsIgnoreCase("add")) {

            Student student = new Student();

            String contact = request.getParameter("contact");
            String password = request.getParameter("password");

            /*
             * Server-side contact validation
             */
            if (contact == null || !contact.matches("\\d{10}")) {

                request.setAttribute(
                        "studentRegisterFailedMessage",
                        "Invalid contact number. Please enter exactly 10 digits."
                );

                request.getRequestDispatcher("studentLogin.jsp")
                       .forward(request, response);

                return;
            }

            /*
             * Password validation
             */
            if (password == null || password.trim().isEmpty()) {

                request.setAttribute(
                        "studentRegisterFailedMessage",
                        "Password is required."
                );

                request.getRequestDispatcher("studentLogin.jsp")
                       .forward(request, response);

                return;
            }

            student.setName(
                    request.getParameter("studentName")
            );

            student.setUsername(
                    request.getParameter("username")
            );

            /*
             * Same hashing logic used by StudentLoginServlet
             */
            student.setPassword(
                    ((Integer) password.hashCode()).toString()
            );

            student.setAddress(
                    request.getParameter("address")
            );

            student.setGender(
                    request.getParameter("gender")
            );

            student.setDateOfBirth(
                    request.getParameter("dob")
            );

            student.setEmail(
                    request.getParameter("email")
            );

            DateFormat dateFormat =
                    new SimpleDateFormat("yyyy-MM-dd");

            student.setRegDate(
                    dateFormat.format(new Date())
            );

            student.setContact(contact);

            /*
             * Register student
             */
            if (studentDaoImpl.registerStudent(student)) {

                request.setAttribute(
                        "studentRegisterSucessMessage",
                        "Registration Successful. <br> Now Login."
                );

            } else {

                request.setAttribute(
                        "studentRegisterFailedMessage",
                        "Registration Failed! Please try again."
                );
            }

            request.getRequestDispatcher("studentLogin.jsp")
                   .forward(request, response);

            return;
        }

        /*
         * =========================
         * EDIT STUDENT PROFILE
         * =========================
         */
        else if (operation != null
                && operation.equalsIgnoreCase("editProfile")) {

            HttpSession session = request.getSession();

            String username =
                    (String) session.getAttribute("studentLogin");

            Student student = new Student();

            String contact = request.getParameter("contact");

            /*
             * Server-side contact validation
             */
            if (contact == null || !contact.matches("\\d{10}")) {

                request.setAttribute(
                        "studentEditFailedMessage",
                        "Invalid contact number. Please enter exactly 10 digits."
                );

                Student studentToEdit =
                        studentDaoImpl.viewProfile(username);

                request.setAttribute(
                        "studentToEdit",
                        studentToEdit
                );

                request.getRequestDispatcher("editProfile.jsp")
                       .forward(request, response);

                return;
            }

            student.setName(
                    request.getParameter("studentName")
            );

            student.setUsername(username);

            student.setAddress(
                    request.getParameter("address")
            );

            student.setGender(
                    request.getParameter("gender")
            );

            student.setDateOfBirth(
                    request.getParameter("dob")
            );

            student.setEmail(
                    request.getParameter("email")
            );

            student.setContact(contact);

            if (studentDaoImpl.updateProfile(student)) {

                request.setAttribute(
                        "studentEditSucessMessage",
                        "Profile Updated Successfully."
                );

                System.out.println(
                        "Student Profile Updated Successfully - Username = ["
                        + username
                        + "]"
                );

            } else {

                request.setAttribute(
                        "studentEditFailedMessage",
                        "Profile Update Failed! Please try again."
                );

                System.out.println(
                        "Student Profile Update Failed - Username = ["
                        + username
                        + "]"
                );
            }

            Student studentToEdit =
                    studentDaoImpl.viewProfile(username);

            request.setAttribute(
                    "studentToEdit",
                    studentToEdit
            );

            request.getRequestDispatcher("editProfile.jsp")
                   .forward(request, response);

            return;
        }

        /*
         * =========================
         * CHANGE PASSWORD
         * =========================
         */
        else if (operation != null
                && operation.equalsIgnoreCase("changePassword")) {

            HttpSession session = request.getSession();

            String username =
                    (String) session.getAttribute("studentLogin");

            String oldPassword =
                    request.getParameter("oldPassword");

            String newPassword =
                    request.getParameter("newPassword");

            /*
             * Validate passwords
             */
            if (oldPassword == null
                    || oldPassword.trim().isEmpty()
                    || newPassword == null
                    || newPassword.trim().isEmpty()) {

                request.setAttribute(
                        "studentChangeFailedMessage",
                        "Please enter both old and new password."
                );

                System.out.println(
                        "Student Password Change Failed - Password fields are empty"
                );

                request.getRequestDispatcher("changepassword.jsp")
                       .forward(request, response);

                return;
            }

            /*
             * Hash passwords using existing project logic
             */
            String oldPasswordHash =
                    ((Integer) oldPassword.hashCode()).toString();

            String newPasswordHash =
                    ((Integer) newPassword.hashCode()).toString();

            boolean validUser =
                    studentDaoImpl.login(
                            username,
                            oldPasswordHash
                    );

            if (validUser) {

                boolean passwordChangedStatus =
                        studentDaoImpl.changePassword(
                                username,
                                newPasswordHash
                        );

                if (passwordChangedStatus) {

                    request.setAttribute(
                            "studentChangeSucessMessage",
                            "Password Changed Successfully. <br> Please Login Again."
                    );

                    System.out.println(
                            "Student Password Changed Successfully - Username = ["
                            + username
                            + "]"
                    );

                } else {

                    request.setAttribute(
                            "studentChangeFailedMessage",
                            "Password Change Failed. <br> Please try again."
                    );

                    System.out.println(
                            "Student Password Change Failed - Username = ["
                            + username
                            + "]"
                    );
                }

            } else {

                request.setAttribute(
                        "studentChangeFailedMessage",
                        "Your Old Password is Incorrect. <br> Please try again."
                );

                System.out.println(
                        "Student Password Change Failed - Old Password Incorrect - Username = ["
                        + username
                        + "]"
                );
            }

            request.getRequestDispatcher("changepassword.jsp")
                   .forward(request, response);

            return;
        }
    }
}