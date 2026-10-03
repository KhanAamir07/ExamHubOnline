package com.examhub.utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

public class EmailUtil {

    private static final String SMTP_HOST =
            "smtp.gmail.com";

    private static final int SMTP_PORT =
            465;

    private static final String EMAIL_FROM =
            "aamirkhan91613216@gmail.com";

    private static final String EMAIL_APP_PASSWORD =
            "xxxxxxxxxxxxxxxx";

    // =========================================================
    // SEND OTP
    // =========================================================

    public static boolean sendOtp(
            String recipientEmail,
            String otp) {

        if (recipientEmail == null
                || recipientEmail.trim().isEmpty()) {

            return false;
        }

        if (otp == null
                || otp.trim().isEmpty()) {

            return false;
        }

        recipientEmail = recipientEmail.trim();

        try {

            SSLSocketFactory factory =
                    (SSLSocketFactory)
                    SSLSocketFactory.getDefault();

            try (
                SSLSocket socket =
                        (SSLSocket) factory.createSocket(
                                SMTP_HOST,
                                SMTP_PORT
                        )
            ) {

                socket.startHandshake();

                BufferedReader reader =
                        new BufferedReader(
                                new InputStreamReader(
                                        socket.getInputStream(),
                                        StandardCharsets.UTF_8
                                )
                        );

                OutputStream outputStream =
                        socket.getOutputStream();

                // -------------------------------------------------
                // SMTP Greeting
                // -------------------------------------------------

                String response =
                        readResponse(reader);

                if (!isResponse(
                        response,
                        "220"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // EHLO
                // -------------------------------------------------

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                "EHLO localhost\r\n"
                        );

                if (!isResponse(
                        response,
                        "250"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // AUTH LOGIN
                // -------------------------------------------------

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                "AUTH LOGIN\r\n"
                        );

                if (!isResponse(
                        response,
                        "334"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // Gmail Email
                // -------------------------------------------------

                String encodedEmail =
                        Base64.getEncoder()
                                .encodeToString(
                                        EMAIL_FROM.getBytes(
                                                StandardCharsets.UTF_8
                                        )
                                );

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                encodedEmail + "\r\n"
                        );

                if (!isResponse(
                        response,
                        "334"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // Gmail App Password
                // -------------------------------------------------

                String encodedPassword =
                        Base64.getEncoder()
                                .encodeToString(
                                        EMAIL_APP_PASSWORD
                                                .getBytes(
                                                        StandardCharsets.UTF_8
                                                )
                                );

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                encodedPassword + "\r\n"
                        );

                if (!isResponse(
                        response,
                        "235"
                )) {

                    System.out.println(
                            "Gmail SMTP authentication failed."
                    );

                    return false;
                }

                // -------------------------------------------------
                // MAIL FROM
                // -------------------------------------------------

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                "MAIL FROM:<"
                                + EMAIL_FROM
                                + ">\r\n"
                        );

                if (!isResponse(
                        response,
                        "250"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // RCPT TO
                // -------------------------------------------------

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                "RCPT TO:<"
                                + recipientEmail
                                + ">\r\n"
                        );

                if (!isResponse(
                        response,
                        "250"
                )) {

                    return false;
                }

                // -------------------------------------------------
                // DATA
                // -------------------------------------------------

                response =
                        sendCommand(
                                outputStream,
                                reader,
                                "DATA\r\n"
                        );

                if (!isResponse(
                        response,
                        "354"
                )) {

                    return false;
                }

                // =================================================
                // EMAIL CONTENT
                // =================================================

                String subject =
                        "ExamPortal | Password Reset OTP";

                String plainTextBody =
                        "Hello,\r\n\r\n"
                        + "We received a request to reset your ExamPortal account password.\r\n\r\n"
                        + "Your One-Time Password (OTP) is: "
                        + otp
                        + "\r\n\r\n"
                        + "This OTP is valid for 10 minutes.\r\n"
                        + "Please do not share this OTP with anyone.\r\n\r\n"
                        + "If you did not request a password reset, "
                        + "you can safely ignore this email.\r\n\r\n"
                        + "Regards,\r\n"
                        + "ExamPortal Team";

                // -------------------------------------------------
                // Professional HTML Email
                // -------------------------------------------------

                String htmlBody =
                        "<!DOCTYPE html>"
                        + "<html>"
                        + "<head>"
                        + "<meta charset=\"UTF-8\">"
                        + "<meta name=\"viewport\" "
                        + "content=\"width=device-width,initial-scale=1.0\">"
                        + "</head>"

                        + "<body style=\"margin:0;"
                        + "padding:0;"
                        + "background:#f4f6f8;"
                        + "font-family:Arial,Helvetica,sans-serif;\">"

                        + "<div style=\"padding:40px 15px;"
                        + "background:#f4f6f8;\">"

                        + "<div style=\"max-width:600px;"
                        + "margin:auto;"
                        + "background:#ffffff;"
                        + "border:1px solid #e5e7eb;"
                        + "border-radius:14px;"
                        + "overflow:hidden;"
                        + "box-shadow:0 5px 25px rgba(0,0,0,0.08);\">"

                        // HEADER
                        + "<div style=\"background:#172033;"
                        + "padding:28px 25px;"
                        + "text-align:center;\">"

                        + "<div style=\"font-size:28px;"
                        + "font-weight:800;"
                        + "color:#ffffff;\">"
                        + "Exam"
                        + "<span style=\"color:#ff6b5f;\">Portal</span>"
                        + "</div>"

                        + "<div style=\"margin-top:7px;"
                        + "font-size:12px;"
                        + "color:#cfd5df;\">"
                        + "Secure Account Services"
                        + "</div>"

                        + "</div>"

                        // BODY
                        + "<div style=\"padding:35px 30px;\">"

                        + "<h2 style=\"margin:0 0 18px;"
                        + "font-size:22px;"
                        + "color:#172033;\">"
                        + "Password Reset Request"
                        + "</h2>"

                        + "<p style=\"font-size:14px;"
                        + "line-height:1.7;"
                        + "color:#555f70;"
                        + "margin:0 0 15px;\">"
                        + "Hello,"
                        + "</p>"

                        + "<p style=\"font-size:14px;"
                        + "line-height:1.7;"
                        + "color:#555f70;"
                        + "margin:0 0 25px;\">"
                        + "We received a request to reset your "
                        + "ExamPortal account password. "
                        + "Use the verification code below to continue."
                        + "</p>"

                        // OTP BOX
                        + "<div style=\"background:#fff5f3;"
                        + "border:1px solid #ffd8d2;"
                        + "border-radius:12px;"
                        + "padding:25px 15px;"
                        + "text-align:center;"
                        + "margin:25px 0;\">"

                        + "<div style=\"font-size:11px;"
                        + "font-weight:700;"
                        + "color:#7c8595;"
                        + "letter-spacing:2px;"
                        + "text-transform:uppercase;"
                        + "margin-bottom:12px;\">"
                        + "Verification Code"
                        + "</div>"

                        + "<div style=\"font-size:34px;"
                        + "font-weight:800;"
                        + "letter-spacing:8px;"
                        + "color:#172033;\">"
                        + otp
                        + "</div>"

                        + "<div style=\"font-size:12px;"
                        + "color:#c0392b;"
                        + "margin-top:12px;\">"
                        + "This code expires in 10 minutes"
                        + "</div>"

                        + "</div>"

                        + "<div style=\"background:#f8f9fb;"
                        + "border-left:4px solid #ff6b5f;"
                        + "padding:15px;"
                        + "margin-top:25px;\">"

                        + "<div style=\"font-size:13px;"
                        + "font-weight:700;"
                        + "color:#172033;"
                        + "margin-bottom:6px;\">"
                        + "Security Notice"
                        + "</div>"

                        + "<div style=\"font-size:12px;"
                        + "line-height:1.7;"
                        + "color:#697386;\">"
                        + "Never share this verification code with anyone. "
                        + "ExamPortal support will never ask you for your OTP."
                        + "</div>"

                        + "</div>"

                        + "<p style=\"font-size:13px;"
                        + "line-height:1.7;"
                        + "color:#697386;"
                        + "margin-top:25px;\">"
                        + "If you did not request a password reset, "
                        + "you can safely ignore this email."
                        + "</p>"

                        + "</div>"

                        // FOOTER
                        + "<div style=\"background:#f8f9fb;"
                        + "border-top:1px solid #e8ebef;"
                        + "padding:20px;"
                        + "text-align:center;\">"

                        + "<div style=\"font-size:12px;"
                        + "color:#697386;\">"
                        + "Regards, ExamPortal Team"
                        + "</div>"

                        + "<div style=\"font-size:11px;"
                        + "color:#9aa2af;"
                        + "margin-top:7px;\">"
                        + "This is an automated security email. "
                        + "Please do not reply."
                        + "</div>"

                        + "</div>"

                        + "</div>"
                        + "</div>"

                        + "</body>"
                        + "</html>";

                // =================================================
                // MIME EMAIL
                // =================================================

                String boundary =
                        "----ExamPortalBoundary"
                        + System.currentTimeMillis();

                String mailData =
                        "From: ExamPortal <"
                        + EMAIL_FROM
                        + ">\r\n"

                        + "To: "
                        + recipientEmail
                        + "\r\n"

                        + "Subject: "
                        + subject
                        + "\r\n"

                        + "MIME-Version: 1.0\r\n"

                        + "Content-Type: multipart/alternative; "
                        + "boundary=\""
                        + boundary
                        + "\"\r\n"

                        + "\r\n"

                        // PLAIN TEXT
                        + "--"
                        + boundary
                        + "\r\n"

                        + "Content-Type: text/plain; "
                        + "charset=UTF-8\r\n"

                        + "Content-Transfer-Encoding: 8bit\r\n"

                        + "\r\n"

                        + plainTextBody
                        + "\r\n\r\n"

                        // HTML
                        + "--"
                        + boundary
                        + "\r\n"

                        + "Content-Type: text/html; "
                        + "charset=UTF-8\r\n"

                        + "Content-Transfer-Encoding: 8bit\r\n"

                        + "\r\n"

                        + htmlBody
                        + "\r\n\r\n"

                        // END
                        + "--"
                        + boundary
                        + "--\r\n"

                        + "\r\n"

                        + ".\r\n";

                outputStream.write(
                        mailData.getBytes(
                                StandardCharsets.UTF_8
                        )
                );

                outputStream.flush();

                // -------------------------------------------------
                // Check email sending response
                // -------------------------------------------------

                response =
                        readResponse(reader);

                if (!isResponse(
                        response,
                        "250"
                )) {

                    System.out.println(
                            "SMTP email sending failed."
                    );

                    return false;
                }

                // -------------------------------------------------
                // QUIT
                // -------------------------------------------------

                sendCommand(
                        outputStream,
                        reader,
                        "QUIT\r\n"
                );

                System.out.println(
                        "OTP email sent successfully to: "
                        + recipientEmail
                );

                return true;
            }

        } catch (Exception e) {

            System.out.println(
                    "Email sending error:"
            );

            e.printStackTrace();

            return false;
        }
    }

    // =========================================================
    // SEND SMTP COMMAND
    // =========================================================

    private static String sendCommand(
            OutputStream outputStream,
            BufferedReader reader,
            String command)
            throws Exception {

        outputStream.write(
                command.getBytes(
                        StandardCharsets.UTF_8
                )
        );

        outputStream.flush();

        return readResponse(reader);
    }

    // =========================================================
    // READ SMTP RESPONSE
    // =========================================================

    private static String readResponse(
            BufferedReader reader)
            throws Exception {

        StringBuilder response =
                new StringBuilder();

        String line;

        do {

            line = reader.readLine();

            if (line == null) {
                break;
            }

            response.append(line)
                    .append("\n");

        } while (
                line.length() > 3
                && line.charAt(3) == '-'
        );

        return response.toString();
    }

    // =========================================================
    // CHECK RESPONSE
    // =========================================================

    private static boolean isResponse(
            String response,
            String expectedCode) {

        if (response == null
                || response.trim().isEmpty()) {

            return false;
        }

        String[] lines =
                response.split("\\r?\\n");

        for (String line : lines) {

            if (line.startsWith(expectedCode)) {
                return true;
            }
        }

        return false;
    }
}