<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Change Password</title>
    
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

        .password-page {
            min-height: 100vh;
            padding: 120px 20px 85px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .password-container {
            width: 100%;
            max-width: 960px;
        }

        .password-layout {
            display: grid;
            grid-template-columns: 0.9fr 1.1fr;
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 26px;
            background: #ffffff;
            box-shadow: 0 20px 55px rgba(15, 23, 42, 0.10);
        }

        /* LEFT SIDE */

        .password-info {
            position: relative;
            overflow: hidden;
            padding: 55px 42px;
            background: linear-gradient(
                145deg,
                #0f172a 0%,
                #172554 55%,
                #1d4ed8 100%
            );
        }

        .password-info::before {
            content: "";
            position: absolute;
            width: 280px;
            height: 280px;
            top: -140px;
            right: -100px;
            border-radius: 50%;
            background: rgba(255,255,255,.06);
        }

        .password-info::after {
            content: "";
            position: absolute;
            width: 190px;
            height: 190px;
            bottom: -110px;
            left: -80px;
            border-radius: 50%;
            background: rgba(255,255,255,.04);
        }

        .info-content {
            position: relative;
            z-index: 2;
        }

        .security-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 68px;
            height: 68px;
            margin-bottom: 25px;
            border: 1px solid rgba(255,255,255,.16);
            border-radius: 20px;
            background: rgba(255,255,255,.09);
            color: #ffffff;
            font-size: 29px;
        }

        .info-badge {
            display: inline-block;
            padding: 7px 13px;
            margin-bottom: 17px;
            border: 1px solid rgba(255,255,255,.16);
            border-radius: 50px;
            background: rgba(255,255,255,.07);
            color: #dbeafe;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .password-info h1 {
            margin: 0 0 15px;
            color: #ffffff;
            font-size: 31px;
            font-weight: 800;
            line-height: 1.25;
        }

        .password-info p {
            margin: 0;
            color: #cbd5e1;
            font-size: 13px;
            line-height: 1.8;
        }

        .security-points {
            margin: 28px 0 0;
            padding: 0;
            list-style: none;
        }

        .security-points li {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 13px;
            color: #dbeafe;
            font-size: 11px;
        }

        .check {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 22px;
            height: 22px;
            flex-shrink: 0;
            border-radius: 7px;
            background: rgba(255,255,255,.10);
            color: #93c5fd;
            font-size: 11px;
        }

        /* RIGHT SIDE */

        .password-form-area {
            padding: 50px 45px;
            background: #ffffff;
        }

        .form-heading {
            margin-bottom: 30px;
        }

        .form-heading h2 {
            margin: 0 0 7px;
            color: #0f172a;
            font-size: 23px;
            font-weight: 800;
        }

        .form-heading p {
            margin: 0;
            color: #64748b;
            font-size: 12px;
            line-height: 1.6;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 11px;
            font-weight: 700;
        }

        /* ICON + INPUT BOX */

        .input-wrapper {
            display: flex !important;
            align-items: stretch !important;
            width: 100%;
            height: 50px;
            overflow: hidden;
            border: 1px solid #dbe2ea;
            border-radius: 12px;
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
            font-size: 15px;
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

        .password-submit {
            width: 100%;
            height: 50px;
            margin-top: 5px;
            border: 0;
            border-radius: 12px;
            background: #2563eb;
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: all .2s ease;
            box-shadow: 0 8px 20px rgba(37,99,235,.18);
        }

        .password-submit:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 10px 25px rgba(37,99,235,.25);
        }

        .form-note {
            margin-top: 18px;
            padding: 13px 15px;
            border-radius: 10px;
            background: #f8fafc;
            color: #64748b;
            font-size: 10px;
            line-height: 1.7;
            text-align: center;
        }

        @media (max-width: 800px) {

            .password-layout {
                grid-template-columns: 1fr;
            }

            .password-info {
                padding: 40px 30px;
            }

            .password-form-area {
                padding: 40px 30px;
            }
        }

        @media (max-width: 480px) {

            .password-page {
                padding: 100px 12px 60px;
            }

            .password-info {
                padding: 32px 23px;
            }

            .password-form-area {
                padding: 32px 23px;
            }

            .password-info h1 {
                font-size: 26px;
            }

        }

    </style>

</head>

<body>

    <jsp:include page="menu1.jsp" />

    <main class="password-page">

        <div class="password-container">

            <div class="password-layout">

                <section class="password-info">

                    <div class="info-content">

                        <div class="security-icon">
                            &#128274;
                        </div>

                        <span class="info-badge">
                            Account Security
                        </span>

                        <h1>
                            Keep Your Account Secure
                        </h1>

                        <p>
                            Update your ExamPortal password regularly to
                            help keep your account and examination data secure.
                        </p>

                        <ul class="security-points">

                            <li>
                                <span class="check">&#10003;</span>
                                Use a password that you can remember
                            </li>

                            <li>
                                <span class="check">&#10003;</span>
                                Keep your password private
                            </li>

                            <li>
                                <span class="check">&#10003;</span>
                                Do not share your login credentials
                            </li>

                        </ul>

                    </div>

                </section>


                <section class="password-form-area">

                    <div class="form-heading">

                        <h2>
                            Change Password
                        </h2>

                        <p>
                            Enter your current password and choose a new password.
                        </p>

                    </div>


                    <%
                        String studentChangeSucessMessage =
                            (String) request.getAttribute("studentChangeSucessMessage");

                        String studentChangeFailedMessage =
                            (String) request.getAttribute("studentChangeFailedMessage");

                        if (studentChangeSucessMessage != null) {
                    %>

                    <script type="text/javascript">
                        alert("Sucessfully Changed Password. Continue to Re-Login...!!!");
                    </script>

                    <%
                        }

                        if (studentChangeFailedMessage != null) {
                    %>

                    <script type="text/javascript">
                        alert("Change Password Failed.Try Again...!!!");
                    </script>

                    <%
                        }
                    %>


                    <form method="post"
                        action="studentServlet?operation=changePassword">


                        <div class="form-group">

                            <label for="oldPassword">
                                Current Password
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#128273;
                                </span>

                                <input
                                    type="password"
                                    id="oldPassword"
                                    name="oldPassword"
                                    class="form-control"
                                    placeholder="Enter old password">

                            </div>

                        </div>


                        <div class="form-group">

                            <label for="newPassword">
                                New Password
                            </label>

                            <div class="input-wrapper">

                                <span class="input-icon">
                                    &#128274;
                                </span>

                                <input
                                    type="password"
                                    id="newPassword"
                                    name="newPassword"
                                    class="form-control"
                                    placeholder="Enter new password">

                            </div>

                        </div>


                        <input
                            class="password-submit"
                            value="Change Password"
                            type="submit">


                        <div class="form-note">
                            After successfully changing your password,
                            you will need to log in again.
                        </div>

                    </form>

                </section>

            </div>

        </div>

    </main>

    <jsp:include page="footer1.jsp" />

</body>

</html>