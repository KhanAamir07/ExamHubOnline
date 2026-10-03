<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page autoFlush="true"
    buffer="20kb"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Student Login</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/global.css">

    <style>

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif !important;
            background: #f5f7fb;
            color: #172033;
            overflow-x: hidden;
        }

        .auth-page {
            min-height: calc(100vh - 80px);
            padding: 110px 20px 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .auth-container {
            width: 100%;
            max-width: 1120px;
            margin: auto;
        }

        .auth-heading {
            text-align: center;
            margin-bottom: 42px;
        }

        .auth-heading-label {
            display: inline-block;
            margin-bottom: 10px;
            color: #ff6b5f;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .auth-heading h1 {
            margin: 0 0 12px;
            color: #172033;
            font-size: clamp(30px, 4vw, 44px);
            line-height: 1.2;
            font-weight: 800;
        }

        .auth-heading h1 span {
            color: #ff6b5f;
        }

        .auth-heading p {
            max-width: 650px;
            margin: auto;
            color: #7a8393;
            font-size: 13px;
            line-height: 1.8;
        }

        .auth-grid {
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            gap: 25px;
            align-items: stretch;
        }

        .auth-card {
            background: #fff;
            border: 1px solid #e7ebf1;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 15px 45px rgba(23,32,51,0.07);
        }

        .auth-card-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .auth-icon {
            width: 52px;
            height: 52px;
            flex: 0 0 52px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background: #fff0ee;
            color: #ff6b5f;
            font-size: 19px;
        }

        .auth-card-header h2 {
            margin: 0 0 5px;
            font-size: 20px;
            font-weight: 800;
        }

        .auth-card-header p {
            margin: 0;
            color: #8a93a2;
            font-size: 11px;
        }

        .login-card {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-welcome {
            margin-bottom: 28px;
            padding: 22px;
            border-radius: 13px;
            background: linear-gradient(135deg,#172033,#2a354b);
            color: #fff;
        }

        .login-welcome i {
            display: block;
            margin-bottom: 14px;
            font-size: 25px;
            color: #ff8178;
        }

        .login-welcome h3 {
            margin: 0 0 8px;
            font-size: 18px;
            font-weight: 800;
        }

        .login-welcome p {
            margin: 0;
            color: rgba(255,255,255,0.70);
            font-size: 11px;
            line-height: 1.7;
        }

        .auth-form-group {
            margin-bottom: 20px;
        }

        .auth-label {
            display: block;
            margin-bottom: 7px;
            color: #354052;
            font-size: 11px;
            font-weight: 700;
        }

        .auth-input {
            width: 100%;
            height: 48px;
            padding: 0 14px;
            border: 1px solid #e0e5ec;
            border-radius: 8px;
            outline: none;
            background: #f9fafc;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
        }

        .password-wrapper {
            position: relative;
        }

        .password-wrapper .auth-input {
            padding-right: 48px;
        }

        .password-eye {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #8992a1;
            cursor: pointer;
            z-index: 5;
        }

        .password-eye:hover {
            color: #ff6b5f;
        }

        .auth-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 25px 0;
        }

        .auth-divider span {
            flex: 1;
            height: 1px;
            background: #edf0f4;
        }

        .auth-divider small {
            color: #9aa2af;
            font-size: 10px;
            font-weight: 600;
        }

        .login-submit {
            width: 100%;
            height: 50px;
            border: 2px solid #172033;
            border-radius: 8px;
            background: #172033;
            color: #fff;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            font-weight: 800;
            cursor: pointer;
        }

        .forgot-link {
            display: block;
            margin-top: 17px;
            text-align: center;
            color: #ff6b5f;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none;
        }

        .forgot-link:hover {
            color: #172033;
            text-decoration: none;
        }

        @media(max-width:900px) {

            .auth-grid {
                grid-template-columns: 1fr;
            }
        }

        @media(max-width:600px) {

            .auth-page {
                padding: 85px 15px 60px;
            }

            .auth-card {
                padding: 25px 20px;
            }
        }

    </style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<section class="auth-page">

    <div class="auth-container">

        <div class="auth-heading">

            <span class="auth-heading-label">
                EXAMPORTAL ACCOUNT
            </span>

            <h1>
                Student <span>Access</span>
            </h1>

            <p>
                Create your student account or sign in to
                continue with ExamPortal.
            </p>

        </div>

        <div class="auth-grid">

            <div class="auth-card">

                <div class="auth-card-header">

                    <div class="auth-icon">
                        <i class="fa fa-user-plus"></i>
                    </div>

                    <div>

                        <h2>
                            Student Registration
                        </h2>

                        <p>
                            Create your ExamPortal account
                        </p>

                    </div>

                </div>

                <%
                    String studentRegisterSucessMessage =
                        (String) request.getAttribute(
                            "studentRegisterSucessMessage"
                        );

                    String studentRegisterFailedMessage =
                        (String) request.getAttribute(
                            "studentRegisterFailedMessage"
                        );

                    if (studentRegisterSucessMessage != null) {
                %>

                    <div class="alert alert-success">
                        <i class="fa fa-check-circle"></i>
                        Successfully Registered.
                        Continue to Login.
                    </div>

                <%
                    }

                    if (studentRegisterFailedMessage != null) {
                %>

                    <div class="alert alert-danger">
                        <i class="fa fa-exclamation-circle"></i>
                        <%= studentRegisterFailedMessage %>
                    </div>

                <%
                    }
                %>

                <form method="post"
                      action="studentServlet">

                    <input type="hidden"
                           name="operation"
                           value="add">

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Username
                        </label>

                        <input type="text"
                               name="username"
                               class="auth-input"
                               placeholder="Enter Username"
                               pattern="^[A-Za-z]{5,20}$"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Password
                        </label>

                        <div class="password-wrapper">

                            <input type="password"
                                   id="registerPassword"
                                   name="password"
                                   class="auth-input"
                                   placeholder="Enter Password"
                                   pattern="^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@#$%^&*])[A-Za-z0-9@#$%^&*]{5,15}$"
                                   required>

                            <i class="fa fa-eye password-eye"
                               onclick="togglePassword('registerPassword', this)">
                            </i>

                        </div>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Name
                        </label>

                        <input type="text"
                               name="studentName"
                               class="auth-input"
                               placeholder="Enter name"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Address
                        </label>

                        <input type="text"
                               name="address"
                               class="auth-input"
                               placeholder="Enter address"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Gender
                        </label>

                        <select name="gender"
                                class="auth-input">

                            <option>Male</option>
                            <option>Female</option>

                        </select>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Date of Birth
                        </label>

                        <input type="date"
                               name="dob"
                               class="auth-input"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Email
                        </label>

                        <input type="email"
                               name="email"
                               class="auth-input"
                               placeholder="Enter email"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Contact
                        </label>

                        <input type="text"
                               name="contact"
                               class="auth-input"
                               placeholder="Enter 10 digit mobile number"
                               pattern="[0-9]{10}"
                               maxlength="10"
                               inputmode="numeric"
                               required>

                    </div>

                    <input class="auth-submit"
                           value="Sign up"
                           type="submit">

                </form>

            </div>

            <div class="auth-card login-card">

                <div class="auth-card-header">

                    <div class="auth-icon">
                        <i class="fa fa-sign-in"></i>
                    </div>

                    <div>

                        <h2>
                            Student Login
                        </h2>

                        <p>
                            Access your ExamPortal account
                        </p>

                    </div>

                </div>

                <div class="login-welcome">

                    <i class="fa fa-graduation-cap"></i>

                    <h3>
                        Welcome Back
                    </h3>

                    <p>
                        Sign in with your existing student
                        credentials to continue.
                    </p>

                </div>

                <form method="post"
                      action="studentLogin?operation=login"
                      class="login-form">

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Username
                        </label>

                        <input type="text"
                               name="username"
                               class="auth-input"
                               placeholder="Enter Username"
                               required>

                    </div>

                    <div class="auth-form-group">

                        <label class="auth-label">
                            Password
                        </label>

                        <div class="password-wrapper">

                            <input type="password"
                                   id="loginPassword"
                                   name="password"
                                   class="auth-input"
                                   placeholder="Enter Password"
                                   required>

                            <i class="fa fa-eye password-eye"
                               onclick="togglePassword('loginPassword', this)">
                            </i>

                        </div>

                    </div>

                    <div class="auth-divider">

                        <span></span>

                        <small>
                            SECURE ACCESS
                        </small>

                        <span></span>

                    </div>

                    <input class="login-submit"
                           value="Sign in"
                           type="submit">

                    <a href="${pageContext.request.contextPath}/forgotPassword"
                       class="forgot-link">

                        <i class="fa fa-key"></i>
                        Forgot Password?

                    </a>

                </form>

            </div>

        </div>

    </div>

</section>

<jsp:include page="footer1.jsp" />

<script>

    function togglePassword(inputId, icon) {

        var passwordInput =
                document.getElementById(inputId);

        if (passwordInput.type === "password") {

            passwordInput.type = "text";

            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");

        } else {

            passwordInput.type = "password";

            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }

</script>

</body>

</html>