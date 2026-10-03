<%@ page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page autoFlush="true" buffer="20kb"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Edit Profile</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">

    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .profile-page {
            min-height: 100vh;
            padding: 115px 20px 85px;
        }

        .profile-container {
            max-width: 1050px;
            margin: 0 auto;
        }

        /* HERO */

        .profile-hero {
            position: relative;
            overflow: hidden;
            margin-bottom: 28px;
            padding: 42px 45px;
            border-radius: 24px;
            background: linear-gradient(
                135deg,
                #0f172a 0%,
                #172554 55%,
                #1d4ed8 100%
            );
            box-shadow: 0 18px 45px rgba(15,23,42,.16);
        }

        .profile-hero::before {
            content: "";
            position: absolute;
            width: 290px;
            height: 290px;
            top: -150px;
            right: -90px;
            border-radius: 50%;
            background: rgba(255,255,255,.06);
        }

        .profile-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            left: -80px;
            bottom: -110px;
            border-radius: 50%;
            background: rgba(255,255,255,.04);
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .profile-badge {
            display: inline-block;
            padding: 7px 14px;
            margin-bottom: 15px;
            border: 1px solid rgba(255,255,255,.17);
            border-radius: 50px;
            background: rgba(255,255,255,.08);
            color: #dbeafe;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .profile-hero h1 {
            margin: 0 0 10px;
            color: #ffffff;
            font-size: 34px;
            font-weight: 800;
            line-height: 1.25;
        }

        .profile-hero p {
            max-width: 650px;
            margin: 0;
            color: #cbd5e1;
            font-size: 13px;
            line-height: 1.8;
        }

        /* CARD */

        .profile-card {
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 23px;
            background: #ffffff;
            box-shadow: 0 12px 38px rgba(15,23,42,.07);
        }

        .profile-card-header {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 27px 32px;
            border-bottom: 1px solid #edf1f5;
        }

        .profile-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 52px;
            height: 52px;
            flex-shrink: 0;
            border-radius: 15px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 22px;
        }

        .profile-card-header h2 {
            margin: 0 0 5px;
            color: #0f172a;
            font-size: 20px;
            font-weight: 800;
        }

        .profile-card-header p {
            margin: 0;
            color: #64748b;
            font-size: 11px;
        }

        .profile-form {
            padding: 32px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin: 0;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 11px;
            font-weight: 700;
        }

        /* PROPER ICON BOX */

        .input-wrapper {
            display: flex !important;
            align-items: stretch !important;
            width: 100%;
            height: 48px;
            overflow: hidden;
            border: 1px solid #dbe2ea;
            border-radius: 11px;
            background: #f8fafc;
            transition: all .2s ease;
        }

        .input-wrapper:focus-within {
            border-color: #3b82f6;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(59,130,246,.09);
        }

        .input-icon {
            position: static !important;
            top: auto !important;
            left: auto !important;
            transform: none !important;

            display: flex !important;
            align-items: center !important;
            justify-content: center !important;

            width: 48px !important;
            min-width: 48px !important;
            height: 100% !important;

            margin: 0 !important;
            padding: 0 !important;

            border-right: 1px solid #e2e8f0;
            background: #f1f5f9;

            color: #64748b;
            font-size: 14px;
            pointer-events: none;
        }

        .form-control {
            flex: 1 !important;
            width: auto !important;
            height: 100% !important;

            margin: 0 !important;
            padding: 0 15px !important;

            border: 0 !important;
            border-radius: 0 !important;
            outline: none !important;

            background: transparent !important;
            color: #1e293b;

            font-family: 'Montserrat', sans-serif !important;
            font-size: 12px;
        }

        .form-control:focus {
            border: 0 !important;
            box-shadow: none !important;
            outline: none !important;
        }

        select.form-control {
            appearance: auto;
            cursor: pointer;
        }

        .profile-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 28px;
            padding-top: 24px;
            border-top: 1px solid #edf1f5;
        }

        .save-btn {
            min-width: 175px;
            height: 48px;
            padding: 0 24px;
            border: 0;
            border-radius: 11px;
            background: #2563eb;
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            transition: all .2s ease;
            box-shadow: 0 7px 18px rgba(37,99,235,.18);
        }

        .save-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 10px 23px rgba(37,99,235,.24);
        }

        @media (max-width: 700px) {

            .profile-page {
                padding: 95px 15px 60px;
            }

            .profile-hero {
                padding: 38px 25px;
            }

            .profile-hero h1 {
                font-size: 29px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .profile-form {
                padding: 25px;
            }

            .profile-actions {
                justify-content: stretch;
            }

            .save-btn {
                width: 100%;
            }
        }

        @media (max-width: 480px) {

            .profile-page {
                padding-left: 10px;
                padding-right: 10px;
            }

            .profile-hero {
                padding: 30px 20px;
                border-radius: 20px;
            }

            .profile-hero h1 {
                font-size: 25px;
            }

            .profile-card-header {
                padding: 22px;
            }

            .profile-form {
                padding: 22px;
            }

            .profile-icon {
                width: 45px;
                height: 45px;
                font-size: 19px;
            }

            .profile-card-header h2 {
                font-size: 17px;
            }

        }

    </style>

</head>

<body>

    <jsp:include page="menu1.jsp" />


    <main class="profile-page">

        <div class="profile-container">


            <section class="profile-hero">

                <div class="hero-content">

                    <span class="profile-badge">
                        My Account
                    </span>

                    <h1>
                        Edit Your Profile
                    </h1>

                    <p>
                        Keep your ExamPortal profile information updated so
                        your account details remain accurate.
                    </p>

                </div>

            </section>


            <%
                Student studentToEdit =
                    (Student) request.getAttribute("studentToEdit");

                DateFormat dateFormat =
                    new SimpleDateFormat("yyyy-MM-dd");
            %>


            <%
                String studentEditSucessMessage =
                    (String) request.getAttribute("studentEditSucessMessage");

                String studentEditFailedMessage =
                    (String) request.getAttribute("studentEditFailedMessage");

                if (studentEditSucessMessage != null) {
            %>

            <script type="text/javascript">
                alert("Sucessfully Edited your profile...!!!");
            </script>

            <%
                }

                if (studentEditFailedMessage != null) {
            %>

            <script type="text/javascript">
                alert("Failed To Edit your Profile.Try Again.");
            </script>

            <%
                }
            %>


            <section class="profile-card">

                <div class="profile-card-header">

                    <div class="profile-icon">
                        &#128100;
                    </div>

                    <div>

                        <h2>
                            Personal Information
                        </h2>

                        <p>
                            Update your personal details below.
                        </p>

                    </div>

                </div>


                <form
                    class="profile-form"
                    method="post"
                    action="studentServlet">

                    <input
                        type="hidden"
                        name="operation"
                        value="editProfile" />


                    <div class="form-grid">


                        <!-- FULL NAME -->

                        <div class="form-group">

                            <label for="studentName">
                                Full Name
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#128100;
                                </span>

                                <input
                                    type="text"
                                    id="studentName"
                                    name="studentName"
                                    class="form-control"
                                    placeholder="Enter name"
                                    value="<%=studentToEdit.getName()%>">

                            </div>

                        </div>


                        <!-- ADDRESS -->

                        <div class="form-group">

                            <label for="address">
                                Address
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#128205;
                                </span>

                                <input
                                    type="text"
                                    id="address"
                                    name="address"
                                    class="form-control"
                                    placeholder="Enter address"
                                    value="<%=studentToEdit.getAddress()%>">

                            </div>

                        </div>


                        <!-- GENDER -->

                        <div class="form-group">

                            <label for="gender">
                                Gender
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#9893;
                                </span>

                                <select
                                    name="gender"
                                    id="gender"
                                    class="form-control">

                                    <%
                                        if (studentToEdit.getGender()
                                            .equalsIgnoreCase("Male")) {
                                    %>

                                    <option selected="selected">
                                        Male
                                    </option>

                                    <option>
                                        Female
                                    </option>

                                    <%
                                        } else {
                                    %>

                                    <option>
                                        Male
                                    </option>

                                    <option selected="selected">
                                        Female
                                    </option>

                                    <%
                                        }
                                    %>

                                </select>

                            </div>

                        </div>


                        <!-- DATE OF BIRTH -->

                        <div class="form-group">

                            <label for="dob">
                                Date of Birth
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#128197;
                                </span>

                                <input
                                    type="date"
                                    id="dob"
                                    name="dob"
                                    class="form-control"
                                    placeholder="Enter date of birth"
                                    value="<%=studentToEdit.getDateOfBirth()%>">

                            </div>

                        </div>


                        <!-- EMAIL -->

                        <div class="form-group">

                            <label for="email">
                                Email Address
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#9993;
                                </span>

                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    class="form-control"
                                    placeholder="Enter email"
                                    value="<%=studentToEdit.getEmail()%>">

                            </div>

                        </div>


                        <!-- CONTACT -->

                        <div class="form-group">

                            <label for="contact">
                                Contact Number
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#9742;
                                </span>

                                <input
                                    type="number"
                                    id="contact"
                                    name="contact"
                                    class="form-control"
                                    placeholder="Enter contact"
                                    value="<%=studentToEdit.getContact()%>">

                            </div>

                        </div>


                    </div>


                    <div class="profile-actions">

                        <input
                            class="save-btn"
                            value="Save Profile Changes"
                            type="submit">

                    </div>

                </form>

            </section>

        </div>

    </main>


    <jsp:include page="footer1.jsp" />

</body>

</html>