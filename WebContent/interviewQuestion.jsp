<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Question Bank</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

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
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif !important;
        }

        .question-page {
            min-height: 100vh;
            padding: 115px 20px 70px;
        }

        .question-container {
            width: min(1180px, 100%);
            margin: 0 auto;
        }

        /* ================= HERO ================= */

        .question-hero {
            position: relative;
            overflow: hidden;
            padding: 55px 55px;
            margin-bottom: 30px;
            border-radius: 30px;
            color: #ffffff;
            background:
                radial-gradient(circle at 85% 15%,
                    rgba(75, 190, 255, .25),
                    transparent 28%),
                radial-gradient(circle at 10% 90%,
                    rgba(105, 76, 255, .22),
                    transparent 30%),
                linear-gradient(135deg,
                    #101827 0%,
                    #18263d 55%,
                    #111b2c 100%);
            box-shadow:
                0 25px 65px rgba(15, 23, 42, .18);
        }

        .question-hero::after {
            content: "";
            position: absolute;
            width: 240px;
            height: 240px;
            right: -90px;
            bottom: -110px;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,.10);
            box-shadow:
                0 0 0 35px rgba(255,255,255,.025),
                0 0 0 70px rgba(255,255,255,.02);
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            padding: 9px 16px;
            border: 1px solid rgba(255,255,255,.16);
            border-radius: 50px;
            background: rgba(255,255,255,.08);
            color: rgba(255,255,255,.9);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .9px;
            text-transform: uppercase;
        }

        .hero-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #59c8ff;
            box-shadow: 0 0 12px rgba(89,200,255,.8);
        }

        .question-hero h1 {
            position: relative;
            z-index: 2;
            margin: 20px 0 12px;
            font-size: clamp(34px, 5vw, 56px);
            line-height: 1.08;
            font-weight: 800;
            letter-spacing: -1.8px;
        }

        .question-hero h1 span {
            color: #5dcaff;
        }

        .question-hero p {
            position: relative;
            z-index: 2;
            max-width: 760px;
            margin: 0;
            color: rgba(255,255,255,.72);
            font-size: 15px;
            line-height: 1.9;
        }

        .hero-stats {
            position: relative;
            z-index: 2;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 28px;
        }

        .hero-stat {
            padding: 11px 16px;
            border: 1px solid rgba(255,255,255,.12);
            border-radius: 12px;
            background: rgba(255,255,255,.07);
            color: rgba(255,255,255,.86);
            font-size: 12px;
            font-weight: 600;
        }

        /* ================= INTRO ================= */

        .intro-card {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 25px 28px;
            margin-bottom: 22px;
            border: 1px solid #e6ebf3;
            border-radius: 22px;
            background: #ffffff;
            box-shadow: 0 12px 35px rgba(15,23,42,.055);
        }

        .intro-icon {
            flex: 0 0 52px;
            width: 52px;
            height: 52px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 15px;
            background: #edf7ff;
            color: #1388e8;
            font-size: 22px;
            font-weight: 800;
        }

        .intro-card h2 {
            margin: 0 0 5px;
            font-size: 18px;
            font-weight: 800;
        }

        .intro-card p {
            margin: 0;
            color: #6b768a;
            font-size: 13px;
            line-height: 1.7;
        }

        /* ================= ACCORDION ================= */

        .question-group {
            overflow: hidden;
            margin-bottom: 18px;
            border: 1px solid #e4e9f1;
            border-radius: 22px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(15,23,42,.055);
            transition: .25s ease;
        }

        .question-group:hover {
            box-shadow: 0 18px 42px rgba(15,23,42,.09);
        }

        .group-header {
            position: relative;
            width: 100%;
            display: flex;
            align-items: center;
            gap: 17px;
            padding: 22px 25px;
            border: 0;
            background: #ffffff;
            cursor: pointer;
            text-align: left;
            font-family: 'Montserrat', sans-serif;
        }

        .group-header:hover {
            background: #fafcff;
        }

        .group-number {
            flex: 0 0 45px;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background: linear-gradient(135deg,#eaf7ff,#eef1ff);
            color: #167fd3;
            font-size: 13px;
            font-weight: 800;
        }

        .group-info {
            flex: 1;
            min-width: 0;
        }

        .group-info strong {
            display: block;
            margin-bottom: 4px;
            color: #182237;
            font-size: 15px;
            font-weight: 800;
        }

        .group-info span {
            color: #8993a5;
            font-size: 11px;
            font-weight: 500;
        }

        .group-arrow {
            flex: 0 0 34px;
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #f2f5f9;
            color: #526075;
            font-size: 18px;
            transition: .3s ease;
        }

        .question-group.active .group-arrow {
            transform: rotate(180deg);
            background: #eaf7ff;
            color: #1388e8;
        }

        .group-content {
            display: none;
            padding: 0 25px 28px;
            border-top: 1px solid #edf0f5;
        }

        .question-group.active .group-content {
            display: block;
        }

        .group-title {
            margin: 25px 0 18px;
            color: #1a2538;
            font-size: 23px;
            font-weight: 800;
        }

        .note-box {
            padding: 17px 19px;
            margin-bottom: 20px;
            border: 1px solid #dceeff;
            border-left: 4px solid #2196e8;
            border-radius: 14px;
            background: #f6fbff;
            color: #56657a;
            font-size: 13px;
            line-height: 1.8;
        }

        .note-box strong {
            color: #137dce;
        }

        /* ================= QUESTIONS ================= */

        .question-item {
            position: relative;
            padding: 21px 20px;
            margin-bottom: 13px;
            border: 1px solid #e8edf3;
            border-radius: 16px;
            background: #fbfcfe;
            transition: .2s ease;
        }

        .question-item:hover {
            border-color: #d8e8f7;
            background: #ffffff;
            transform: translateY(-1px);
        }

        .question-item:last-child {
            margin-bottom: 0;
        }

        .question-text {
            margin: 0;
            color: #253146;
            font-size: 14px;
            line-height: 1.8;
            font-weight: 700;
        }

        .question-text .q-no {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 29px;
            height: 25px;
            margin-right: 8px;
            padding: 0 7px;
            border-radius: 8px;
            background: #eaf6ff;
            color: #1386df;
            font-size: 10px;
            font-weight: 800;
            vertical-align: middle;
        }

        .option-list {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 8px;
            margin-top: 13px;
        }

        .option {
            padding: 11px 13px;
            border: 1px solid #edf0f4;
            border-radius: 10px;
            background: #ffffff;
            color: #6a7588;
            font-size: 12px;
            line-height: 1.6;
        }

        /* ================= JAVA / TOPICS ================= */

        .topic-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 12px;
            margin-top: 18px;
        }

        .topic-card {
            padding: 17px;
            border: 1px solid #e8edf3;
            border-radius: 14px;
            background: #fbfcfe;
        }

        .topic-card strong {
            display: block;
            margin-bottom: 7px;
            color: #263247;
            font-size: 13px;
            font-weight: 800;
        }

        .topic-card span {
            color: #69758a;
            font-size: 12px;
            line-height: 1.7;
        }

        /* ================= FOOTER CTA ================= */

        .closing-card {
            padding: 40px 25px;
            margin-top: 25px;
            border-radius: 24px;
            text-align: center;
            color: #ffffff;
            background:
                radial-gradient(circle at 15% 20%,
                    rgba(80,190,255,.17),
                    transparent 30%),
                linear-gradient(135deg,#111b2c,#192941);
            box-shadow: 0 20px 50px rgba(15,23,42,.14);
        }

        .closing-card h2 {
            margin: 0 0 10px;
            font-size: 28px;
            font-weight: 800;
        }

        .closing-card p {
            max-width: 680px;
            margin: auto;
            color: rgba(255,255,255,.7);
            font-size: 13px;
            line-height: 1.8;
        }

        .top-button {
            display: inline-flex;
            margin-top: 22px;
            padding: 12px 20px;
            border-radius: 30px;
            background: #168ce9;
            color: #ffffff !important;
            text-decoration: none;
            font-size: 12px;
            font-weight: 700;
            transition: .2s ease;
        }

        .top-button:hover {
            background: #0875c9;
            transform: translateY(-2px);
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 768px) {

            .question-page {
                padding: 95px 14px 50px;
            }

            .question-hero {
                padding: 35px 24px;
                border-radius: 22px;
            }

            .question-hero h1 {
                font-size: 34px;
            }

            .question-hero p {
                font-size: 13px;
            }

            .intro-card {
                padding: 20px;
            }

            .group-header {
                padding: 18px;
            }

            .group-content {
                padding: 0 18px 22px;
            }

            .group-title {
                font-size: 20px;
            }

            .option-list,
            .topic-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {

            .question-hero h1 {
                font-size: 29px;
            }

            .hero-stat {
                font-size: 10px;
            }

            .group-number {
                flex-basis: 40px;
                width: 40px;
                height: 40px;
            }

            .group-info strong {
                font-size: 13px;
            }

            .question-text {
                font-size: 13px;
            }
        }

    </style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<main class="question-page">

    <div class="question-container">

        <!-- HERO -->

        <section class="question-hero">

            <div class="hero-badge">
                <span class="hero-dot"></span>
                Career Preparation
            </div>

            <h1>
                Interview
                <span>Question Bank</span>
            </h1>

            <p>
                Prepare for technical and professional interviews with
                frequently asked questions covering software testing,
                Selenium, Java, SQL, .NET, web applications and
                programming fundamentals.
            </p>

            <div class="hero-stats">

                <div class="hero-stat">
                    Technical Interviews
                </div>

                <div class="hero-stat">
                    Java & Programming
                </div>

                <div class="hero-stat">
                    Software Testing
                </div>

                <div class="hero-stat">
                    Selenium WebDriver
                </div>

            </div>

        </section>


        <!-- INTRO -->

        <section class="intro-card">

            <div class="intro-icon">
                ?
            </div>

            <div>
                <h2>
                    Most Frequently Asked Interview Questions
                </h2>

                <p>
                    Select a topic below to explore interview questions
                    and prepare for your next technical discussion.
                </p>
            </div>

        </section>


        <!-- GROUP 01 -->

        <section class="question-group active">

            <button class="group-header" type="button">

                <div class="group-number">
                    01
                </div>

                <div class="group-info">

                    <strong>
                        Technical Aptitude & STLC
                    </strong>

                    <span>
                        Software Testing Life Cycle
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Quality Kiosk — Frequently Asked Technical Questions
                </h2>

                <div class="note-box">

                    <strong>Note:</strong>
                    Most of the questions in technical aptitude
                    were based on STLC.

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">01</span>
                        Which one is in proper chronological order?
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Unit testing, system testing,
                            acceptance testing, maintenance testing.
                        </div>

                        <div class="option">
                            B) Acceptance testing, system testing,
                            unit testing, maintenance testing.
                        </div>

                        <div class="option">
                            C) System testing, unit testing,
                            acceptance testing, maintenance testing.
                        </div>

                    </div>

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">02</span>
                        Implementation & Execution for what in STLC?
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Writing test summary
                        </div>

                        <div class="option">
                            B) Designing test
                        </div>

                    </div>

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">03</span>
                        Developers follow which process in order to
                        fix defect?
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Walk-through
                        </div>

                        <div class="option">
                            B) Technical review of specification
                        </div>

                        <div class="option">
                            C) Inspection
                        </div>

                        <div class="option">
                            D) Reviewing requirements
                        </div>

                    </div>

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">04</span>
                        Any defect in top down will affect what kind
                        of testing?
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Integration testing
                        </div>

                        <div class="option">
                            B) Unit testing
                        </div>

                        <div class="option">
                            C) System testing
                        </div>

                        <div class="option">
                            D) Acceptance testing
                        </div>

                    </div>

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">05</span>
                        Why Retesting is done? Choose the most
                        appropriate answer.
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Fixing the bug
                        </div>

                        <div class="option">
                            B) Re-executing previous failed test case
                        </div>

                        <div class="option">
                            C) To check whether the defect found earlier
                            is fixed by the developer or not
                        </div>

                    </div>

                </div>


                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">06</span>
                        Use cases describes?
                    </p>

                    <div class="option-list">

                        <div class="option">
                            A) Describes entire flow of system.
                        </div>

                        <div class="option">
                            B) To design test case
                        </div>

                    </div>

                </div>


                <div class="note-box">

                    <strong>Interview Focus:</strong>
                    Performance testing and Selenium WebDriver
                    were also important areas in the technical
                    face-to-face round.

                </div>

            </div>

        </section>


        <!-- GROUP 02 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    02
                </div>

                <div class="group-info">

                    <strong>
                        Testing Interview Questions
                    </strong>

                    <span>
                        Software Testing & Manual Testing
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Frequently Asked Testing Questions
                </h2>


                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">01</span>
                        What is priority and severity if HELP menu
                        is not working in a website?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">02</span>
                        What is SDLC? Explain its phases.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">03</span>
                        What is Test Scenario and Test Case?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">04</span>
                        One test scenario gives multiple test cases?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">05</span>
                        One test case gives multiple test scenarios?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">06</span>
                        Questions on hobbies as per your resume?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">07</span>
                        What is 2G and 3G?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">08</span>
                        Has Reliance launched 4G?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">09</span>
                        Do you have knowledge of Mobile Testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">10</span>
                        What is software testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">11</span>
                        What is sanity testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">12</span>
                        What is performance testing and load testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">13</span>
                        Types of severity and types of priority
                        with examples?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">14</span>
                        What are the types of testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">15</span>
                        Why does a tester not perform white box testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">16</span>
                        Why do we check code in white box testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">17</span>
                        Write a defect report in a live application.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">18</span>
                        How to insert a table in Microsoft Word?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">19</span>
                        How to underline text in PowerPoint?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">20</span>
                        Shortcut for underlined text in PowerPoint?
                    </p>
                </div>

                <div class="note-box">

                    <strong>Interview Tip:</strong>
                    Keep your answers positive and focus on
                    practical understanding.

                </div>

            </div>

        </section>


        <!-- GROUP 03 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    03
                </div>

                <div class="group-info">

                    <strong>
                        Selenium WebDriver
                    </strong>

                    <span>
                        Automation Testing Questions
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Selenium & Automation Interview Questions
                </h2>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">01</span>
                        How do we test login page using Selenium WebDriver?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">02</span>
                        How to check performance of web application
                        using Selenium WebDriver?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">03</span>
                        Difference between Selenium WebDriver
                        and Selenium IDE.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">04</span>
                        How to locate object of username field
                        in Selenium WebDriver?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">05</span>
                        Why do we do automation testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">06</span>
                        How will you manually test login page?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">07</span>
                        How will you manually check performance
                        of a web application?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">08</span>
                        If a web application is updated often,
                        how will you test it using Selenium WebDriver?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">09</span>
                        What is a use case and test case?
                        Difference between use case and test case.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">10</span>
                        What is a test scenario?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">11</span>
                        What is agile testing?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">12</span>
                        How will you locate a particular cell
                        in an Excel sheet using Selenium WebDriver?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">13</span>
                        What is Mantis? Why do we use it?
                        How do you report a defect in Mantis?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">14</span>
                        Open a Gmail web page using Selenium WebDriver.
                        Write a program.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">15</span>
                        How to test Gmail manually?
                    </p>
                </div>

            </div>

        </section>


        <!-- GROUP 04 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    04
                </div>

                <div class="group-info">

                    <strong>
                        Java Programming
                    </strong>

                    <span>
                        Core Java & Programming Fundamentals
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Java Programming Topics
                </h2>

                <div class="topic-grid">

                    <div class="topic-card">
                        <strong>01 · Pattern Programs</strong>
                        <span>
                            Star patterns and basic programming logic.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>02 · Number Comparison</strong>
                        <span>
                            Finding the bigger number among three numbers.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>03 · Palindrome</strong>
                        <span>
                            Palindrome program and explanation of logic.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>04 · Strings</strong>
                        <span>
                            String creation and StringBuilder concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>05 · Collections</strong>
                        <span>
                            HashMap, Hashtable and iterator concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>06 · Threads</strong>
                        <span>
                            Threading, sleep, wait, notify and synchronization.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>07 · OOP</strong>
                        <span>
                            Polymorphism and encapsulation.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>08 · Java Basics</strong>
                        <span>
                            Java fundamentals and programming concepts.
                        </span>
                    </div>

                </div>

            </div>

        </section>


        <!-- GROUP 05 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    05
                </div>

                <div class="group-info">

                    <strong>
                        Java — Technical Round
                    </strong>

                    <span>
                        Frequently Asked Java Questions
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Core Java Interview Questions
                </h2>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">01</span>
                        What will happen if we write final in front
                        of StringBuilder?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">02</span>
                        What is the way of creating a String by not
                        using a literal and new keyword?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">03</span>
                        How to avoid using sleep in threads?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">04</span>
                        Difference between HashMap and Hashtable.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">05</span>
                        What iterator does except iterating
                        elements in forward direction?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">06</span>
                        What is Enumeration? What does Enumeration do?
                    </p>
                </div>

            </div>

        </section>


        <!-- GROUP 06 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    06
                </div>

                <div class="group-info">

                    <strong>
                        Java & Web Application
                    </strong>

                    <span>
                        Technical discussion topics
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Java Technical Discussion
                </h2>

                <div class="topic-grid">

                    <div class="topic-card">
                        <strong>Java</strong>
                        <span>
                            What is Java?
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Threading</strong>
                        <span>
                            join(), sleep(), wait(), notify()
                            and synchronization.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Static & Final</strong>
                        <span>
                            Static keyword and final keyword.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Polymorphism</strong>
                        <span>
                            Object-oriented programming concept.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Encapsulation</strong>
                        <span>
                            Encapsulation and its use in Java.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Web Application</strong>
                        <span>
                            Basic web application concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Server</strong>
                        <span>
                            Server-side application concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Final Year Project</strong>
                        <span>
                            Project explanation and technical discussion.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>MySQL</strong>
                        <span>
                            Database and basic MySQL concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>SQL Queries</strong>
                        <span>
                            Basic SQL query questions.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>WAR File</strong>
                        <span>
                            Web application deployment package.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Project Deep Dive</strong>
                        <span>
                            Technical questions related to the final year project.
                        </span>
                    </div>

                </div>

            </div>

        </section>


        <!-- GROUP 07 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    07
                </div>

                <div class="group-info">

                    <strong>
                        SQL & .NET
                    </strong>

                    <span>
                        Database and .NET interview fundamentals
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Technical Questions
                </h2>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">01</span>
                        What is ASP.NET?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">02</span>
                        What is SQL?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">03</span>
                        What are different types of joins in SQL?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">04</span>
                        What are validators?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">05</span>
                        What are range validators?
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">06</span>
                        Tell me about yourself.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">07</span>
                        Write a query on a table.
                    </p>
                </div>

            </div>

        </section>


        <!-- GROUP 08 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    08
                </div>

                <div class="group-info">

                    <strong>
                        ASP.NET Technical Questions
                    </strong>

                    <span>
                        Web development fundamentals
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    .NET Interview Topics
                </h2>

                <div class="topic-grid">

                    <div class="topic-card">
                        <strong>ASP.NET Framework</strong>
                        <span>
                            What is .NET Framework?
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>OOP Concept</strong>
                        <span>
                            Important object-oriented programming concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>State Management</strong>
                        <span>
                            State management concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Session</strong>
                        <span>
                            Session management in web applications.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Inheritance</strong>
                        <span>
                            Inheritance concepts in .NET.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Boxing & Unboxing</strong>
                        <span>
                            Difference between boxing and unboxing.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Value & Reference Type</strong>
                        <span>
                            Difference between value type and reference type.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Validation</strong>
                        <span>
                            Types of validation in ASP.NET.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Cookies</strong>
                        <span>
                            Cookies and their use.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Response Redirect</strong>
                        <span>
                            Difference between response redirect
                            and server transfer.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Caching</strong>
                        <span>
                            Caching concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Exception Handling</strong>
                        <span>
                            Types of exception handling.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Array</strong>
                        <span>
                            Array concepts and usage.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>Garbage Collector</strong>
                        <span>
                            Garbage collection concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>ASP.NET Lifecycle</strong>
                        <span>
                            ASP.NET page lifecycle.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>DataReader</strong>
                        <span>
                            DataReader and database access.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>DataSet</strong>
                        <span>
                            DataSet concepts.
                        </span>
                    </div>

                    <div class="topic-card">
                        <strong>DataSet vs DataReader</strong>
                        <span>
                            Difference between DataSet and DataReader.
                        </span>
                    </div>

                </div>

            </div>

        </section>


        <!-- GROUP 09 -->

        <section class="question-group">

            <button class="group-header" type="button">

                <div class="group-number">
                    09
                </div>

                <div class="group-info">

                    <strong>
                        Java Programs
                    </strong>

                    <span>
                        Programming practice
                    </span>

                </div>

                <div class="group-arrow">
                    ↓
                </div>

            </button>

            <div class="group-content">

                <h2 class="group-title">
                    Java Programming Practice
                </h2>

                <div class="question-item">

                    <p class="question-text">
                        <span class="q-no">01</span>
                        Star pattern programs.
                    </p>

                    <div class="example-pattern"
                         style="
                         margin-top:15px;
                         padding:18px;
                         border-radius:12px;
                         background:#111827;
                         color:#d8f3ff;
                         font-family:monospace;
                         font-size:14px;
                         line-height:1.7;
                         overflow:auto;">
<pre style="margin:0;">*
* *
* * *</pre>
                    </div>

                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">02</span>
                        Find the bigger number among three numbers.
                    </p>
                </div>

                <div class="question-item">
                    <p class="question-text">
                        <span class="q-no">03</span>
                        Write a program to check whether a number
                        or string is a palindrome.
                    </p>
                </div>

            </div>

        </section>


        <!-- CLOSING -->

        <section class="closing-card">

            <h2>
                Prepare. Practice. Perform.
            </h2>

            <p>
                Use these interview topics to strengthen your technical
                knowledge, practice explaining concepts clearly and
                prepare for technical discussions with confidence.
            </p>

            <a href="#"
               class="top-button"
               onclick="window.scrollTo({top:0, behavior:'smooth'}); return false;">
                ↑ Back to Top
            </a>

        </section>

    </div>

</main>


<jsp:include page="footer1.jsp" />


<script>

    document.addEventListener("DOMContentLoaded", function () {

        const headers =
            document.querySelectorAll(".group-header");

        headers.forEach(function (header) {

            header.addEventListener("click", function () {

                const currentGroup =
                    this.closest(".question-group");

                document
                    .querySelectorAll(".question-group")
                    .forEach(function (group) {

                        if (group !== currentGroup) {
                            group.classList.remove("active");
                        }

                    });

                currentGroup.classList.toggle("active");

            });

        });

    });

</script>

</body>
</html>