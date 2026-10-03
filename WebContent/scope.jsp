<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <meta name="description"
        content="ExamPortal - Scope, Importance, Advantages and Future Scope">

    <title>ExamPortal | Scope & Importance</title>


    <!-- =========================
         GOOGLE FONT
    ========================== -->
    
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


    <!-- =========================
         BOOTSTRAP
    ========================== -->

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">


    <!-- =========================
         FONT AWESOME
    ========================== -->

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">


    <!-- =========================
         EXISTING THEME
    ========================== -->

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">


    <!-- =========================
         GLOBAL CSS
    ========================== -->

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


        /* ==========================================
           MAIN PAGE
        ========================================== */

        .scope-page {

            padding: 120px 0 90px;

            background: #f6f8fb;
        }

        .scope-container {

            width: 92%;

            max-width: 1200px;

            margin: auto;
        }


        /* ==========================================
           PAGE HEADER
        ========================================== */

        .scope-header {

            text-align: center;

            max-width: 800px;

            margin: 0 auto 65px;
        }

        .scope-label {

            display: inline-block;

            margin-bottom: 13px;

            color: #ff6b5f;

            font-size: 12px;

            font-weight: 800;

            letter-spacing: 2px;

            text-transform: uppercase;
        }

        .scope-header h1 {

            margin: 0 0 18px;

            font-size: clamp(34px, 4vw, 52px);

            line-height: 1.15;

            font-weight: 800;

            color: #172033;
        }

        .scope-header h1 span {

            color: #ff6b5f;
        }

        .scope-header p {

            margin: 0;

            color: #707a8c;

            font-size: 15px;

            line-height: 1.9;
        }


        /* ==========================================
           CONTENT CARD
        ========================================== */

        .scope-card {

            background: #ffffff;

            border: 1px solid #e8ecf2;

            border-radius: 20px;

            padding: 50px;

            margin-bottom: 30px;

            box-shadow:
                0 12px 40px rgba(23, 32, 51, 0.06);

            transition: all 0.3s ease;
        }

        .scope-card:hover {

            box-shadow:
                0 20px 50px rgba(23, 32, 51, 0.09);
        }


        /* ==========================================
           SECTION TITLE
        ========================================== */

        .scope-title {

            display: flex;

            align-items: center;

            gap: 15px;

            margin-bottom: 25px;
        }

        .scope-title-icon {

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

        .scope-title h2 {

            margin: 0;

            font-size: 27px;

            line-height: 1.3;

            font-weight: 800;

            color: #172033;
        }


        /* ==========================================
           CONTENT TEXT
        ========================================== */

        .scope-text {

            margin: 0;

            color: #687286;

            font-size: 14px;

            line-height: 1.95;

            text-align: justify;
        }


        /* ==========================================
           THREE COMPONENTS
        ========================================== */

        .component-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

            margin-top: 30px;
        }

        .component-card {

            padding: 28px 25px;

            border-radius: 15px;

            background: #f7f9fc;

            border: 1px solid #edf0f5;

            transition: all 0.3s ease;
        }

        .component-card:hover {

            background: #ffffff;

            transform: translateY(-5px);

            box-shadow:
                0 15px 35px rgba(23, 32, 51, 0.08);
        }

        .component-number {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            width: 38px;

            height: 38px;

            margin-bottom: 18px;

            border-radius: 10px;

            background: #172033;

            color: #ffffff;

            font-size: 12px;

            font-weight: 800;
        }

        .component-card h4 {

            margin: 0 0 10px;

            font-size: 16px;

            font-weight: 800;

            color: #172033;
        }

        .component-card p {

            margin: 0;

            color: #737d8e;

            font-size: 12px;

            line-height: 1.75;
        }


        /* ==========================================
           ADVANTAGES
        ========================================== */

        .advantage-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 18px;

            margin-top: 30px;
        }

        .advantage-item {

            display: flex;

            align-items: flex-start;

            gap: 15px;

            padding: 22px;

            border-radius: 13px;

            background: #f7f9fc;

            border: 1px solid #edf0f5;

            transition: all 0.3s ease;
        }

        .advantage-item:hover {

            background: #ffffff;

            transform: translateY(-3px);

            box-shadow:
                0 12px 30px rgba(23, 32, 51, 0.07);
        }

        .advantage-icon {

            width: 42px;

            height: 42px;

            flex: 0 0 42px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 10px;

            background: #fff0ee;

            color: #ff6b5f;

            font-size: 15px;
        }

        .advantage-item p {

            margin: 0;

            color: #657084;

            font-size: 13px;

            line-height: 1.7;
        }


        /* ==========================================
           PROPOSED SYSTEM
        ========================================== */

        .proposed-grid {

            display: grid;

            grid-template-columns:
                0.8fr 1.2fr;

            gap: 45px;

            align-items: center;

            margin-top: 15px;
        }

        .proposed-visual {

            min-height: 300px;

            border-radius: 18px;

            background:
                linear-gradient(
                    145deg,
                    #172033,
                    #2c374c
                );

            display: flex;

            align-items: center;

            justify-content: center;

            position: relative;

            overflow: hidden;
        }

        .proposed-visual::before {

            content: "";

            position: absolute;

            width: 230px;

            height: 230px;

            border-radius: 50%;

            border: 1px solid rgba(255,255,255,0.12);
        }

        .proposed-visual::after {

            content: "";

            position: absolute;

            width: 160px;

            height: 160px;

            border-radius: 50%;

            border: 1px solid rgba(255,255,255,0.10);
        }

        .proposed-icon {

            position: relative;

            z-index: 2;

            width: 90px;

            height: 90px;

            border-radius: 22px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #ff6b5f;

            color: #ffffff;

            font-size: 35px;

            box-shadow:
                0 15px 35px rgba(0,0,0,0.25);
        }


        /* ==========================================
           KEY POINTS
        ========================================== */

        .key-points {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 12px;

            margin-top: 25px;
        }

        .key-point {

            display: flex;

            align-items: center;

            gap: 10px;

            color: #596477;

            font-size: 12px;

            font-weight: 600;
        }

        .key-point i {

            color: #ff6b5f;

            font-size: 13px;
        }


        /* ==========================================
           FUTURE SCOPE
        ========================================== */

        .future-list {

            margin: 30px 0 0;

            padding: 0;

            list-style: none;
        }

        .future-list li {

            position: relative;

            padding: 20px 20px 20px 58px;

            margin-bottom: 14px;

            border-radius: 13px;

            background: #f7f9fc;

            border: 1px solid #edf0f5;

            color: #667084;

            font-size: 13px;

            line-height: 1.8;
        }

        .future-list li::before {

            content: "\f00c";

            font-family: FontAwesome;

            position: absolute;

            left: 20px;

            top: 21px;

            width: 25px;

            height: 25px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            background: #fff0ee;

            color: #ff6b5f;

            font-size: 11px;
        }


        /* ==========================================
           FINAL CTA
        ========================================== */

        .scope-cta {

            margin-top: 50px;

            padding: 55px 30px;

            border-radius: 20px;

            text-align: center;

            background:
                linear-gradient(
                    135deg,
                    #172033,
                    #2b364c
                );

            color: #ffffff;
        }

        .scope-cta h2 {

            margin: 0 0 15px;

            font-size: 30px;

            font-weight: 800;
        }

        .scope-cta h2 span {

            color: #ff8178;
        }

        .scope-cta p {

            max-width: 700px;

            margin: auto;

            color: rgba(255,255,255,0.72);

            font-size: 13px;

            line-height: 1.9;
        }


        /* ==========================================
           RESPONSIVE
        ========================================== */

        @media (max-width: 900px) {

            .scope-page {
                padding: 100px 0 70px;
            }

            .scope-card {
                padding: 35px 25px;
            }

            .component-grid {
                grid-template-columns: 1fr;
            }

            .proposed-grid {
                grid-template-columns: 1fr;
            }

            .proposed-visual {
                min-height: 250px;
            }

        }


        @media (max-width: 650px) {

            .scope-page {
                padding: 85px 0 60px;
            }

            .scope-container {
                width: 94%;
            }

            .scope-header {
                margin-bottom: 45px;
            }

            .scope-header h1 {
                font-size: 34px;
            }

            .scope-header p {
                font-size: 13px;
            }

            .scope-card {
                padding: 28px 20px;

                border-radius: 16px;
            }

            .scope-title {
                align-items: flex-start;
            }

            .scope-title h2 {
                font-size: 22px;
            }

            .scope-text {
                font-size: 13px;

                text-align: left;
            }

            .advantage-grid {
                grid-template-columns: 1fr;
            }

            .key-points {
                grid-template-columns: 1fr;
            }

            .scope-cta {
                padding: 40px 20px;
            }

            .scope-cta h2 {
                font-size: 25px;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
====================================================== -->

<jsp:include page="menu1.jsp" />


<!-- =====================================================
     MAIN CONTENT
====================================================== -->

<section class="scope-page">

    <div class="scope-container">


        <!-- =================================================
             PAGE HEADER
        ================================================== -->

        <div class="scope-header">

            <span class="scope-label">
                EXAMPORTAL PLATFORM
            </span>

            <h1>
                Scope & <span>Importance</span>
            </h1>

            <p>
                Understand the importance of an online
                examination system and how ExamPortal
                supports a structured digital examination
                experience.
            </p>

        </div>



        <!-- =================================================
             SCOPE & IMPORTANCE
        ================================================== -->

        <div class="scope-card">

            <div class="scope-title">

                <div class="scope-title-icon">
                    <i class="fa fa-bullseye"></i>
                </div>

                <h2>
                    Scope & Importance
                </h2>

            </div>


            <p class="scope-text">

                ExamPortal seeks to efficiently evaluate exam
                participants through a fully automated system
                that not only saves time but also provides fast
                results.

                The ExamPortal helps automate the traditional
                manual procedure of conducting examinations.
                Usually, this can be done through web-based
                examination software or an intranet variant.

                It also significantly reduces the need for
                continuous monitoring while the examination
                is being taken. Important instructions can be
                displayed to the exam taker before the tests
                begin.

                To effectively deliver an examination,
                three major components have to be handled
                efficiently.

            </p>


            <!-- COMPONENTS -->

            <div class="component-grid">


                <div class="component-card">

                    <div class="component-number">
                        01
                    </div>

                    <h4>
                        Creation of Exams
                    </h4>

                    <p>
                        An examination has to be created.
                        Examiners can create exams online,
                        while the examination contents can
                        be kept securely until the examination
                        starts.
                    </p>

                </div>


                <div class="component-card">

                    <div class="component-number">
                        02
                    </div>

                    <h4>
                        Supervision
                    </h4>

                    <p>
                        Students have to be efficiently
                        identified and screened to ensure
                        that examination standards are
                        maintained.
                    </p>

                </div>


                <div class="component-card">

                    <div class="component-number">
                        03
                    </div>

                    <h4>
                        Marking & Results
                    </h4>

                    <p>
                        Marking is the final stage of an
                        examination as it determines the
                        success or failure of the candidate
                        and their next level of achievement.
                    </p>

                </div>

            </div>

        </div>



        <!-- =================================================
             ADVANTAGES
        ================================================== -->

        <div class="scope-card">

            <div class="scope-title">

                <div class="scope-title-icon">
                    <i class="fa fa-star"></i>
                </div>

                <h2>
                    Advantages of Online Examination
                </h2>

            </div>


            <div class="advantage-grid">


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-clock-o"></i>
                    </div>

                    <p>
                        ExamPortal is a computerized system
                        which gives instant results and also
                        saves time.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-refresh"></i>
                    </div>

                    <p>
                        It automates the previous manual
                        process of taking written exams.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-globe"></i>
                    </div>

                    <p>
                        It can be implemented through
                        web-based examination software.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-users"></i>
                    </div>

                    <p>
                        It can reduce the workload of teachers
                        by using automated test papers and
                        marking schemes.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-home"></i>
                    </div>

                    <p>
                        Students can study independently,
                        for example at home or another
                        convenient place.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-bolt"></i>
                    </div>

                    <p>
                        The time given for a particular
                        question supports quick learning
                        and quick thinking.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-database"></i>
                    </div>

                    <p>
                        Examination data can be managed
                        repeatedly so students can access
                        updated content.
                    </p>

                </div>


                <div class="advantage-item">

                    <div class="advantage-icon">
                        <i class="fa fa-check-circle"></i>
                    </div>

                    <p>
                        Automated examination processing
                        helps provide a more organized
                        examination experience.
                    </p>

                </div>

            </div>

        </div>



        <!-- =================================================
             PROPOSED SYSTEM
        ================================================== -->

        <div class="scope-card">

            <div class="scope-title">

                <div class="scope-title-icon">
                    <i class="fa fa-cogs"></i>
                </div>

                <h2>
                    Proposed System
                </h2>

            </div>


            <div class="proposed-grid">


                <div class="proposed-visual">

                    <div class="proposed-icon">

                        <i class="fa fa-laptop"></i>

                    </div>

                </div>


                <div>

                    <p class="scope-text">

                        This web-based application is used to
                        conduct online examinations.

                        Students can sit at individual terminals
                        and login to write the exam within the
                        provided duration.

                        Questions are provided to students and
                        the web application can perform
                        correction, display results instantly
                        and store examination information in
                        the database.

                        The web application provides the
                        administrator with a facility to add
                        new exams.

                        The application also provides the
                        instructor with facilities to add
                        questions to an exam test paper and
                        modify questions in a particular exam
                        test paper.

                        The application takes care of
                        authentication for administrators,
                        instructors and students.

                    </p>


                    <div class="key-points">

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            Online examination
                        </div>

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            Automated result
                        </div>

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            Database storage
                        </div>

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            Exam management
                        </div>

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            Question management
                        </div>

                        <div class="key-point">
                            <i class="fa fa-check-circle"></i>
                            User authentication
                        </div>

                    </div>

                </div>

            </div>


            <div style="margin-top:35px;">

                <p class="scope-text">

                    The advanced computerized system is developed
                    with the aim of overcoming the drawbacks of
                    the existing manual system.

                    The proposed system provides a more
                    personalized and user-friendly experience.
                    People from different areas can register
                    and use the platform.

                    The system provides safety and easier
                    access to examination functionality.
                    Complete mechanization reduces manual
                    intervention in the examination process.

                    There is no geographical limitation for
                    students, allowing examinations to be
                    accessed from different locations.

                    The system also supports automated marks
                    calculation and randomization of questions.

                </p>

            </div>

        </div>



        <!-- =================================================
             FUTURE SCOPE
        ================================================== -->

        <div class="scope-card">

            <div class="scope-title">

                <div class="scope-title-icon">
                    <i class="fa fa-line-chart"></i>
                </div>

                <h2>
                    Future Scope of ExamPortal
                </h2>

            </div>


            <p class="scope-text">

                ExamPortal can be used in private institutes
                as well as educational institutions.

                As a user-friendly web-based application,
                it can be used from different locations and
                at different times.

                Every software may have cases of bugs,
                errors, security-related problems or system
                faults.

                For example, computer crashes or power supply
                problems can invalidate the efforts of a number
                of students.

                There can also be situations where software
                produces incorrect results or displays invalid
                data.

                Such bugs need to be identified and solved
                to improve the quality and reliability of
                the software.

            </p>


            <ul class="future-list">

                <li>
                    Develop more secure examination software
                    using advanced technologies.
                </li>

                <li>
                    Improve the reliability and trustworthiness
                    of web-based online examinations.
                </li>

                <li>
                    Reduce the impact of computer glitches,
                    application bugs and system faults.
                </li>

                <li>
                    Improve examination content management
                    and result processing.
                </li>

                <li>
                    Expand the platform for educational and
                    private institutes.
                </li>

                <li>
                    Provide flexible online examination access
                    without geographical limitations.
                </li>

                <li>
                    Continue improving security against
                    potential web-based examination threats.
                </li>

            </ul>

        </div>



        <!-- =================================================
             FINAL CTA
        ================================================== -->

        <div class="scope-cta">

            <h2>
                Building A Better
                <span>Exam Experience</span>
            </h2>

            <p>
                ExamPortal focuses on making online examination
                more organized, accessible and efficient while
                providing opportunities for future improvements
                in security, reliability and functionality.
            </p>

        </div>


    </div>

</section>



<!-- =====================================================
     FOOTER
====================================================== -->

<jsp:include page="footer1.jsp" />


</body>

</html>