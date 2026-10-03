<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <meta http-equiv="X-UA-Compatible"
          content="IE=Edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <meta name="description"
          content="ExamPortal Admin Sign In">

    <title>
        ExamPortal | Admin | Sign In
    </title>

    <link rel="icon"
          href="${pageContext.request.contextPath}/favicon.ico"
          type="image/x-icon">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
          
                    <link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/global.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.min.css">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">
          


    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
            min-height: 100%;
            font-family: 'Montserrat', sans-serif;
            background: #f5f7fb;
        }

        .admin-login-page {
            min-height: 100vh;
            padding: 70px 20px 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-wrapper {
            width: 100%;
            max-width: 1180px;
        }

        .login-card {
            background: #fff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(25,42,70,0.12);
            display: flex;
            min-height: 610px;
        }

        .login-section {
            width: 43%;
            padding: 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .brand-icon {
            width: 58px;
            height: 58px;
            border-radius: 16px;
            background: linear-gradient(135deg,#4e73df,#224abe);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        .brand-area h1 {
            margin: 0 0 8px;
            font-size: 30px;
            font-weight: 800;
            color: #172033;
        }

        .brand-area p {
            color: #7b8497;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        .admin-label {
            display: inline-block;
            margin-bottom: 12px;
            font-size: 12px;
            font-weight: 700;
            color: #4e73df;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .login-heading {
            font-size: 24px;
            font-weight: 700;
            color: #1d2638;
            margin: 0 0 8px;
        }

        .login-description {
            font-size: 13px;
            color: #8a92a3;
            margin-bottom: 28px;
        }

        .message-box {
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 13px;
        }

        .success-message {
            color: #16794c;
            background: #eaf8f1;
            border: 1px solid #cceedd;
        }

        .error-message {
            color: #c0392b;
            background: #fff0ee;
            border: 1px solid #ffd6d1;
        }

        .form-group-modern {
            margin-bottom: 20px;
        }

        .form-label-modern {
            display: block;
            font-size: 12px;
            font-weight: 700;
            color: #4b5568;
            margin-bottom: 8px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ba4b5;
            font-size: 17px;
            z-index: 2;
        }

        .modern-input {
            width: 100%;
            height: 54px;
            border: 1px solid #e2e6ee;
            border-radius: 12px;
            padding: 0 16px 0 47px;
            font-size: 14px;
            color: #30394b;
            outline: none;
            background: #fbfcfe;
            font-family: 'Montserrat', sans-serif;
        }

        .modern-input:focus {
            border-color: #4e73df;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(78,115,223,0.08);
        }

        .login-button {
            width: 100%;
            height: 54px;
            border: 0;
            border-radius: 12px;
            background: linear-gradient(135deg,#4e73df,#224abe);
            color: #fff;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            font-family: 'Montserrat', sans-serif;
        }

        .forgot-link {
            display: block;
            margin-top: 18px;
            text-align: center;
            color: #4e73df;
            font-size: 12px;
            font-weight: 700;
            text-decoration: none;
        }

        .forgot-link:hover {
            color: #224abe;
            text-decoration: none;
        }

        .visual-section {
            width: 57%;
            position: relative;
            min-height: 610px;
            background: linear-gradient(135deg,#172b55,#274690);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .visual-content {
            position: relative;
            z-index: 2;
            width: 78%;
            text-align: center;
            color: #fff;
        }

        .visual-icon {
            width: 115px;
            height: 115px;
            border-radius: 30px;
            margin: 0 auto 30px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.18);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
        }

        .visual-content h2 {
            font-size: 34px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .visual-content p {
            font-size: 14px;
            line-height: 1.8;
            color: rgba(255,255,255,0.78);
        }

        .feature-row {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 25px;
        }

        .feature-pill {
            padding: 10px 15px;
            border-radius: 30px;
            background: rgba(255,255,255,0.10);
            border: 1px solid rgba(255,255,255,0.12);
            font-size: 11px;
            font-weight: 600;
        }

        .copyright-area {
            text-align: center;
            margin-top: 25px;
            font-size: 12px;
            color: #8a92a3;
        }

        .copyright-area a {
            color: #4e73df;
            font-weight: 700;
            text-decoration: none;
        }

        @media(max-width:991px) {

            .login-card {
                flex-direction: column;
            }

            .login-section,
            .visual-section {
                width: 100%;
            }

            .visual-section {
                min-height: 430px;
            }
        }

        @media(max-width:575px) {

            .admin-login-page {
                padding: 20px 10px;
            }

            .login-section {
                padding: 35px 22px 25px;
            }

            .visual-section {
                min-height: 390px;
            }

            .visual-content {
                width: 88%;
            }
        }

    </style>

</head>

<body class="theme-blush">

<%

    String adminLogoutSucessMessage =
            (String) request.getAttribute(
                    "adminLogoutSucessMessage"
            );

    String adminLoginFailedMessage =
            (String) request.getAttribute(
                    "adminLoginFailedMessage"
            );

%>

<div class="admin-login-page">

    <div class="login-wrapper">

        <div class="login-card">

            <div class="login-section">

                <div class="brand-area">

                    <div class="brand-icon">
                        EP
                    </div>

                    <h1>
                        ExamPortal
                    </h1>

                    <p>
                        Manage exams, students, questions and
                        academic activities from one secure platform.
                    </p>

                </div>

                <span class="admin-label">
                    Administrator Access
                </span>

                <h2 class="login-heading">
                    Welcome Back
                </h2>

                <p class="login-description">
                    Sign in to access the ExamPortal administration panel.
                </p>

                <%

                    if (adminLogoutSucessMessage != null) {

                %>

                    <div class="message-box success-message">
                        <%= adminLogoutSucessMessage %>
                    </div>

                <%

                    }

                    if (adminLoginFailedMessage != null) {

                %>

                    <div class="message-box error-message">
                        <%= adminLoginFailedMessage %>
                    </div>

                <%

                    }

                %>

                <form method="post"
                      action="auth?login">

                    <div class="form-group-modern">

                        <label class="form-label-modern">
                            Username
                        </label>

                        <div class="input-wrapper">

                            <i class="zmdi zmdi-account-circle"></i>

                            <input type="text"
                                   name="username"
                                   class="modern-input"
                                   placeholder="Enter your username"
                                   required>

                        </div>

                    </div>

                    <div class="form-group-modern">

                        <label class="form-label-modern">
                            Password
                        </label>

                        <div class="input-wrapper">

                            <i class="zmdi zmdi-lock"></i>

                            <input type="password"
                                   name="password"
                                   class="modern-input"
                                   placeholder="Enter your password"
                                   required>

                        </div>

                    </div>

                    <input class="login-button"
                           value="Sign In"
                           type="submit">

                    <a href="${pageContext.request.contextPath}/forgotPassword"
                       class="forgot-link">

                        <i class="zmdi zmdi-key"></i>
                        Forgot Password?

                    </a>

                </form>

                <div class="copyright-area">

                    &copy; 2025

                    <a href="index.jsp">
                        ExamPortal
                    </a>

                    . All Rights Reserved.

                </div>

            </div>

            <div class="visual-section">

                <div class="visual-content">

                    <div class="visual-icon">
                        <i class="zmdi zmdi-shield-check"></i>
                    </div>

                    <h2>
                        Admin Portal
                    </h2>

                    <p>
                        A centralized administration area for managing
                        the ExamPortal platform, exams, students,
                        questions and results.
                    </p>

                    <div class="feature-row">

                        <div class="feature-pill">
                            Secure Access
                        </div>

                        <div class="feature-pill">
                            Exam Management
                        </div>

                        <div class="feature-pill">
                            Student Management
                        </div>

                        <div class="feature-pill">
                            Result Management
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    function callServlet() {
        $.post('login');
    }

</script>

<script src="${pageContext.request.contextPath}/assets/bundles/libscripts.bundle.js"></script>

<script src="${pageContext.request.contextPath}/assets/bundles/vendorscripts.bundle.js"></script>

<jsp:include page="footer1.jsp" />

</body>

</html>