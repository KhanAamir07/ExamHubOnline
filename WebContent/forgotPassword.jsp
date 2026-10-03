<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Forgot Password</title>
    
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

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">

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
        }

        body {
            background:
                radial-gradient(
                    circle at top left,
                    rgba(255,107,95,0.10),
                    transparent 35%
                ),
                radial-gradient(
                    circle at bottom right,
                    rgba(23,32,51,0.08),
                    transparent 35%
                ),
                #f5f7fb;
            color: #172033;
        }

        .forgot-page {
            min-height: 100vh;
            padding: 70px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .forgot-card {
            width: 100%;
            max-width: 520px;
            background: #ffffff;
            border-radius: 22px;
            padding: 42px;
            border: 1px solid #e7ebf1;
            box-shadow: 0 20px 60px rgba(23,32,51,0.10);
        }

        .forgot-icon {
            width: 70px;
            height: 70px;
            margin: 0 auto 22px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0ee;
            color: #ff6b5f;
            font-size: 28px;
        }

        .forgot-card h1 {
            margin: 0 0 10px;
            text-align: center;
            font-size: 28px;
            font-weight: 800;
        }

        .forgot-card h1 span {
            color: #ff6b5f;
        }

        .forgot-description {
            text-align: center;
            color: #7c8595;
            font-size: 12px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .message {
            padding: 13px 15px;
            border-radius: 9px;
            margin-bottom: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .error {
            background: #fff0ee;
            color: #c0392b;
            border: 1px solid #ffd6d1;
        }

        .success {
            background: #eaf8f1;
            color: #16794c;
            border: 1px solid #cceedd;
        }

        .form-group {
            margin-bottom: 19px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #354052;
            font-size: 11px;
            font-weight: 700;
        }

        input,
        select {
            width: 100%;
            height: 50px;
            border: 1px solid #e0e5ec;
            border-radius: 9px;
            padding: 0 14px;
            background: #f9fafc;
            outline: none;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            color: #172033;
        }

        input:focus,
        select:focus {
            border-color: #ff6b5f;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(255,107,95,0.10);
        }

        .submit-btn {
            width: 100%;
            height: 50px;
            margin-top: 7px;
            border: 0;
            border-radius: 9px;
            background: #172033;
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            font-weight: 800;
            cursor: pointer;
            transition: 0.25s ease;
        }

        .submit-btn:hover {
            background: #ff6b5f;
            transform: translateY(-2px);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #7c8595;
            font-size: 11px;
            text-decoration: none;
        }

        .back-link:hover {
            color: #ff6b5f;
            text-decoration: none;
        }

        @media (max-width: 600px) {

            .forgot-page {
                padding: 25px 15px;
            }

            .forgot-card {
                padding: 28px 20px;
            }
        }

    </style>

</head>

<body>

<div class="forgot-page">

    <div class="forgot-card">

        <div class="forgot-icon">
            <i class="fa fa-key"></i>
        </div>

        <h1>
            Forgot <span>Password?</span>
        </h1>

        <p class="forgot-description">
            Enter your account details. A one-time password will
            be sent to your registered email address.
        </p>

        <%
            String errorMessage =
                    (String) request.getAttribute("errorMessage");

            String successMessage =
                    (String) request.getAttribute("successMessage");

            if (errorMessage != null) {
        %>

            <div class="message error">
                <i class="fa fa-exclamation-circle"></i>
                <%= errorMessage %>
            </div>

        <%
            }

            if (successMessage != null) {
        %>

            <div class="message success">
                <i class="fa fa-check-circle"></i>
                <%= successMessage %>
            </div>

        <%
            }
        %>

        <form method="post"
              action="${pageContext.request.contextPath}/forgotPassword">

            <input type="hidden"
                   name="operation"
                   value="sendOtp">

            <div class="form-group">

                <label>Account Type</label>

                <select name="accountType"
                        required>

                    <option value="">
                        Select Account Type
                    </option>

                    <option value="student">
                        Student
                    </option>

                    <option value="admin">
                        Administrator
                    </option>

                </select>

            </div>

            <div class="form-group">

                <label>Username</label>

                <input type="text"
                       name="username"
                       placeholder="Enter your username"
                       required>

            </div>

            <div class="form-group">

                <label>Registered Email</label>

                <input type="email"
                       name="email"
                       placeholder="Enter your registered email"
                       required>

            </div>

            <button type="submit"
                    class="submit-btn">

                <i class="fa fa-paper-plane"></i>
                Send OTP

            </button>

        </form>

        <a href="${pageContext.request.contextPath}/studentLogin.jsp"
           class="back-link">

            <i class="fa fa-arrow-left"></i>
            Back to Login

        </a>

    </div>

</div>

</body>

</html>