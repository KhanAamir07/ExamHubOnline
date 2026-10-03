<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | About Us</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <!-- Global CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">


    <style>

        /* =========================================
           ABOUT PAGE
           ========================================= */

        .about-page {
    padding: 110px 0 80px;
    background: #f7f9fc;
}

        .about-container {
            width: 90%;
            max-width: 1150px;
            margin: 0 auto;
        }


        /* =========================================
           HERO SECTION
           ========================================= */

        .about-hero {
            text-align: center;
            margin-bottom: 55px;
        }

        .about-badge {
            display: inline-block;
            padding: 8px 18px;
            border-radius: 30px;
            background: #eef4ff;
            color: #3157d5;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 15px;
        }

        .about-hero h1 {
            margin: 0 0 15px;
            font-size: 42px;
            font-weight: 700;
            color: #202738;
        }

        .about-hero h1 span {
            color: #3157d5;
        }

        .about-hero p {
            max-width: 760px;
            margin: 0 auto;
            color: #697386;
            font-size: 16px;
            line-height: 1.8;
        }


        /* =========================================
           DEVELOPER CARD
           ========================================= */

        .developer-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px;
            margin-bottom: 50px;

            display: flex;
            align-items: center;
            gap: 40px;

            box-shadow: 0 10px 35px rgba(31, 45, 61, 0.08);
        }


        /* Profile Image */

        .developer-image-wrapper {
            width: 170px;
            height: 170px;
            min-width: 170px;

            border-radius: 50%;

            padding: 6px;

            background: linear-gradient(
                135deg,
                #3157d5,
                #6382ee
            );

            box-shadow:
                0 12px 30px rgba(49, 87, 213, 0.25);
        }

        .developer-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    object-position: center top;
    border-radius: 50%;
    display: block;
    background: #ffffff;
}


        /* Developer Information */

        .developer-content {
            flex: 1;
        }

        .developer-content h2 {
            margin: 0 0 8px;

            font-size: 29px;
            font-weight: 700;

            color: #202738;
        }

        .developer-role {
            display: inline-block;

            color: #3157d5;

            font-size: 15px;
            font-weight: 600;

            margin-bottom: 16px;
        }

        .developer-content p {
            margin: 0 0 20px;

            color: #697386;

            line-height: 1.8;

            font-size: 15px;

            max-width: 700px;
        }


        /* Email */

        .developer-email {
            display: inline-flex;

            align-items: center;

            gap: 9px;

            padding: 11px 17px;

            border-radius: 9px;

            background: #f4f6fb;

            color: #3157d5;

            text-decoration: none;

            font-size: 14px;

            font-weight: 500;

            transition: 0.3s ease;
        }

        .developer-email:hover {
            background: #e8edfb;
            color: #2448bd;
        }


        /* =========================================
           SECTION TITLE
           ========================================= */

        .section-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .section-title h2 {
            margin: 0 0 10px;

            font-size: 30px;

            color: #202738;

            font-weight: 700;
        }

        .section-title p {
            margin: 0;

            color: #7a8495;

            font-size: 15px;
        }


        /* =========================================
           ABOUT CONTENT
           ========================================= */

        .about-content {
            background: #ffffff;

            border-radius: 18px;

            padding: 40px;

            margin-bottom: 50px;

            box-shadow:
                0 8px 30px rgba(31, 45, 61, 0.06);
        }

        .about-content p {
            color: #626d7d;

            line-height: 1.85;

            font-size: 15px;

            margin: 0 0 18px;
        }

        .about-content p:last-child {
            margin-bottom: 0;
        }


        /* =========================================
           FEATURES
           ========================================= */

        .feature-grid {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 22px;

            margin-bottom: 50px;
        }

        .feature-card {
            background: #ffffff;

            padding: 30px 25px;

            border-radius: 16px;

            text-align: center;

            box-shadow:
                0 8px 28px rgba(31, 45, 61, 0.06);

            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);

            box-shadow:
                0 15px 35px rgba(31, 45, 61, 0.11);
        }

        .feature-icon {
            width: 58px;
            height: 58px;

            margin: 0 auto 18px;

            border-radius: 14px;

            background: #eef3ff;

            color: #3157d5;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 23px;

            font-weight: 700;
        }

        .feature-card h3 {
            margin: 0 0 10px;

            color: #202738;

            font-size: 18px;

            font-weight: 600;
        }

        .feature-card p {
            margin: 0;

            color: #727c8d;

            font-size: 14px;

            line-height: 1.7;
        }


        /* =========================================
           TECHNOLOGY SECTION
           ========================================= */

        .technology-box {
            background: #202738;

            border-radius: 18px;

            padding: 40px;

            margin-bottom: 50px;

            text-align: center;
        }

        .technology-box h2 {
            color: #ffffff;

            margin: 0 0 12px;

            font-size: 28px;

            font-weight: 700;
        }

        .technology-box p {
            color: #b9c1cf;

            margin: 0 auto 28px;

            max-width: 700px;

            line-height: 1.7;

            font-size: 14px;
        }

        .technology-list {
            display: flex;

            flex-wrap: wrap;

            justify-content: center;

            gap: 12px;
        }

        .technology-item {
            padding: 10px 17px;

            border: 1px solid #465064;

            border-radius: 25px;

            color: #ffffff;

            font-size: 13px;

            font-weight: 500;

            background: rgba(255,255,255,0.04);
        }


        /* =========================================
           MISSION
           ========================================= */

        .mission-card {
            background: #ffffff;

            border-radius: 18px;

            padding: 40px;

            margin-bottom: 50px;

            text-align: center;

            box-shadow:
                0 8px 30px rgba(31, 45, 61, 0.06);
        }

        .mission-card h2 {
            margin: 0 0 15px;

            color: #202738;

            font-size: 28px;

            font-weight: 700;
        }

        .mission-card p {
            max-width: 780px;

            margin: 0 auto;

            color: #697386;

            line-height: 1.85;

            font-size: 15px;
        }


        /* =========================================
           CONTACT SECTION
           ========================================= */

        .contact-card {
            background:
                linear-gradient(
                    135deg,
                    #3157d5,
                    #5876e8
                );

            border-radius: 18px;

            padding: 45px 30px;

            text-align: center;

            color: #ffffff;

            box-shadow:
                0 12px 35px rgba(49, 87, 213, 0.20);
        }

        .contact-card h2 {
            margin: 0 0 10px;

            font-size: 28px;

            font-weight: 700;
        }

        .contact-card p {
            margin: 0 0 22px;

            color: #e8edff;

            font-size: 15px;
        }

        .contact-button {
            display: inline-block;

            padding: 12px 25px;

            border-radius: 8px;

            background: #ffffff;

            color: #3157d5;

            text-decoration: none;

            font-weight: 600;

            font-size: 14px;

            transition: all 0.3s ease;
        }

        .contact-button:hover {
            transform: translateY(-2px);

            background: #f3f5ff;

            color: #2448bd;
        }


        /* =========================================
           RESPONSIVE DESIGN
           ========================================= */

        @media (max-width: 900px) {

            .feature-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .about-hero h1 {
                font-size: 36px;
            }

            .developer-card {
                gap: 25px;
            }

        }


        @media (max-width: 650px) {

            .about-page {
                padding: 45px 0 60px;
            }

            .developer-card {
                flex-direction: column;

                text-align: center;

                padding: 30px 22px;
            }

            .developer-image-wrapper {
                width: 145px;
                height: 145px;
                min-width: 145px;
            }

            .developer-content h2 {
                font-size: 24px;
            }

            .developer-content p {
                margin-left: auto;
                margin-right: auto;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .about-content,
            .technology-box,
            .mission-card {
                padding: 28px 22px;
            }

            .about-hero h1 {
                font-size: 30px;
            }

            .about-hero p {
                font-size: 14px;
            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         NAVIGATION
         ========================================= -->

    <jsp:include page="menu1.jsp" />


    <!-- =========================================
         ABOUT PAGE
         ========================================= -->

    <section class="about-page">

        <div class="about-container">


            <!-- =====================================
                 HERO
                 ===================================== -->

            <div class="about-hero">

                <div class="about-badge">
                    ABOUT EXAMPORTAL
                </div>

                <h1>
                    Welcome to <span>ExamPortal</span>
                </h1>

                <p>
                    ExamPortal is an online examination and learning
                    platform designed to make exam preparation,
                    practice tests, study resources and online
                    assessments simple and accessible.
                </p>

            </div>


            <!-- =====================================
                 DEVELOPER
                 ===================================== -->

            <div class="developer-card">


                <!-- Your Actual Image -->

                <div class="developer-image-wrapper">

                    <img
                        src="${pageContext.request.contextPath}/assets/images/image-gallery/Picture-1.jpeg"
                        alt="Mohammad Aamir Khan"
                        class="developer-image">

                </div>


                <!-- Developer Details -->

                <div class="developer-content">

                    <h2>
                        Mohammad Aamir Khan
                    </h2>

                    <div class="developer-role">
                        ExamPortal Developer
                    </div>

                    <p>
                        ExamPortal is developed with a focus on creating
                        a simple, organized and user-friendly platform
                        for students and administrators. The application
                        brings examinations, practice tests, study
                        materials, categories and results together in
                        one place.
                    </p>

                    <a
                        href="mailto:aamirkhan91613216@gmail.com"
                        class="developer-email">

                        ✉
                        aamirkhan91613216@gmail.com

                    </a>

                </div>

            </div>


            <!-- =====================================
                 ABOUT PROJECT
                 ===================================== -->

            <div class="section-title">

                <h2>
                    About ExamPortal
                </h2>

                <p>
                    A complete platform for online examination and learning
                </p>

            </div>


            <div class="about-content">

                <p>
                    ExamPortal is a web-based online examination system
                    developed to provide students with a convenient
                    platform for learning, practicing and taking online
                    examinations.
                </p>

                <p>
                    The platform allows students to explore different
                    categories, access study resources, participate in
                    practice tests, attempt examinations and view their
                    results. The system is designed to provide a
                    structured experience from preparation to assessment.
                </p>

                <p>
                    Administrators can manage important application data
                    such as students, categories, examinations, questions,
                    tests, study materials and other educational content.
                    This helps keep examination information organized.
                </p>

                <p>
                    ExamPortal follows a modular application structure
                    using Java-based backend components, JSP pages,
                    Servlets, JDBC and MySQL database integration.
                </p>

            </div>


            <!-- =====================================
                 FEATURES
                 ===================================== -->

            <div class="section-title">

                <h2>
                    What ExamPortal Offers
                </h2>

                <p>
                    Useful features for students and administrators
                </p>

            </div>


            <div class="feature-grid">


                <!-- Online Exams -->

                <div class="feature-card">

                    <div class="feature-icon">
                        ✓
                    </div>

                    <h3>
                        Online Exams
                    </h3>

                    <p>
                        Students can participate in online examinations
                        and complete assessments through the platform.
                    </p>

                </div>


                <!-- Practice Tests -->

                <div class="feature-card">

                    <div class="feature-icon">
                        ?
                    </div>

                    <h3>
                        Practice Tests
                    </h3>

                    <p>
                        Practice tests help students improve their
                        preparation and understand their performance.
                    </p>

                </div>


                <!-- Study Resources -->

                <div class="feature-card">

                    <div class="feature-icon">
                        +
                    </div>

                    <h3>
                        Study Resources
                    </h3>

                    <p>
                        Students can access useful study materials
                        and educational resources from the platform.
                    </p>

                </div>


                <!-- Categories -->

                <div class="feature-card">

                    <div class="feature-icon">
                        #
                    </div>

                    <h3>
                        Exam Categories
                    </h3>

                    <p>
                        Examinations and learning content can be
                        organized using different categories.
                    </p>

                </div>


                <!-- Results -->

                <div class="feature-card">

                    <div class="feature-icon">
                        ★
                    </div>

                    <h3>
                        Result Management
                    </h3>

                    <p>
                        Examination results can be maintained and
                        viewed after students complete assessments.
                    </p>

                </div>


                <!-- Admin -->

                <div class="feature-card">

                    <div class="feature-icon">
                        ⚙
                    </div>

                    <h3>
                        Admin Management
                    </h3>

                    <p>
                        Administrators can manage examination and
                        educational content through the system.
                    </p>

                </div>


            </div>


            <!-- =====================================
                 TECHNOLOGY
                 ===================================== -->

            <div class="technology-box">

                <h2>
                    Technology Behind ExamPortal
                </h2>

                <p>
                    The application uses established web technologies
                    to provide a structured and database-driven
                    examination platform.
                </p>


                <div class="technology-list">

                    <span class="technology-item">
                        HTML
                    </span>

                    <span class="technology-item">
                        CSS
                    </span>

                    <span class="technology-item">
                        JavaScript
                    </span>

                    <span class="technology-item">
                        JSP
                    </span>

                    <span class="technology-item">
                        Java
                    </span>

                    <span class="technology-item">
                        Servlet
                    </span>

                    <span class="technology-item">
                        JDBC
                    </span>

                    <span class="technology-item">
                        MySQL
                    </span>

                    <span class="technology-item">
                        Bootstrap
                    </span>

                    <span class="technology-item">
                        Apache Tomcat
                    </span>

                </div>

            </div>


            <!-- =====================================
                 GOAL
                 ===================================== -->

            <div class="mission-card">

                <h2>
                    Our Goal
                </h2>

                <p>
                    The goal of ExamPortal is to provide a clean and
                    accessible online platform where students can prepare
                    for examinations, practice questions, access learning
                    resources and evaluate their performance through
                    online assessments.
                </p>

            </div>


            <!-- =====================================
                 CONTACT
                 ===================================== -->

            <div class="contact-card">

                <h2>
                    Have a Question?
                </h2>

                <p>
                    For questions or information about ExamPortal,
                    you can contact the developer.
                </p>

               <a href="https://khanaamir07.github.io/Personal-Portfolio/" 
   class="contact-button" 
   target="_blank">
    Personal Portfolio
</a>

            </div>


        </div>

    </section>


    <!-- =========================================
         FOOTER
         ========================================= -->

    <jsp:include page="footer1.jsp" />


</body>

</html>