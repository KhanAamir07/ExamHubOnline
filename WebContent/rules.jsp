<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Rules & Regulations</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">

    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
        rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background: #f5f7fb;
            color: #1e293b;
        }

        .rules-page {
            min-height: 100vh;
            padding: 115px 20px 80px;
        }

        .rules-container {
            max-width: 1050px;
            margin: 0 auto;
        }

        /* HERO */

        .rules-hero {
            position: relative;
            overflow: hidden;
            padding: 55px 45px;
            margin-bottom: 30px;
            border-radius: 24px;
            background:
                linear-gradient(135deg, #0f172a 0%, #172554 55%, #1e3a8a 100%);
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.18);
        }

        .rules-hero::before {
            content: "";
            position: absolute;
            width: 260px;
            height: 260px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.06);
            right: -80px;
            top: -100px;
        }

        .rules-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.04);
            left: -80px;
            bottom: -100px;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            padding: 8px 15px;
            margin-bottom: 18px;
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 50px;
            background: rgba(255,255,255,0.08);
            color: #e2e8f0;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .hero-title {
            margin: 0 0 12px;
            color: #ffffff;
            font-size: 38px;
            font-weight: 700;
            line-height: 1.2;
        }

        .hero-text {
            max-width: 700px;
            margin: 0;
            color: #cbd5e1;
            font-size: 15px;
            line-height: 1.8;
        }

        /* MAIN CARD */

        .rules-card {
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            background: #ffffff;
            box-shadow: 0 12px 35px rgba(15, 23, 42, 0.07);
        }

        .rules-card-header {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 28px 32px;
            border-bottom: 1px solid #edf1f5;
            background: #ffffff;
        }

        .rules-icon {
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

        .rules-card-header h2 {
            margin: 0 0 5px;
            color: #0f172a;
            font-size: 21px;
            font-weight: 700;
        }

        .rules-card-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        /* RULES */

        .rules-list {
            margin: 0;
            padding: 15px 32px 30px 70px;
            counter-reset: rules;
            list-style: none;
        }

        .rules-list li {
            position: relative;
            margin: 0;
            padding: 20px 20px 20px 25px;
            border-bottom: 1px solid #eef2f7;
            color: #475569;
            font-size: 14px;
            line-height: 1.8;
        }

        .rules-list li:last-child {
            border-bottom: none;
        }

        .rules-list li::before {
            content: counter(rules);
            counter-increment: rules;
            position: absolute;
            left: -48px;
            top: 19px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 10px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 12px;
            font-weight: 700;
        }

        .rules-list strong {
            color: #0f172a;
            font-weight: 700;
        }

        /* IMPORTANT NOTE */

        .important-note {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin: 0 32px 32px;
            padding: 20px;
            border: 1px solid #fde68a;
            border-radius: 15px;
            background: #fffbeb;
        }

        .note-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            flex-shrink: 0;
            border-radius: 10px;
            background: #fef3c7;
            color: #d97706;
            font-weight: 700;
        }

        .important-note h3 {
            margin: 0 0 5px;
            color: #92400e;
            font-size: 14px;
            font-weight: 700;
        }

        .important-note p {
            margin: 0;
            color: #92400e;
            font-size: 13px;
            line-height: 1.7;
        }

        /* RESPONSIVE */

        @media (max-width: 768px) {

            .rules-page {
                padding: 95px 15px 60px;
            }

            .rules-hero {
                padding: 40px 25px;
                border-radius: 20px;
            }

            .hero-title {
                font-size: 29px;
            }

            .hero-text {
                font-size: 13px;
            }

            .rules-card-header {
                padding: 22px;
            }

            .rules-list {
                padding: 10px 22px 20px 62px;
            }

            .rules-list li {
                padding: 17px 5px 17px 15px;
                font-size: 13px;
            }

            .important-note {
                margin: 0 22px 22px;
            }
        }

        @media (max-width: 480px) {

            .rules-page {
                padding-left: 10px;
                padding-right: 10px;
            }

            .rules-hero {
                padding: 32px 20px;
            }

            .hero-title {
                font-size: 25px;
            }

            .rules-card-header {
                gap: 12px;
            }

            .rules-icon {
                width: 44px;
                height: 44px;
                font-size: 18px;
            }

            .rules-card-header h2 {
                font-size: 18px;
            }

            .rules-list {
                padding-left: 55px;
                padding-right: 15px;
            }

            .rules-list li::before {
                left: -42px;
            }

            .important-note {
                flex-direction: column;
            }
        }

    </style>

</head>

<body>

    <jsp:include page="menu1.jsp" />

    <main class="rules-page">

        <div class="rules-container">

            <!-- HERO -->

            <section class="rules-hero">

                <div class="hero-content">

                    <span class="hero-badge">
                        Exam Guidelines
                    </span>

                    <h1 class="hero-title">
                        Rules & Regulations
                    </h1>

                    <p class="hero-text">
                        Please read all examination guidelines carefully before
                        starting your online test. Following these rules helps
                        ensure a smooth and successful examination experience.
                    </p>

                </div>

            </section>


            <!-- RULES CARD -->

            <section class="rules-card">

                <div class="rules-card-header">

                    <div class="rules-icon">
                        &#128221;
                    </div>

                    <div>
                        <h2>Important Examination Rules</h2>
                        <p>
                            Please follow all instructions before and during your test.
                        </p>
                    </div>

                </div>


                <ol class="rules-list">

                    <li>
                        To give an online test, the student must register himself
                        or herself. Make sure you are logged in to your account.
                    </li>

                    <li>
                        Make sure you have a good and stable internet connection
                        before starting the examination.
                    </li>

                    <li>
                        If you are taking the exam late in the day, it is recommended
                        that you reboot your computer before beginning to free up
                        memory resources from other programs.
                    </li>

                    <li>
                        Shut down all instant messaging tools and email programs
                        as they can conflict with ExamPortal during the examination.
                    </li>

                    <li>
                        Enter ExamPortal using
                        <strong>Google Chrome</strong>.
                        Do not use any other internet browser.
                    </li>

                    <li>
                        Maximize your browser window before starting the test.
                        Minimizing the browser window during the exam can prevent
                        submission of your exam.
                    </li>

                    <li>
                        When you begin the exam, click the launch link only
                        <strong>once</strong>. Double-clicking can lock the test.
                    </li>

                    <li>
                        Do not resize or minimize the browser during the test.
                    </li>

                    <li>
                        Never click the
                        <strong>Back</strong>
                        button on the browser. This can take you out of the test
                        and prevent ExamPortal from tracking your selected answers.
                    </li>

                    <li>
                        Click the
                        <strong>Submit</strong>
                        button to submit your exam.
                        Do not press <strong>Enter</strong> on the keyboard
                        to submit the exam.
                    </li>

                    <li>
                        Once the test has been submitted, the submission
                        <strong>cannot be undone</strong>.
                    </li>

                </ol>


                <!-- IMPORTANT NOTE -->

                <div class="important-note">

                    <div class="note-icon">
                        !
                    </div>

                    <div>

                        <h3>Important</h3>

                        <p>
                            Make sure you are ready before starting the examination.
                            Keep your browser open, maintain a stable internet
                            connection, and submit your test only when you are
                            completely finished.
                        </p>

                    </div>

                </div>

            </section>

        </div>

    </main>

    <jsp:include page="footer1.jsp" />

</body>

</html>