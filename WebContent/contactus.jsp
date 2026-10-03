<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Contact Us</title>
    
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

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&family=Space+Mono:wght@400;700&display=swap"
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
            background: #f6f8fb;
            color: #172033;
            overflow-x: hidden;
        }

        .contact-page {
            padding: 120px 0 90px;
            background:
                radial-gradient(
                    circle at top left,
                    rgba(255,107,95,0.06),
                    transparent 30%
                ),
                #f6f8fb;
        }

        .contact-container {
            width: 92%;
            max-width: 1200px;
            margin: auto;
        }

        .contact-header {
            text-align: center;
            max-width: 760px;
            margin: 0 auto 60px;
        }

        .contact-label {
            display: inline-block;
            color: #ff6b5f;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 12px;
        }

        .contact-header h1 {
            margin: 0 0 18px;
            font-size: clamp(36px, 4vw, 52px);
            line-height: 1.15;
            font-weight: 800;
            color: #172033;
        }

        .contact-header h1 span {
            color: #ff6b5f;
        }

        .contact-header p {
            margin: 0;
            color: #707a8c;
            font-size: 14px;
            line-height: 1.9;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            align-items: stretch;
        }

        .contact-card {
            background: #ffffff;
            border: 1px solid #e8ecf2;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(23,32,51,0.07);
        }

        .map-card {
            display: flex;
            flex-direction: column;
        }

        .map-header {
            padding: 28px 30px 22px;
        }

        .map-title {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .map-icon {
            width: 48px;
            height: 48px;
            flex: 0 0 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #fff0ee;
            color: #ff6b5f;
            font-size: 19px;
        }

        .map-title h2 {
            margin: 0 0 5px;
            font-size: 21px;
            font-weight: 800;
            color: #172033;
        }

        .map-title p {
            margin: 0;
            font-size: 12px;
            color: #818a9a;
        }

        .map-wrapper {
            width: 100%;
            height: 430px;
            overflow: hidden;
            position: relative;
        }

        .map-wrapper iframe {
            width: 100%;
            height: 100%;
            border: 0;
            display: block;
        }

        .location-info {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            padding: 23px 30px;
            border-top: 1px solid #edf0f4;
        }

        .location-info-icon {
            width: 40px;
            height: 40px;
            flex: 0 0 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            background: #172033;
            color: #ffffff;
            font-size: 14px;
        }

        .location-info strong {
            display: block;
            margin-bottom: 5px;
            color: #172033;
            font-size: 13px;
            font-weight: 800;
        }

        .location-info span {
            color: #737d8e;
            font-size: 12px;
            line-height: 1.7;
        }

        .form-card {
            padding: 40px;
        }

        .form-header {
            margin-bottom: 30px;
        }

        .form-header h2 {
            margin: 0 0 10px;
            font-size: 28px;
            font-weight: 800;
            color: #172033;
        }

        .form-header h2 span {
            color: #ff6b5f;
        }

        .form-header p {
            margin: 0;
            color: #7a8393;
            font-size: 13px;
            line-height: 1.8;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #344054;
            font-size: 12px;
            font-weight: 700;
        }

        .form-control {
            width: 100%;
            height: 50px;
            border: 1px solid #e0e5ec !important;
            border-radius: 9px !important;
            background: #f9fafc !important;
            padding: 0 15px !important;
            font-family: 'Montserrat', sans-serif !important;
            font-size: 13px !important;
            color: #172033 !important;
            box-shadow: none !important;
            transition: all 0.25s ease;
        }

        textarea.form-control {
            height: 145px;
            padding: 15px !important;
            resize: vertical;
        }

        .form-control:focus {
            border-color: #ff6b5f !important;
            background: #ffffff !important;
            box-shadow: 0 0 0 3px rgba(255,107,95,0.10) !important;
        }

        .form-control::placeholder {
            color: #a0a8b6;
        }

        .send-button {
            width: 100%;
            min-height: 52px;
            border: 0;
            border-radius: 9px;
            background: #ff6b5f;
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            font-size: 13px;
            font-weight: 800;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s ease;
        }

        .send-button:hover {
            background: #172033;
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(23,32,51,0.15);
        }

        .send-button:disabled {
            opacity: 0.75;
            cursor: not-allowed;
            transform: none;
        }

        .form-result {
            display: none;
            margin-bottom: 24px;
            padding: 18px;
            border-radius: 12px;
        }

        .form-result.show {
            display: flex;
            align-items: flex-start;
            gap: 13px;
        }

        .form-result.success {
            background: #effaf3;
            border: 1px solid #c9efd6;
            color: #176b3a;
        }

        .form-result.error {
            background: #fff3f2;
            border: 1px solid #ffd2ce;
            color: #a83228;
        }

        .result-icon {
            width: 36px;
            height: 36px;
            flex: 0 0 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 15px;
        }

        .success .result-icon {
            background: #d7f5e2;
            color: #159447;
        }

        .error .result-icon {
            background: #ffe0dc;
            color: #d63c2f;
        }

        .result-content {
            flex: 1;
        }

        .result-title {
            margin: 0 0 5px;
            font-size: 13px;
            font-weight: 800;
        }

        .result-text {
            margin: 0;
            font-size: 11px;
            line-height: 1.7;
        }

        .contact-info {
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #edf0f4;
        }

        .contact-info-title {
            margin-bottom: 18px;
            font-size: 13px;
            font-weight: 800;
            color: #172033;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 14px;
        }

        .info-item:last-child {
            margin-bottom: 0;
        }

        .info-icon {
            width: 38px;
            height: 38px;
            flex: 0 0 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 9px;
            background: #fff0ee;
            color: #ff6b5f;
            font-size: 13px;
        }

        .info-item span {
            font-size: 12px;
            color: #737d8e;
            line-height: 1.6;
        }

        .contact-bottom {
            margin-top: 45px;
            padding: 45px 30px;
            border-radius: 20px;
            background: linear-gradient(135deg,#172033,#2b364c);
            text-align: center;
            color: #ffffff;
        }

        .contact-bottom h2 {
            margin: 0 0 12px;
            font-size: 28px;
            font-weight: 800;
        }

        .contact-bottom h2 span {
            color: #ff8178;
        }

        .contact-bottom p {
            max-width: 650px;
            margin: auto;
            color: rgba(255,255,255,0.72);
            font-size: 13px;
            line-height: 1.8;
        }

        @media (max-width: 900px) {

            .contact-page {
                padding: 100px 0 70px;
            }

            .contact-grid {
                grid-template-columns: 1fr;
            }

            .map-wrapper {
                height: 380px;
            }
        }

        @media (max-width: 600px) {

            .contact-page {
                padding: 85px 0 60px;
            }

            .contact-container {
                width: 94%;
            }

            .contact-header {
                margin-bottom: 40px;
            }

            .contact-header h1 {
                font-size: 34px;
            }

            .form-card {
                padding: 28px 20px;
            }

            .map-header {
                padding: 24px 20px 18px;
            }

            .map-wrapper {
                height: 320px;
            }

            .location-info {
                padding: 20px;
            }

            .contact-bottom {
                padding: 38px 20px;
            }

            .contact-bottom h2 {
                font-size: 24px;
            }
        }

    </style>

</head>


<body>

    <jsp:include page="menu1.jsp" />


    <section class="contact-page">

        <div class="contact-container">

            <div class="contact-header">

                <span class="contact-label">
                    GET IN TOUCH
                </span>

                <h1>
                    Contact <span>ExamPortal</span>
                </h1>

                <p>
                    Have a question, suggestion or message?
                    Connect with the ExamPortal team using
                    the contact form below.
                </p>

            </div>


            <div class="contact-grid">


                <!-- LOCATION -->

                <div class="contact-card map-card">

                    <div class="map-header">

                        <div class="map-title">

                            <div class="map-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>

                            <div>

                                <h2>
                                    Our Location
                                </h2>

                                <p>
                                    Visit us at our location
                                </p>

                            </div>

                        </div>

                    </div>


                    <div class="map-wrapper">

                        <iframe
                            src="https://www.google.com/maps?q=Saki%20Naka%20Metro%20Station%2C%20Mumbai%20400072&output=embed"
                            loading="lazy"
                            allowfullscreen>
                        </iframe>

                    </div>


                    <div class="location-info">

                        <div class="location-info-icon">
                            <i class="fa fa-map-marker"></i>
                        </div>

                        <div>

                            <strong>
                                ExamPortal Location
                            </strong>

                            <span>
                                Saki Naka Metro Station,
                                Mumbai, Maharashtra - 400072
                            </span>

                        </div>

                    </div>

                </div>


                <!-- CONTACT FORM -->

                <div class="contact-card form-card">

                    <div class="form-header">

                        <h2>
                            Send Us A <span>Message</span>
                        </h2>

                        <p>
                            Fill in the details below and our
                            team will get back to you as soon
                            as possible.
                        </p>

                    </div>


                    <div id="formResult"
                         class="form-result">

                        <div class="result-icon"
                             id="resultIcon">

                            <i class="fa"></i>

                        </div>

                        <div class="result-content">

                            <p class="result-title"
                               id="resultTitle"></p>

                            <p class="result-text"
                               id="resultText"></p>

                        </div>

                    </div>


                    <form id="contactForm"
                          method="post"
                          action="${pageContext.request.contextPath}/contactServlet">

                        <input type="hidden"
                               name="operation"
                               value="sendmessage">


                        <div class="form-group">

                            <label for="fullname">
                                Full Name
                            </label>

                            <input
                                type="text"
                                id="fullname"
                                name="fullname"
                                class="form-control"
                                placeholder="Enter your full name"
                                autocomplete="name"
                                required>

                        </div>


                        <div class="form-group">

                            <label for="mailId">
                                Email Address
                            </label>

                            <input
                                type="email"
                                id="mailId"
                                name="mailId"
                                class="form-control"
                                placeholder="Enter your email address"
                                autocomplete="email"
                                required>

                        </div>


                        <div class="form-group">

                            <label for="message">
                                Your Message
                            </label>

                            <textarea
                                id="message"
                                name="message"
                                class="form-control"
                                placeholder="Write your message here..."
                                required></textarea>

                        </div>


                        <button
                            type="submit"
                            id="sendButton"
                            class="send-button">

                            <i class="fa fa-paper-plane"></i>

                            <span id="sendButtonText">
                                Send Message
                            </span>

                        </button>

                    </form>


                    <div class="contact-info">

                        <div class="contact-info-title">
                            Contact Information
                        </div>

                        <div class="info-item">

                            <div class="info-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>

                            <span>
                                Saki Naka Metro Station,
                                Mumbai - 400072
                            </span>

                        </div>


                        <div class="info-item">

                            <div class="info-icon">
                                <i class="fa fa-envelope"></i>
                            </div>

                            <span>
                                aamirkhan91613216@gmail.com
                            </span>

                        </div>

                    </div>

                </div>

            </div>


            <div class="contact-bottom">

                <h2>
                    Let's Connect With
                    <span>ExamPortal</span>
                </h2>

                <p>
                    Your questions, suggestions and feedback
                    help us improve the ExamPortal experience.
                    Feel free to reach out to our team.
                </p>

            </div>

        </div>

    </section>


    <jsp:include page="footer1.jsp" />


    <script>

        document.addEventListener(
            "DOMContentLoaded",
            function () {

                const form =
                    document.getElementById("contactForm");

                const button =
                    document.getElementById("sendButton");

                const buttonText =
                    document.getElementById("sendButtonText");

                const result =
                    document.getElementById("formResult");

                const resultIcon =
                    document.getElementById("resultIcon");

                const resultTitle =
                    document.getElementById("resultTitle");

                const resultText =
                    document.getElementById("resultText");


                if (!form) {
                    return;
                }


                form.addEventListener(
                    "submit",
                    async function (event) {

                        event.preventDefault();


                        const fullname =
                            document.getElementById("fullname").value.trim();

                        const mailId =
                            document.getElementById("mailId").value.trim();

                        const message =
                            document.getElementById("message").value.trim();


                        if (!fullname ||
                            !mailId ||
                            !message) {

                            showError(
                                "Please Complete All Fields",
                                "Please enter your name, email address and message before sending."
                            );

                            return;
                        }


                        button.disabled = true;

                        buttonText.textContent =
                            "Sending Message...";

                        button.querySelector("i").className =
                            "fa fa-spinner fa-spin";


                        result.className =
                            "form-result";


                        /*
                         * IMPORTANT:
                         * Send actual form fields as
                         * application/x-www-form-urlencoded.
                         */

                        const params =
                            new URLSearchParams();

                        params.append(
                            "operation",
                            "sendmessage"
                        );

                        params.append(
                            "fullname",
                            fullname
                        );

                        params.append(
                            "mailId",
                            mailId
                        );

                        params.append(
                            "message",
                            message
                        );


                        try {

                            const response =
                                await fetch(
                                    "${pageContext.request.contextPath}/contactServlet",
                                    {
                                        method: "POST",

                                        headers: {
                                            "Content-Type":
                                                "application/x-www-form-urlencoded; charset=UTF-8"
                                        },

                                        body: params.toString()
                                    }
                                );


                            const text =
                                (await response.text())
                                    .trim()
                                    .toUpperCase();


                            console.log(
                                "ContactServlet Response:",
                                text
                            );


                            if (
                                response.ok &&
                                text === "SUCCESS"
                            ) {

                                showSuccess();

                                form.reset();

                            } else {

                                showError(
                                    "Message Could Not Be Sent",
                                    "We could not deliver your message right now. Please try again in a few moments."
                                );

                            }

                        } catch (error) {

                            console.error(
                                "Contact request error:",
                                error
                            );

                            showError(
                                "Something Went Wrong",
                                "We were unable to connect with the ExamPortal server. Please try again after a moment."
                            );

                        } finally {

                            button.disabled = false;

                            buttonText.textContent =
                                "Send Message";

                            button.querySelector("i").className =
                                "fa fa-paper-plane";

                        }

                    }
                );


                function showSuccess() {

                    result.className =
                        "form-result success show";


                    resultIcon.innerHTML =
                        '<i class="fa fa-check"></i>';


                    resultTitle.textContent =
                        "Message Sent Successfully";


                    resultText.textContent =
                        "Thank you for contacting ExamPortal. Your message has been received by the Aamir Team. We will connect with you as soon as possible.";

                }


                function showError(title, text) {

                    result.className =
                        "form-result error show";


                    resultIcon.innerHTML =
                        '<i class="fa fa-exclamation"></i>';


                    resultTitle.textContent =
                        title;


                    resultText.textContent =
                        text;

                }

            }
        );

    </script>


</body>

</html>