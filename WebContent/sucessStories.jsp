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

    <title>ExamPortal | Success Stories</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">


    <!-- Google Font -->
    <link rel="preconnect"
        href="https://fonts.googleapis.com">

    <link rel="preconnect"
        href="https://fonts.gstatic.com"
        crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet">


    <!-- Bootstrap -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">


    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">


    <!-- Existing Theme -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">


    <!-- Global CSS -->
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
        }


        /* ==========================================
           MAIN PAGE
        ========================================== */

        .success-page {
            padding: 120px 0 90px;
        }

        .success-container {
            width: 92%;
            max-width: 1200px;
            margin: auto;
        }


        /* ==========================================
           PAGE HEADER
        ========================================== */

        .success-header {
            text-align: center;
            max-width: 760px;
            margin: 0 auto 70px;
        }

        .success-label {
            display: inline-block;

            color: #ff6b5f;

            font-size: 12px;
            font-weight: 800;

            letter-spacing: 2px;

            text-transform: uppercase;

            margin-bottom: 12px;
        }

        .success-header h1 {
            margin: 0 0 18px;

            font-size: clamp(34px, 4vw, 50px);

            line-height: 1.2;

            font-weight: 800;

            color: #172033;
        }

        .success-header h1 span {
            color: #ff6b5f;
        }

        .success-header p {
            margin: 0;

            font-size: 15px;

            line-height: 1.9;

            color: #707a8c;
        }


        /* ==========================================
           STORY CARD
        ========================================== */

        .story-card {

            background: #ffffff;

            border-radius: 20px;

            margin-bottom: 35px;

            padding: 45px;

            border: 1px solid #e9edf3;

            box-shadow:
                0 12px 40px rgba(23, 32, 51, 0.06);

            transition:
                transform 0.35s ease,
                box-shadow 0.35s ease;

            overflow: hidden;
        }

        .story-card:hover {

            transform: translateY(-6px);

            box-shadow:
                0 20px 50px rgba(23, 32, 51, 0.11);
        }


        .story-row {

            display: flex;

            align-items: center;

            margin: 0 -15px;
        }


        .story-image-column,
        .story-content-column {

            padding: 0 15px;
        }


        .story-image-column {

            width: 40%;

            text-align: center;
        }


        .story-content-column {

            width: 60%;
        }


        /* ==========================================
           IMAGE
        ========================================== */

        .story-image-wrapper {

            position: relative;

            width: 270px;
            height: 270px;

            margin: auto;

            display: flex;

            align-items: center;
            justify-content: center;
        }

        .story-image-wrapper::before {

            content: "";

            position: absolute;

            inset: 5px;

            border-radius: 50%;

            border: 2px solid #ff6b5f;

            opacity: 0.25;
        }

        .story-image {

            width: 235px;
            height: 235px;

            object-fit: cover;

            border-radius: 50%;

            display: block;

            border: 8px solid #ffffff;

            box-shadow:
                0 15px 40px rgba(23, 32, 51, 0.16);
        }


        /* ==========================================
           STORY CONTENT
        ========================================== */

        .story-content {

            padding: 10px 5px;
        }

        .story-number {

            display: inline-flex;

            align-items: center;
            justify-content: center;

            width: 42px;
            height: 42px;

            border-radius: 12px;

            background: #fff0ee;

            color: #ff6b5f;

            font-size: 14px;

            font-weight: 800;

            margin-bottom: 18px;
        }

        .story-content h2 {

            margin: 0 0 18px;

            font-size: 26px;

            line-height: 1.3;

            font-weight: 800;

            color: #172033;
        }

        .story-content h2 span {
            color: #ff6b5f;
        }

        .story-content p {

            margin: 0;

            color: #687286;

            font-size: 14px;

            line-height: 1.95;

            text-align: justify;
        }

        .story-content p b {

            color: #172033;

            font-weight: 700;
        }


        /* ==========================================
           READ MORE
        ========================================== */

        .read-more {

            display: inline-flex;

            align-items: center;

            gap: 9px;

            margin-top: 20px;

            padding: 11px 18px;

            border-radius: 7px;

            background: #172033;

            color: #ffffff;

            font-size: 12px;

            font-weight: 700;

            transition: all 0.3s ease;
        }

        .read-more:hover {

            background: #ff6b5f;

            color: #ffffff;

            transform: translateX(3px);
        }


        /* ==========================================
           REVERSE CARD
        ========================================== */

        .story-card.reverse .story-image-column {
            order: 2;
        }

        .story-card.reverse .story-content-column {
            order: 1;
        }


        /* ==========================================
           QUOTE
        ========================================== */

        .story-quote {

            margin-top: 20px;

            padding-left: 18px;

            border-left: 3px solid #ff6b5f;

            color: #8a93a3;

            font-size: 12px;

            font-style: italic;

            line-height: 1.7;
        }


        /* ==========================================
           BOTTOM MESSAGE
        ========================================== */

        .success-bottom {

            margin-top: 65px;

            padding: 55px 30px;

            text-align: center;

            border-radius: 20px;

            background:
                linear-gradient(
                    135deg,
                    #172033,
                    #2b364c
                );

            color: #ffffff;
        }

        .success-bottom h2 {

            margin: 0 0 15px;

            font-size: 32px;

            font-weight: 800;
        }

        .success-bottom h2 span {
            color: #ff8178;
        }

        .success-bottom p {

            max-width: 680px;

            margin: 0 auto;

            font-size: 14px;

            line-height: 1.9;

            color: rgba(255,255,255,0.72);
        }


        /* ==========================================
           RESPONSIVE
        ========================================== */

        @media (max-width: 900px) {

            .success-page {
                padding: 100px 0 70px;
            }

            .story-card {
                padding: 35px 25px;
            }

            .story-row {
                flex-direction: column;
            }

            .story-image-column,
            .story-content-column {
                width: 100%;
            }

            .story-image-column {
                margin-bottom: 30px;
            }

            .story-content {
                padding: 0;
            }

            .story-card.reverse .story-image-column,
            .story-card.reverse .story-content-column {
                order: initial;
            }

        }


        @media (max-width: 600px) {

            .success-page {
                padding: 85px 0 60px;
            }

            .success-container {
                width: 94%;
            }

            .success-header {
                margin-bottom: 45px;
            }

            .success-header h1 {
                font-size: 34px;
            }

            .success-header p {
                font-size: 13px;
            }

            .story-card {
                padding: 30px 20px;

                border-radius: 16px;
            }

            .story-image-wrapper {

                width: 220px;
                height: 220px;
            }

            .story-image {

                width: 185px;
                height: 185px;
            }

            .story-content h2 {
                font-size: 22px;
            }

            .story-content p {
                font-size: 13px;
                line-height: 1.8;
            }

            .success-bottom {
                padding: 40px 20px;
            }

            .success-bottom h2 {
                font-size: 26px;
            }

        }

    </style>

</head>


<body>


<!-- ==========================================
     NAVBAR
========================================== -->

<jsp:include page="menu1.jsp" />


<!-- ==========================================
     SUCCESS STORIES PAGE
========================================== -->

<section class="success-page">

    <div class="success-container">


        <!-- ======================================
             HEADER
        ======================================= -->

        <div class="success-header">

            <span class="success-label">
                INSPIRATION & SUCCESS
            </span>

            <h1>
                Success <span>Stories</span>
            </h1>

            <p>
                Learn from the journeys of people who faced
                challenges, learned from their experiences and
                continued working towards their goals.
            </p>

        </div>



        <!-- ======================================
             JAMES GOSLING
        ======================================= -->

        <div class="story-card">

            <div class="story-row">


                <div class="story-image-column">

                    <div class="story-image-wrapper">

                        <img
                            src="${pageContext.request.contextPath}/assets1/images/james1.jpg"
                            class="story-image"
                            alt="James Gosling">

                    </div>

                </div>


                <div class="story-content-column">

                    <div class="story-content">

                        <div class="story-number">
                            01
                        </div>

                        <h2>
                            James A. <span>Gosling</span>
                        </h2>

                        <p>

                            <b>James A. Gosling, O.C., Ph.D.</b>
                            is a famous software developer, best
                            known as the father of the Java programming
                            language.

                            The story of James Gosling and Java is a
                            classic tale of disruptive discovery in the
                            new economy. It began in the early 1990s
                            while Gosling was a lead engineer for Sun
                            Microsystems.

                            Gosling began working on a secret task force
                            called "The Green Project" to investigate and
                            address future issues for Sun as new
                            technologies like the Internet were coming
                            of age.

                            As the project developed, it became...

                        </p>


                        <a
                            href="${pageContext.request.contextPath}/ryan.jsp"
                            class="read-more">

                            Read More

                            <i class="fa fa-arrow-right"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>



        <!-- ======================================
             STEVE JOBS
        ======================================= -->

        <div class="story-card reverse">

            <div class="story-row">


                <div class="story-image-column">

                    <div class="story-image-wrapper">

                        <img
                            src="${pageContext.request.contextPath}/assets1/images/steve-jobs.jpg"
                            class="story-image"
                            alt="Steve Jobs">

                    </div>

                </div>


                <div class="story-content-column">

                    <div class="story-content">

                        <div class="story-number">
                            02
                        </div>

                        <h2>
                            Steve <span>Jobs</span>
                        </h2>

                        <p>

                            <b>Steve Jobs</b> has been known as an iconic
                            figure for the establishment of Apple like
                            the biggest company.

                            However, it is extremely shocking to know
                            that the $2 billion company with over 4000
                            employees was started with only two persons
                            in a garage.

                            It is also to be noticed that this great
                            establisher was dismissed and fired from the
                            company from which he started his career.

                            Further, realizing his potential and
                            capabilities, Steve Jobs proceeded further
                            towards establishing the company famously
                            known as Apple.

                        </p>


                        <div class="story-quote">

                            Challenges can become an important part
                            of the journey towards success.

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- ======================================
             BILL GATES
        ======================================= -->

        <div class="story-card">

            <div class="story-row">


                <div class="story-image-column">

                    <div class="story-image-wrapper">

                        <img
                            src="${pageContext.request.contextPath}/assets1/images/bill.jpg"
                            class="story-image"
                            alt="Bill Gates">

                    </div>

                </div>


                <div class="story-content-column">

                    <div class="story-content">

                        <div class="story-number">
                            03
                        </div>

                        <h2>
                            Bill <span>Gates</span>
                        </h2>

                        <p>

                            <b>Bill Gates</b> believed it was important
                            to learn from failure instead of only
                            celebrating success.

                            This great entrepreneur who established
                            Microsoft as one of the biggest software
                            companies was a dropout student from
                            Harvard.

                            Furthermore, he was also known for his
                            self-owned business figure known as
                            Traf-O-Data, which was one of the biggest
                            failures in his history.

                            The entire investment of Bill Gates got
                            vanished and unfortunately, even the
                            education could not be completed.

                            But the keen desire and passion for computer
                            programming led him to establish the
                            software company Microsoft.

                        </p>


                        <div class="story-quote">

                            Learn from failure and continue moving
                            forward with determination.

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- ======================================
             RATAN TATA
        ======================================= -->

        <div class="story-card reverse">

            <div class="story-row">


                <div class="story-image-column">

                    <div class="story-image-wrapper">

                        <img
                            src="${pageContext.request.contextPath}/assets1/images/ratan.jpg"
                            class="story-image"
                            alt="Ratan Tata">

                    </div>

                </div>


                <div class="story-content-column">

                    <div class="story-content">

                        <div class="story-number">
                            04
                        </div>

                        <h2>
                            Ratan <span>Tata</span>
                        </h2>

                        <p>

                            <b>Ratan Tata</b> faced a major challenge
                            when he became chairman in 1991.

                            His modern perspectives and liberal
                            attitude did not always work well with
                            some senior people at Tata, which resulted
                            in difficulties at the management level.

                            At the beginning of his career as chairman,
                            two organizations under him faced
                            bankruptcy and confidence in his leadership
                            declined as he introduced significant
                            organizational changes.

                            Despite these challenges, his journey
                            continued and became an important example
                            of leadership and perseverance.

                        </p>


                        <div class="story-quote">

                            Leadership requires patience, vision
                            and the courage to make difficult decisions.

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- ======================================
             BOTTOM SECTION
        ======================================= -->

        <div class="success-bottom">

            <h2>
                Every Journey Has A <span>Story.</span>
            </h2>

            <p>
                Success is not always a straight path.
                Learn, practice, face challenges and keep
                moving forward towards your goals.
            </p>

        </div>


    </div>

</section>



<!-- ==========================================
     FOOTER
========================================== -->

<jsp:include page="footer1.jsp" />


</body>

</html>