package com.examhub;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mailer {

    // =========================================================
    // CERTIFICATE EMAIL
    // =========================================================

    public static void main(
            String to,
            String user,
            String password,
            File file) {

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.enabled.protocols", "TLSv1.2");
        props.put("mail.smtp.connectiontimeout", "10000");
        props.put("mail.smtp.timeout", "10000");
        props.put("mail.smtp.writetimeout", "10000");

        Session session = Session.getInstance(
            props,
            new javax.mail.Authenticator() {

                protected PasswordAuthentication
                getPasswordAuthentication() {

                    return new PasswordAuthentication(
                        user,
                        password
                    );
                }
            }
        );

        try {

            MimeMessage message =
                new MimeMessage(session);

            message.setFrom(
                new InternetAddress(user)
            );

            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(to)
            );

            message.setSubject(
                "ExamPortal | Certificate of Appreciation",
                "UTF-8"
            );

            String htmlContent =
                "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<meta charset='UTF-8'>"
                + "</head>"
                + "<body style='margin:0;padding:0;"
                + "background:#f4f7fb;"
                + "font-family:Arial,Helvetica,sans-serif;'>"

                + "<table width='100%' cellpadding='0' cellspacing='0' "
                + "style='background:#f4f7fb;padding:35px 15px;'>"

                + "<tr><td align='center'>"

                + "<table width='100%' cellpadding='0' cellspacing='0' "
                + "style='max-width:650px;background:#ffffff;"
                + "border-radius:14px;overflow:hidden;'>"

                + "<tr>"
                + "<td style='background:#172033;padding:28px 35px;"
                + "text-align:center;'>"

                + "<div style='font-size:27px;font-weight:800;"
                + "color:#ffffff;'>"
                + "Exam<span style='color:#ff6b5f;'>Portal</span>"
                + "</div>"

                + "<div style='margin-top:7px;color:#aeb7c8;"
                + "font-size:11px;letter-spacing:1.5px;'>"
                + "ONLINE EXAMINATION PLATFORM"
                + "</div>"

                + "</td>"
                + "</tr>"

                + "<tr>"
                + "<td style='padding:40px 35px;'>"

                + "<div style='text-align:center;'>"
                + "<div style='display:inline-block;width:58px;"
                + "height:58px;line-height:58px;border-radius:50%;"
                + "background:#fff0ee;color:#ff6b5f;"
                + "font-size:28px;'>"
                + "&#10003;"
                + "</div>"
                + "</div>"

                + "<h2 style='text-align:center;color:#172033;'>"
                + "Certificate of Appreciation"
                + "</h2>"

                + "<p style='color:#667085;font-size:14px;"
                + "line-height:1.8;'>"
                + "Dear Candidate,"
                + "</p>"

                + "<p style='color:#667085;font-size:14px;"
                + "line-height:1.8;'>"
                + "ExamPortal is pleased to inform you that you have "
                + "been awarded a certificate of appreciation for "
                + "successfully clearing our mock test with an "
                + "<strong>A Grade</strong>."
                + "</p>"

                + "<p style='color:#667085;font-size:14px;"
                + "line-height:1.8;'>"
                + "Keep learning, keep practicing and keep growing "
                + "with ExamPortal."
                + "</p>"

                + "<p style='color:#172033;font-weight:bold;'>"
                + "Team ExamPortal"
                + "</p>"

                + "</td>"
                + "</tr>"

                + "<tr>"
                + "<td style='background:#f8fafc;padding:20px;"
                + "text-align:center;'>"

                + "<p style='margin:0;color:#98a2b3;font-size:11px;'>"
                + "&copy; 2025 ExamPortal. All Rights Reserved."
                + "</p>"

                + "</td>"
                + "</tr>"

                + "</table>"
                + "</td></tr>"
                + "</table>"

                + "</body>"
                + "</html>";


            BodyPart bodyPart =
                new MimeBodyPart();

            bodyPart.setContent(
                htmlContent,
                "text/html; charset=UTF-8"
            );


            MimeBodyPart attachment =
                new MimeBodyPart();

            DataSource source =
                new FileDataSource(
                    file.getAbsolutePath()
                );

            attachment.setDataHandler(
                new DataHandler(source)
            );

            attachment.setFileName(
                file.getName()
            );


            Multipart multipart =
                new MimeMultipart();

            multipart.addBodyPart(bodyPart);
            multipart.addBodyPart(attachment);

            message.setContent(multipart);

            Transport.send(message);

            System.out.println(
                "Certificate email sent successfully."
            );

        } catch (Exception ex) {

            ex.printStackTrace();
        }
    }


    // =========================================================
    // CONTACT FORM EMAIL
    // =========================================================

    public static boolean main(
            String fullname,
            String mailId,
            String msg) {

        fullname = safe(fullname);
        mailId = safe(mailId);
        msg = safe(msg);


        if (fullname.isEmpty()) {

            System.err.println(
                "CONTACT EMAIL ERROR: Visitor name is empty."
            );

            return false;
        }


        if (mailId.isEmpty()) {

            System.err.println(
                "CONTACT EMAIL ERROR: Visitor email is empty."
            );

            return false;
        }


        if (msg.isEmpty()) {

            System.err.println(
                "CONTACT EMAIL ERROR: Visitor message is empty."
            );

            return false;
        }


        try {

            InternetAddress visitorAddress =
                new InternetAddress(mailId);

            visitorAddress.validate();

        } catch (AddressException ex) {

            System.err.println(
                "CONTACT EMAIL ERROR: Invalid visitor email: "
                + mailId
            );

            return false;
        }


        // =====================================================
        // SMTP CONFIGURATION
        // =====================================================

        Properties props = new Properties();

        props.put(
            "mail.smtp.host",
            "smtp.gmail.com"
        );

        props.put(
            "mail.smtp.port",
            "587"
        );

        props.put(
            "mail.smtp.auth",
            "true"
        );

        props.put(
            "mail.smtp.starttls.enable",
            "true"
        );

        props.put(
            "mail.smtp.starttls.required",
            "true"
        );

        props.put(
            "mail.smtp.ssl.protocols",
            "TLSv1.2"
        );

        props.put(
            "mail.smtp.ssl.enabled.protocols",
            "TLSv1.2"
        );

        props.put(
            "mail.smtp.connectiontimeout",
            "10000"
        );

        props.put(
            "mail.smtp.timeout",
            "10000"
        );

        props.put(
            "mail.smtp.writetimeout",
            "10000"
        );


     // =====================================================
     // GMAIL SESSION
     // =====================================================

     final String senderEmail =
         "aamirkhan91613216@gmail.com";

     final String appPassword =
         "xxxxxxxxxxxxxxxx";

     Session session = Session.getInstance(
         props,
         new javax.mail.Authenticator() {

             protected PasswordAuthentication
             getPasswordAuthentication() {

                 return new PasswordAuthentication(
                     senderEmail,
                     appPassword
                 );
             }
         }
     );


        try {

            // =================================================
            // ADMIN EMAIL
            // =================================================

            MimeMessage adminMessage =
                new MimeMessage(session);

            adminMessage.setFrom(
                new InternetAddress(
                    senderEmail,
                    "ExamPortal Website"
                )
            );

            adminMessage.setRecipient(
                Message.RecipientType.TO,
                new InternetAddress(
                    senderEmail
                )
            );

            adminMessage.setReplyTo(
                new javax.mail.Address[] {
                    new InternetAddress(mailId)
                }
            );

            adminMessage.setSubject(
                "ExamPortal | New Website Enquiry",
                "UTF-8"
            );


            String adminHtml =
                buildAdminEmail(
                    fullname,
                    mailId,
                    msg
                );


            MimeBodyPart adminBody =
                new MimeBodyPart();

            adminBody.setContent(
                adminHtml,
                "text/html; charset=UTF-8"
            );


            Multipart adminMultipart =
                new MimeMultipart();

            adminMultipart.addBodyPart(
                adminBody
            );

            adminMessage.setContent(
                adminMultipart
            );


            Transport.send(adminMessage);


            System.out.println(
                "Admin contact email sent successfully."
            );


            // =================================================
            // CONFIRMATION EMAIL TO VISITOR
            // =================================================

            MimeMessage visitorMessage =
                new MimeMessage(session);

            visitorMessage.setFrom(
                new InternetAddress(
                    senderEmail,
                    "ExamPortal Team"
                )
            );

            visitorMessage.setRecipient(
                Message.RecipientType.TO,
                new InternetAddress(mailId)
            );

            visitorMessage.setReplyTo(
                new javax.mail.Address[] {
                    new InternetAddress(senderEmail)
                }
            );

            visitorMessage.setSubject(
                "ExamPortal | We Received Your Message",
                "UTF-8"
            );


            String visitorHtml =
                buildVisitorEmail(
                    fullname,
                    msg
                );


            MimeBodyPart visitorBody =
                new MimeBodyPart();

            visitorBody.setContent(
                visitorHtml,
                "text/html; charset=UTF-8"
            );


            Multipart visitorMultipart =
                new MimeMultipart();

            visitorMultipart.addBodyPart(
                visitorBody
            );

            visitorMessage.setContent(
                visitorMultipart
            );


            Transport.send(visitorMessage);


            System.out.println(
                "Visitor confirmation email sent successfully."
            );


            return true;


        } catch (Exception ex) {

            System.err.println(
                "ExamPortal contact email failed."
            );

            ex.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // ADMIN EMAIL HTML
    // =========================================================

    private static String buildAdminEmail(
            String fullname,
            String mailId,
            String msg) {

        return
            "<!DOCTYPE html>"
            + "<html>"
            + "<head>"
            + "<meta charset='UTF-8'>"
            + "<meta name='viewport' "
            + "content='width=device-width,initial-scale=1.0'>"
            + "</head>"

            + "<body style='margin:0;padding:0;"
            + "background:#f4f7fb;"
            + "font-family:Arial,Helvetica,sans-serif;'>"

            + "<table width='100%' cellpadding='0' cellspacing='0' "
            + "style='background:#f4f7fb;padding:35px 15px;'>"

            + "<tr><td align='center'>"

            + "<table width='100%' cellpadding='0' cellspacing='0' "
            + "style='max-width:680px;background:#ffffff;"
            + "border-radius:16px;overflow:hidden;'>"

            + "<tr>"
            + "<td style='background:#172033;padding:30px 35px;'>"

            + "<div style='font-size:28px;font-weight:800;"
            + "color:#ffffff;'>"
            + "Exam<span style='color:#ff6b5f;'>Portal</span>"
            + "</div>"

            + "<div style='margin-top:7px;font-size:11px;"
            + "letter-spacing:2px;color:#aeb7c8;'>"
            + "ONLINE EXAMINATION PLATFORM"
            + "</div>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='padding:35px 35px 15px;'>"

            + "<div style='display:inline-block;"
            + "padding:7px 12px;background:#fff0ee;"
            + "border-radius:20px;color:#ff6b5f;"
            + "font-size:10px;font-weight:800;"
            + "letter-spacing:1px;'>"
            + "WEBSITE CONTACT FORM"
            + "</div>"

            + "<h1 style='margin:15px 0 10px;"
            + "font-size:27px;color:#172033;'>"
            + "New Message Received"
            + "</h1>"

            + "<p style='margin:0;color:#7a8393;"
            + "font-size:13px;line-height:1.7;'>"
            + "A visitor has contacted the ExamPortal team."
            + "</p>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='padding:15px 35px;'>"

            + "<table width='100%' cellpadding='0' cellspacing='0' "
            + "style='border:1px solid #e8ecf2;border-radius:12px;'>"

            + detailRow(
                "FULL NAME",
                escapeHtml(fullname)
            )

            + detailRow(
                "EMAIL ADDRESS",
                "<a href='mailto:"
                + escapeHtml(mailId)
                + "' style='color:#ff6b5f;"
                + "text-decoration:none;font-weight:700;'>"
                + escapeHtml(mailId)
                + "</a>"
            )

            + detailRow(
                "SOURCE",
                "ExamPortal Website"
            )

            + "</table>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='padding:15px 35px 25px;'>"

            + "<div style='font-size:11px;font-weight:800;"
            + "letter-spacing:1px;color:#667085;"
            + "margin-bottom:10px;'>"
            + "MESSAGE"
            + "</div>"

            + "<div style='background:#f8fafc;"
            + "border-left:4px solid #ff6b5f;"
            + "border-radius:8px;padding:20px 22px;"
            + "font-size:14px;line-height:1.8;"
            + "color:#344054;word-break:break-word;'>"
            + escapeHtml(msg)
                .replace("\r\n", "<br>")
                .replace("\n", "<br>")
            + "</div>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td align='center' style='padding:5px 35px 35px;'>"

            + "<a href='mailto:"
            + escapeHtml(mailId)
            + "?subject=Re%3A%20ExamPortal%20Website%20Enquiry' "
            + "style='display:inline-block;"
            + "background:#ff6b5f;color:#ffffff;"
            + "text-decoration:none;font-size:12px;"
            + "font-weight:800;padding:14px 25px;"
            + "border-radius:8px;'>"
            + "Reply to Visitor"
            + "</a>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='background:#f8fafc;"
            + "border-top:1px solid #edf0f4;"
            + "padding:23px;text-align:center;'>"

            + "<div style='font-size:17px;font-weight:800;"
            + "color:#172033;'>"
            + "Exam<span style='color:#ff6b5f;'>Portal</span>"
            + "</div>"

            + "<p style='margin:8px 0 0;font-size:10px;"
            + "color:#98a2b3;'>"
            + "This email was automatically generated from "
            + "the ExamPortal website."
            + "</p>"

            + "<p style='margin:7px 0 0;font-size:10px;"
            + "color:#b0b7c3;'>"
            + "&copy; 2025 ExamPortal. All Rights Reserved."
            + "</p>"

            + "</td>"
            + "</tr>"

            + "</table>"

            + "</td></tr>"
            + "</table>"

            + "</body>"
            + "</html>";
    }


    // =========================================================
    // VISITOR CONFIRMATION EMAIL
    // =========================================================

    private static String buildVisitorEmail(
            String fullname,
            String msg) {

        return
            "<!DOCTYPE html>"
            + "<html>"
            + "<head>"
            + "<meta charset='UTF-8'>"
            + "<meta name='viewport' "
            + "content='width=device-width,initial-scale=1.0'>"
            + "</head>"

            + "<body style='margin:0;padding:0;"
            + "background:#f4f7fb;"
            + "font-family:Arial,Helvetica,sans-serif;'>"

            + "<table width='100%' cellpadding='0' cellspacing='0' "
            + "style='background:#f4f7fb;padding:35px 15px;'>"

            + "<tr><td align='center'>"

            + "<table width='100%' cellpadding='0' cellspacing='0' "
            + "style='max-width:650px;background:#ffffff;"
            + "border-radius:16px;overflow:hidden;'>"


            + "<tr>"
            + "<td style='background:#172033;padding:30px;"
            + "text-align:center;'>"

            + "<div style='font-size:28px;font-weight:800;"
            + "color:#ffffff;'>"
            + "Exam<span style='color:#ff6b5f;'>Portal</span>"
            + "</div>"

            + "<div style='margin-top:7px;font-size:10px;"
            + "letter-spacing:2px;color:#aeb7c8;'>"
            + "ONLINE EXAMINATION PLATFORM"
            + "</div>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='padding:40px 35px;'>"

            + "<div style='text-align:center;'>"

            + "<div style='display:inline-block;width:62px;"
            + "height:62px;line-height:62px;"
            + "border-radius:50%;"
            + "background:#effaf3;color:#159447;"
            + "font-size:29px;'>"
            + "&#10003;"
            + "</div>"

            + "</div>"

            + "<h1 style='text-align:center;"
            + "color:#172033;font-size:25px;"
            + "margin:22px 0 12px;'>"
            + "Message Received"
            + "</h1>"

            + "<p style='text-align:center;"
            + "color:#667085;font-size:14px;"
            + "line-height:1.8;'>"
            + "Hi <strong>"
            + escapeHtml(fullname)
            + "</strong>,"
            + "</p>"

            + "<p style='color:#667085;"
            + "font-size:14px;line-height:1.8;'>"
            + "Thank you for contacting "
            + "<strong style='color:#172033;'>ExamPortal</strong>."
            + " Your message has been successfully received "
            + "by the Aamir Team."
            + "</p>"

            + "<div style='background:#f8fafc;"
            + "border-left:4px solid #ff6b5f;"
            + "border-radius:8px;"
            + "padding:18px 20px;"
            + "margin:25px 0;'>"

            + "<div style='font-size:10px;"
            + "font-weight:800;"
            + "letter-spacing:1px;"
            + "color:#667085;"
            + "margin-bottom:8px;'>"
            + "YOUR MESSAGE"
            + "</div>"

            + "<div style='font-size:13px;"
            + "line-height:1.8;"
            + "color:#344054;'>"
            + escapeHtml(msg)
                .replace("\r\n", "<br>")
                .replace("\n", "<br>")
            + "</div>"

            + "</div>"

            + "<p style='color:#667085;"
            + "font-size:14px;line-height:1.8;'>"
            + "Our team will review your message and "
            + "connect with you as soon as possible."
            + "</p>"

            + "<p style='color:#172033;"
            + "font-size:14px;font-weight:700;"
            + "margin-top:25px;'>"
            + "Regards,<br>"
            + "Aamir Team<br>"
            + "<span style='color:#ff6b5f;'>ExamPortal</span>"
            + "</p>"

            + "</td>"
            + "</tr>"


            + "<tr>"
            + "<td style='background:#f8fafc;"
            + "border-top:1px solid #edf0f4;"
            + "padding:22px;text-align:center;'>"

            + "<div style='font-size:17px;"
            + "font-weight:800;color:#172033;'>"
            + "Exam<span style='color:#ff6b5f;'>Portal</span>"
            + "</div>"

            + "<p style='margin:8px 0 0;"
            + "font-size:10px;color:#98a2b3;'>"
            + "Thank you for reaching out to us."
            + "</p>"

            + "<p style='margin:7px 0 0;"
            + "font-size:10px;color:#b0b7c3;'>"
            + "&copy; 2025 ExamPortal. All Rights Reserved."
            + "</p>"

            + "</td>"
            + "</tr>"


            + "</table>"

            + "</td></tr>"
            + "</table>"

            + "</body>"
            + "</html>";
    }


    // =========================================================
    // DETAIL ROW
    // =========================================================

    private static String detailRow(
            String title,
            String value) {

        return
            "<tr>"

            + "<td style='padding:16px 18px;"
            + "border-bottom:1px solid #edf0f4;"
            + "width:145px;background:#fafbfc;"
            + "font-size:10px;font-weight:800;"
            + "color:#667085;letter-spacing:0.5px;'>"
            + title
            + "</td>"

            + "<td style='padding:16px 18px;"
            + "border-bottom:1px solid #edf0f4;"
            + "font-size:13px;font-weight:600;"
            + "color:#172033;'>"
            + value
            + "</td>"

            + "</tr>";
    }


    // =========================================================
    // SAFE STRING
    // =========================================================

    private static String safe(String value) {

        if (value == null) {
            return "";
        }

        return value.trim();
    }


    // =========================================================
    // HTML ESCAPE
    // =========================================================

    private static String escapeHtml(String text) {

        if (text == null) {
            return "";
        }

        return text
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
    }
}