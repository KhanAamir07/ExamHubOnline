<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Boolean otpVerified =
            (Boolean) session.getAttribute("otpVerified");

    if (!Boolean.TRUE.equals(otpVerified)) {

        response.sendRedirect(
                request.getContextPath()
                + "/forgotPassword"
        );

        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Reset Password</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background:
                radial-gradient(circle at top left,
                rgba(255,107,95,0.10),
                transparent 35%),
                #f5f7fb;
            font-family: 'Montserrat', sans-serif;
            color: #172033;
        }

        .card {
            width: 100%;
            max-width: 480px;
            background: #fff;
            border: 1px solid #e7ebf1;
            border-radius: 22px;
            padding: 42px;
            box-shadow: 0 20px 60px rgba(23,32,51,0.10);
        }

        .icon {
            width: 70px;
            height: 70px;
            margin: 0 auto 22px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0ee;
            color: #ff6b5f;
            font-size: 27px;
        }

        h1 {
            text-align: center;
            margin: 0 0 10px;
            font-size: 27px;
            font-weight: 800;
        }

        h1 span {
            color: #ff6b5f;
        }

        p {
            text-align: center;
            color: #7c8595;
            font-size: 12px;
            line-height: 1.7;
            margin-bottom: 28px;
        }

        .message {
            padding: 12px 15px;
            border-radius: 9px;
            margin-bottom: 20px;
            font-size: 11px;
            font-weight: 600;
            background: #fff0ee;
            color: #c0392b;
            border: 1px solid #ffd6d1;
        }

        .group {
            margin-bottom: 19px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 11px;
            font-weight: 700;
        }

        .password-wrapper {
            position: relative;
        }

        input {
            width: 100%;
            height: 52px;
            border: 1px solid #e0e5ec;
            border-radius: 9px;
            background: #f9fafc;
            padding: 0 45px 0 14px;
            outline: none;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
        }

        input:focus {
            border-color: #ff6b5f;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(255,107,95,0.10);
        }

        .eye {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #8992a1;
        }

        .eye:hover {
            color: #ff6b5f;
        }

        button {
            width: 100%;
            height: 50px;
            margin-top: 5px;
            border: 0;
            border-radius: 9px;
            background: #172033;
            color: #fff;
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            cursor: pointer;
        }

        button:hover {
            background: #ff6b5f;
        }

        @media(max-width:600px) {

            .card {
                padding: 28px 20px;
            }
        }

    </style>

</head>

<body>

<div class="card">

    <div class="icon">
        <i class="fa fa-lock"></i>
    </div>

    <h1>
        Reset <span>Password</span>
    </h1>

    <p>
        Create a new password for your ExamPortal account.
    </p>

    <%
        String errorMessage =
                (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="message">
            <i class="fa fa-exclamation-circle"></i>
            <%= errorMessage %>
        </div>

    <%
        }
    %>

    <form method="post"
          action="${pageContext.request.contextPath}/forgotPassword">

        <input type="hidden"
               name="operation"
               value="resetPassword">

        <div class="group">

            <label>New Password</label>

            <div class="password-wrapper">

                <input type="password"
                       id="newPassword"
                       name="newPassword"
                       placeholder="Enter new password"
                       required>

                <i class="fa fa-eye eye"
                   onclick="togglePassword('newPassword', this)">
                </i>

            </div>

        </div>

        <div class="group">

            <label>Confirm Password</label>

            <div class="password-wrapper">

                <input type="password"
                       id="confirmPassword"
                       name="confirmPassword"
                       placeholder="Confirm new password"
                       required>

                <i class="fa fa-eye eye"
                   onclick="togglePassword('confirmPassword', this)">
                </i>

            </div>

        </div>

        <button type="submit">
            <i class="fa fa-refresh"></i>
            Reset Password
        </button>

    </form>

</div>

<script>

    function togglePassword(inputId, icon) {

        var input =
                document.getElementById(inputId);

        if (input.type === "password") {

            input.type = "text";

            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");

        } else {

            input.type = "password";

            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }

</script>

</body>

</html>