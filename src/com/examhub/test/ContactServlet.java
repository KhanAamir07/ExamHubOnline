package com.examhub.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.examhub.Mailer;

@WebServlet("/contactServlet")
public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ContactServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendError(
                HttpServletResponse.SC_METHOD_NOT_ALLOWED,
                "GET method is not allowed."
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");

        try {

            String operation = request.getParameter("operation");

            if (operation == null || !operation.equalsIgnoreCase("sendmessage")) {
                response.getWriter().write("ERROR");
                return;
            }

            // Get form data
            String name = request.getParameter("fullname");
            String email = request.getParameter("mailId");
            String msg = request.getParameter("message");

            // Remove unnecessary spaces
            if (name != null) {
                name = name.trim();
            }

            if (email != null) {
                email = email.trim();
            }

            if (msg != null) {
                msg = msg.trim();
            }

            // Debug information
            System.out.println("=================================");
            System.out.println("CONTACT FORM DATA");
            System.out.println("Name    : " + name);
            System.out.println("Email   : " + email);
            System.out.println("Message : " + msg);
            System.out.println("=================================");

            // Validate name
            if (name == null || name.isEmpty()) {
                System.out.println("CONTACT EMAIL ERROR: Name is empty.");
                response.getWriter().write("ERROR");
                return;
            }

            // Validate email
            if (email == null || email.isEmpty()) {
                System.out.println("CONTACT EMAIL ERROR: Visitor email is empty.");
                response.getWriter().write("ERROR");
                return;
            }

            // Validate message
            if (msg == null || msg.isEmpty()) {
                System.out.println("CONTACT EMAIL ERROR: Message is empty.");
                response.getWriter().write("ERROR");
                return;
            }

            // Send email
            boolean sent = Mailer.main(name, email, msg);

            if (sent) {

                System.out.println("CONTACT EMAIL SUCCESS");

                response.getWriter().write("SUCCESS");

            } else {

                System.out.println("CONTACT EMAIL FAILED");

                response.getWriter().write("ERROR");
            }

        } catch (Exception e) {

            System.out.println("CONTACT SERVLET ERROR:");
            e.printStackTrace();

            response.getWriter().write("ERROR");
        }
    }
}