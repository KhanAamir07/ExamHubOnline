<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Resources</title>

    <!-- GOOGLE FONTS -->
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

    <!-- BOOTSTRAP -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">

    <!-- FONT AWESOME -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">

    <!-- TEMPLATE CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">

    <!-- GLOBAL CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">


    <style>

        * {
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            color: #1d2433;
        }

        /* =====================================================
           NAVBAR
        ===================================================== */

        .resource-navbar {
            position: sticky;
            top: 0;
            z-index: 9999;
            width: 100%;
            background: rgba(8, 15, 30, 0.97);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        .resource-nav-container {
            width: 92%;
            max-width: 1350px;
            height: 76px;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .resource-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none !important;
        }

        .resource-logo-icon {
            width: 42px;
            height: 42px;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg,#ff675d,#ff9c94);
            color: white;
            font-size: 18px;
            box-shadow: 0 8px 22px rgba(255,103,93,0.30);
        }

        .resource-logo-text {
            color: white;
            font-size: 23px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .resource-logo-text span {
            color: #ff675d;
        }

        .resource-nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .resource-nav-links a {
            color: #c8d0df;
            text-decoration: none !important;
            font-size: 13px;
            font-weight: 600;
            transition: 0.3s;
        }

        .resource-nav-links a:hover {
            color: white;
        }

        .resource-nav-links .nav-active {
            color: #ff675d;
        }

        .resource-nav-btn {
            padding: 11px 18px;
            background: #ff675d;
            color: white !important;
            border-radius: 8px;
        }

        .resource-menu-btn {
            display: none;
            border: 1px solid rgba(255,255,255,0.15);
            background: transparent;
            color: white;
            width: 43px;
            height: 43px;
            border-radius: 9px;
            font-size: 18px;
            cursor: pointer;
        }


        /* =====================================================
           HERO
        ===================================================== */

        .resources-hero {
            position: relative;
            overflow: hidden;
            padding: 95px 20px 85px;
            background:
                radial-gradient(
                    circle at 10% 20%,
                    rgba(255,103,93,0.18),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 90% 80%,
                    rgba(0,212,255,0.13),
                    transparent 30%
                ),
                #080d18;
        }

        .resources-hero::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image:
                linear-gradient(
                    rgba(255,255,255,0.025) 1px,
                    transparent 1px
                ),
                linear-gradient(
                    90deg,
                    rgba(255,255,255,0.025) 1px,
                    transparent 1px
                );
            background-size: 45px 45px;
        }

        .resources-hero-content {
            position: relative;
            z-index: 2;
            max-width: 1050px;
            margin: auto;
            text-align: center;
        }

        .resource-badge {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            padding: 9px 16px;
            border-radius: 30px;
            color: #ff9188;
            background: rgba(255,103,93,0.10);
            border: 1px solid rgba(255,103,93,0.25);
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.5px;
            margin-bottom: 20px;
        }

        .resources-hero h1 {
            color: white;
            font-size: clamp(40px,5vw,65px);
            font-weight: 800;
            letter-spacing: -2px;
            margin-bottom: 18px;
        }

        .resources-hero h1 span {
            color: #ff675d;
        }

        .resources-hero p {
            max-width: 760px;
            margin: auto;
            color: #9da8ba;
            font-size: 15px;
            line-height: 1.9;
        }


        /* =====================================================
           SEARCH
        ===================================================== */

        .resource-search-wrapper {
            max-width: 850px;
            margin: -30px auto 55px;
            position: relative;
            z-index: 10;
            padding: 0 20px;
        }

        .resource-search {
            display: flex;
            align-items: center;
            gap: 12px;
            background: white;
            padding: 12px 18px;
            border-radius: 15px;
            box-shadow: 0 18px 50px rgba(15,23,42,0.13);
            border: 1px solid #e8ebf0;
        }

        .resource-search i {
            color: #ff675d;
            font-size: 18px;
        }

        .resource-search input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 14px;
            color: #1d2433;
            background: transparent;
        }

        .resource-search input::placeholder {
            color: #9aa3b2;
        }


        /* =====================================================
           RESOURCE SECTION
        ===================================================== */

        .resources-section {
            padding: 30px 0 100px;
        }

        .resource-container {
            width: 92%;
            max-width: 1250px;
            margin: auto;
        }

        .section-heading {
            text-align: center;
            margin-bottom: 45px;
        }

        .section-heading small {
            color: #ff675d;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 2px;
        }

        .section-heading h2 {
            font-size: 38px;
            font-weight: 800;
            margin: 9px 0 12px;
            color: #172033;
        }

        .section-heading h2 span {
            color: #ff675d;
        }

        .section-heading p {
            max-width: 700px;
            margin: auto;
            color: #7b8596;
            font-size: 13px;
            line-height: 1.8;
        }


        /* =====================================================
           RESOURCE CARDS
        ===================================================== */

        .resource-grid {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 22px;
        }

        .resource-card {
            position: relative;
            background: white;
            border: 1px solid #e6eaf0;
            border-radius: 20px;
            padding: 30px;
            min-height: 270px;
            overflow: hidden;
            transition: 0.35s ease;
            box-shadow: 0 10px 30px rgba(23,32,51,0.04);
        }

        .resource-card::before {
            content: "";
            position: absolute;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: rgba(255,103,93,0.07);
            top: -45px;
            right: -35px;
        }

        .resource-card:hover {
            transform: translateY(-9px);
            border-color: rgba(255,103,93,0.35);
            box-shadow: 0 25px 55px rgba(23,32,51,0.11);
        }

        .resource-icon {
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #fff0ee;
            color: #ff675d;
            font-size: 23px;
            margin-bottom: 20px;
        }

        .resource-card h3 {
            font-size: 19px;
            font-weight: 800;
            margin-bottom: 11px;
            color: #172033;
        }

        .resource-card p {
            color: #7b8596;
            font-size: 12px;
            line-height: 1.8;
            margin-bottom: 18px;
        }

        .resource-link {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            color: #ff675d;
            font-size: 11px;
            font-weight: 800;
            text-decoration: none !important;
        }

        .resource-link:hover {
            color: #e9554d;
        }


        /* =====================================================
           RESOURCE TYPES
        ===================================================== */

        .resource-types {
            margin-top: 70px;
            display: grid;
            grid-template-columns: repeat(4,1fr);
            gap: 16px;
        }

        .resource-type {
            background: #080d18;
            border-radius: 16px;
            padding: 25px 20px;
            text-align: center;
            color: white;
            transition: 0.3s ease;
        }

        .resource-type:hover {
            transform: translateY(-6px);
            background: #101827;
        }

        .resource-type i {
            color: #ff675d;
            font-size: 25px;
            margin-bottom: 13px;
        }

        .resource-type h4 {
            font-size: 14px;
            margin-bottom: 7px;
        }

        .resource-type p {
            color: #8e99ab;
            font-size: 10px;
            line-height: 1.6;
            margin: 0;
        }


        /* =====================================================
           CTA
        ===================================================== */

        .resources-cta {
            margin-top: 70px;
            padding: 55px 30px;
            border-radius: 25px;
            text-align: center;
            background:
                linear-gradient(
                    135deg,
                    #080d18,
                    #172236
                );
        }

        .resources-cta h2 {
            color: white;
            font-size: 31px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .resources-cta h2 span {
            color: #ff675d;
        }

        .resources-cta p {
            max-width: 680px;
            margin: 0 auto 25px;
            color: #929db0;
            font-size: 13px;
            line-height: 1.8;
        }

        .cta-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 13px 21px;
            background: #ff675d;
            color: white !important;
            border-radius: 9px;
            font-size: 12px;
            font-weight: 800;
            text-decoration: none !important;
            transition: 0.3s;
        }

        .cta-btn:hover {
            background: white;
            color: #172033 !important;
            transform: translateY(-3px);
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1000px) {

            .resource-grid {
                grid-template-columns: repeat(2,1fr);
            }

            .resource-types {
                grid-template-columns: repeat(2,1fr);
            }

        }


        @media (max-width: 800px) {

            .resource-nav-links {
                position: absolute;
                top: 76px;
                left: 0;
                width: 100%;
                display: none;
                flex-direction: column;
                align-items: stretch;
                gap: 0;
                padding: 12px;
                background: #0b1220;
                border-top: 1px solid rgba(255,255,255,0.08);
            }

            .resource-nav-links.show {
                display: flex;
            }

            .resource-nav-links a {
                padding: 13px;
            }

            .resource-menu-btn {
                display: block;
            }

            .resource-grid {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 600px) {

            .resource-nav-container {
                height: 68px;
            }

            .resource-logo-text {
                font-size: 20px;
            }

            .resources-hero {
                padding: 75px 18px;
            }

            .resources-hero h1 {
                font-size: 40px;
            }

            .resources-hero p {
                font-size: 12px;
            }

            .section-heading h2 {
                font-size: 31px;
            }

            .resource-types {
                grid-template-columns: 1fr;
            }

            .resources-cta {
                padding: 45px 20px;
            }

            .resources-cta h2 {
                font-size: 27px;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

<header class="resource-navbar">

    <div class="resource-nav-container">

        <a href="home.jsp" class="resource-logo">

            <div class="resource-logo-icon">
                <i class="fa fa-graduation-cap"></i>
            </div>

            <div class="resource-logo-text">
                Exam<span>Portal</span>
            </div>

        </a>


        <nav class="resource-nav-links" id="resourceNav">

            <a href="home.jsp">
                Home
            </a>

            <a href="aboutus.jsp">
                About Us
            </a>

            <a href="blog.jsp">
                Blogs
            </a>

            <a href="onlineTest.jsp">
                Online Test
            </a>

            <a href="resources.jsp" class="nav-active">
                Resources
            </a>

            <a href="successStories.jsp">
                Success Stories
            </a>

            <a href="contactus.jsp" class="resource-nav-btn">
                Contact
            </a>

        </nav>


        <button
            type="button"
            class="resource-menu-btn"
            id="resourceMenuBtn">

            <i class="fa fa-bars"></i>

        </button>

    </div>

</header>


<!-- =====================================================
     HERO
===================================================== -->

<section class="resources-hero">

    <div class="resources-hero-content">

        <div class="resource-badge">

            <i class="fa fa-book"></i>

            LEARNING & EXAM RESOURCES

        </div>


        <h1>

            Your Learning
            <span>Resources</span>

        </h1>


        <p>

            Explore useful study materials, practice tests,
            exam preparation resources, previous papers,
            notes and other learning content designed to
            help students prepare better for their exams.

        </p>

    </div>

</section>


<!-- =====================================================
     SEARCH
===================================================== -->

<div class="resource-search-wrapper">

    <div class="resource-search">

        <i class="fa fa-search"></i>

        <input
            type="text"
            id="resourceSearch"
            placeholder="Search resources, study material, tests, notes...">

    </div>

</div>


<!-- =====================================================
     RESOURCES
===================================================== -->

<section class="resources-section">

    <div class="resource-container">


        <div class="section-heading">

            <small>EXPLORE RESOURCES</small>

            <h2>
                Everything You Need
                <span>To Prepare</span>
            </h2>

            <p>

                Find different types of educational resources
                available through ExamPortal for practice,
                preparation and exam revision.

            </p>

        </div>


        <div class="resource-grid" id="resourceGrid">


            <!-- STUDY MATERIAL -->

            <div class="resource-card"
                 data-resource="study material notes">

                <div class="resource-icon">

                    <i class="fa fa-book-open"></i>

                </div>

                <h3>
                    Study Material
                </h3>

                <p>

                    Access useful study material, subject
                    notes and learning content to support
                    your exam preparation.

                </p>

                <a href="studentMaterial.jsp"
                   class="resource-link">

                    Explore Material

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


            <!-- ONLINE TEST -->

            <div class="resource-card"
                 data-resource="online test practice test">

                <div class="resource-icon">

                    <i class="fa fa-laptop"></i>

                </div>

                <h3>
                    Online Tests
                </h3>

                <p>

                    Practice with online tests and improve
                    your understanding through exam-style
                    questions.

                </p>

                <a href="onlineTest.jsp"
                   class="resource-link">

                    Start Practice

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


            <!-- PREVIOUS PAPERS -->

            <div class="resource-card"
                 data-resource="previous papers question papers">

                <div class="resource-icon">

                    <i class="fa fa-file-text"></i>

                </div>

                <h3>
                    Previous Papers
                </h3>

                <p>

                    Review previous examination papers and
                    understand question patterns for better
                    exam preparation.

                </p>

                <a href="questionReport.jsp"
                   class="resource-link">

                    View Papers

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


            <!-- PRACTICE QUESTIONS -->

            <div class="resource-card"
                 data-resource="practice questions quiz">

                <div class="resource-icon">

                    <i class="fa fa-question-circle"></i>

                </div>

                <h3>
                    Practice Questions
                </h3>

                <p>

                    Solve practice questions and strengthen
                    your knowledge before appearing for the
                    actual examination.

                </p>

                <a href="onlineTest.jsp"
                   class="resource-link">

                    Practice Now

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


            <!-- RESULTS -->

            <div class="resource-card"
                 data-resource="results performance report">

                <div class="resource-icon">

                    <i class="fa fa-bar-chart"></i>

                </div>

                <h3>
                    Results & Reports
                </h3>

                <p>

                    Check examination results and review
                    performance information to understand
                    your preparation progress.

                </p>

                <a href="studentResult.jsp"
                   class="resource-link">

                    Check Results

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


            <!-- STUDENT DASHBOARD -->

            <div class="resource-card"
                 data-resource="student dashboard account">

                <div class="resource-icon">

                    <i class="fa fa-user-circle"></i>

                </div>

                <h3>
                    Student Dashboard
                </h3>

                <p>

                    Access your student area, examination
                    activities, learning resources and
                    account-related information.

                </p>

                <a href="studentHome.jsp"
                   class="resource-link">

                    Open Dashboard

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>


        </div>


        <!-- =================================================
             RESOURCE TYPES
        ================================================== -->

        <div class="resource-types">


            <div class="resource-type">

                <i class="fa fa-book"></i>

                <h4>
                    Notes
                </h4>

                <p>
                    Subject-wise learning and revision material.
                </p>

            </div>


            <div class="resource-type">

                <i class="fa fa-pencil-square-o"></i>

                <h4>
                    Practice
                </h4>

                <p>
                    Questions and tests for regular practice.
                </p>

            </div>


            <div class="resource-type">

                <i class="fa fa-file-text-o"></i>

                <h4>
                    Exam Papers
                </h4>

                <p>
                    Useful examination papers and question patterns.
                </p>

            </div>


            <div class="resource-type">

                <i class="fa fa-line-chart"></i>

                <h4>
                    Performance
                </h4>

                <p>
                    Track your examination performance and results.
                </p>

            </div>


        </div>


        <!-- =================================================
             CTA
        ================================================== -->

        <div class="resources-cta">

            <h2>

                Ready to Start
                <span>Preparing?</span>

            </h2>

            <p>

                Use ExamPortal resources to practice,
                revise your subjects and prepare for your
                upcoming examinations.

            </p>

            <a href="onlineTest.jsp"
               class="cta-btn">

                <i class="fa fa-play"></i>

                Start Online Test

            </a>

        </div>


    </div>

</section>


<!-- =====================================================
     FOOTER
===================================================== -->

<jsp:include page="footer1.jsp" />


<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>

    /* MOBILE NAVIGATION */

    const resourceMenuBtn =
        document.getElementById("resourceMenuBtn");

    const resourceNav =
        document.getElementById("resourceNav");


    resourceMenuBtn.addEventListener("click", function () {

        resourceNav.classList.toggle("show");

        const icon =
            resourceMenuBtn.querySelector("i");

        if (resourceNav.classList.contains("show")) {

            icon.classList.remove("fa-bars");
            icon.classList.add("fa-times");

        } else {

            icon.classList.remove("fa-times");
            icon.classList.add("fa-bars");

        }

    });


    /* SEARCH RESOURCES */

    const searchInput =
        document.getElementById("resourceSearch");

    const resourceCards =
        document.querySelectorAll(".resource-card");


    searchInput.addEventListener("input", function () {

        const searchValue =
            this.value.toLowerCase().trim();


        resourceCards.forEach(function (card) {

            const resourceText =
                card.getAttribute("data-resource")
                    .toLowerCase();


            if (resourceText.includes(searchValue)) {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        });

    });


    /* CLOSE MOBILE MENU AFTER CLICK */

    document.querySelectorAll(".resource-nav-links a")
        .forEach(function (link) {

            link.addEventListener("click", function () {

                resourceNav.classList.remove("show");

                const icon =
                    resourceMenuBtn.querySelector("i");

                icon.classList.remove("fa-times");
                icon.classList.add("fa-bars");

            });

        });

</script>


</body>

</html>