<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    autoFlush="true"
    buffer="8kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">
          
    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <meta name="description"
        content="ExamPortal - Online Examination and Learning Platform">

    <meta name="keywords"
        content="ExamPortal, Online Exam, Practice Test, Exams, Students, Learning">

    <title>ExamPortal | Online Examination Platform</title>


    <!-- =========================
         GOOGLE FONT
    ========================== -->
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
         EXISTING PROJECT CSS
    ========================== -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/owl-carousel.css">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets1/css/lightbox.css">


    <!-- =========================
         GLOBAL CSS
    ========================== -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">


    <!-- =========================
         PAGE CSS
    ========================== -->
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
            background: #f7f9fc;
            color: #172033;
            overflow-x: hidden;
        }

        a {
            text-decoration: none !important;
        }


        /* =====================================================
           HERO SLIDER
        ====================================================== */

        .ep-hero {
            position: relative;
            width: 100%;
            min-height: 720px;
            overflow: hidden;
            background: #111827;
        }

        .ep-slider {
            position: relative;
            width: 100%;
            height: 720px;
        }

        .ep-slide {
            position: absolute;
            inset: 0;

            opacity: 0;
            visibility: hidden;

            transform: scale(1.04);

            transition:
                opacity 0.8s ease,
                transform 1.2s ease,
                visibility 0.8s ease;
        }

        .ep-slide.active {
            opacity: 1;
            visibility: visible;
            transform: scale(1);
            z-index: 2;
        }

        .ep-slide-image {
            position: absolute;
            inset: 0;

            width: 100%;
            height: 100%;

            object-fit: cover;
            object-position: center;
        }

        .ep-slide-overlay {
            position: absolute;
            inset: 0;

            background:
                linear-gradient(
                    90deg,
                    rgba(8, 15, 35, 0.90) 0%,
                    rgba(8, 15, 35, 0.72) 42%,
                    rgba(8, 15, 35, 0.35) 72%,
                    rgba(8, 15, 35, 0.20) 100%
                );

            z-index: 1;
        }

        .ep-slide-content {
            position: relative;
            z-index: 3;

            max-width: 1250px;
            margin: auto;

            height: 100%;

            display: flex;
            align-items: center;

            padding: 100px 35px 80px;
        }

        .ep-hero-text {
            max-width: 760px;
            color: white;
        }

        .ep-small-label {
            display: inline-flex;
            align-items: center;
            gap: 10px;

            padding: 10px 18px;

            border: 1px solid rgba(255,255,255,0.30);
            border-radius: 50px;

            background: rgba(255,255,255,0.10);
            backdrop-filter: blur(10px);

            font-size: 13px;
            font-weight: 600;
            letter-spacing: 1px;

            margin-bottom: 24px;
        }

        .ep-small-label i {
            font-size: 10px;
        }

        .ep-hero-title {
            margin: 0 0 22px;

            font-size: clamp(42px, 5vw, 76px);
            line-height: 1.08;

            font-weight: 800;
            letter-spacing: -2px;
        }

        .ep-hero-title span {
            color: #ff6b5f;
        }

        .ep-hero-description {
            max-width: 650px;

            margin-bottom: 35px;

            font-size: 17px;
            line-height: 1.9;

            color: rgba(255,255,255,0.88);
            font-weight: 400;
        }

        .ep-hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .ep-btn-primary,
        .ep-btn-outline {

            min-width: 175px;

            padding: 15px 25px;

            border-radius: 8px;

            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;

            font-size: 14px;
            font-weight: 700;

            transition: all 0.3s ease;
        }

        .ep-btn-primary {
            background: #ff6b5f;
            color: white;
            border: 2px solid #ff6b5f;
        }

        .ep-btn-primary:hover {
            background: #ffffff;
            border-color: #ffffff;
            color: #172033;
            transform: translateY(-3px);
        }

        .ep-btn-outline {
            color: white;
            border: 2px solid rgba(255,255,255,0.65);
            background: rgba(255,255,255,0.08);
        }

        .ep-btn-outline:hover {
            background: white;
            color: #172033;
            border-color: white;
            transform: translateY(-3px);
        }


        /* =====================================================
           SLIDER ARROWS
        ====================================================== */

        .ep-arrow {

            position: absolute;

            top: 50%;

            transform: translateY(-50%);

            width: 58px;
            height: 58px;

            border-radius: 50%;

            border: 1px solid rgba(255,255,255,0.45);

            background: rgba(0,0,0,0.30);

            backdrop-filter: blur(10px);

            color: white;

            display: flex;
            align-items: center;
            justify-content: center;

            cursor: pointer;

            z-index: 10;

            transition: all 0.3s ease;

            font-size: 20px;

            padding: 0;
        }

        .ep-arrow i {
            line-height: 1;
        }

        .ep-arrow:hover {
            background: #ff6b5f;
            border-color: #ff6b5f;

            transform:
                translateY(-50%)
                scale(1.08);
        }

        .ep-arrow-left {
            left: 25px;
        }

        .ep-arrow-right {
            right: 25px;
        }


        /* =====================================================
           SLIDER DOTS
        ====================================================== */

        .ep-slider-dots {

            position: absolute;

            bottom: 35px;

            left: 50%;

            transform: translateX(-50%);

            z-index: 10;

            display: flex;

            align-items: center;

            gap: 9px;
        }

        .ep-dot {

            width: 10px;
            height: 10px;

            border-radius: 50%;

            border: none;

            background: rgba(255,255,255,0.45);

            padding: 0;

            cursor: pointer;

            transition: all 0.3s ease;
        }

        .ep-dot.active {

            width: 30px;

            border-radius: 20px;

            background: #ff6b5f;
        }


        /* =====================================================
           HERO BOTTOM CARD
        ====================================================== */

        .ep-floating-bar {

            position: absolute;

            left: 50%;

            bottom: -1px;

            transform: translateX(-50%);

            width: min(1100px, 90%);

            z-index: 5;

            background: rgba(255,255,255,0.97);

            border-radius: 16px 16px 0 0;

            box-shadow: 0 -10px 40px rgba(0,0,0,0.10);

            padding: 25px 30px;

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);
        }

        .ep-floating-item {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 14px;

            padding: 5px 20px;

            border-right: 1px solid #e7ebf2;
        }

        .ep-floating-item:last-child {
            border-right: none;
        }

        .ep-floating-icon {

            width: 46px;
            height: 46px;

            border-radius: 12px;

            background: #fff0ee;

            color: #ff6b5f;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 18px;
        }

        .ep-floating-item h5 {

            margin: 0 0 4px;

            font-size: 14px;

            font-weight: 700;
        }

        .ep-floating-item p {

            margin: 0;

            font-size: 12px;

            color: #7b8495;
        }


        /* =====================================================
           COMMON SECTION
        ====================================================== */

        .ep-section {

            padding: 110px 0;

            position: relative;
        }

        .ep-container {

            width: 92%;
            max-width: 1250px;

            margin: auto;
        }

        .ep-section-heading {

            text-align: center;

            max-width: 760px;

            margin: 0 auto 60px;
        }

        .ep-section-label {

            display: inline-block;

            color: #ff6b5f;

            font-size: 12px;

            font-weight: 800;

            letter-spacing: 2px;

            text-transform: uppercase;

            margin-bottom: 12px;
        }

        .ep-section-title {

            margin: 0 0 18px;

            font-size: clamp(30px, 4vw, 48px);

            line-height: 1.15;

            font-weight: 800;

            color: #172033;
        }

        .ep-section-description {

            margin: 0;

            color: #6c7688;

            font-size: 15px;

            line-height: 1.9;
        }


        /* =====================================================
           ABOUT SECTION
        ====================================================== */

        .ep-about {

            background: #ffffff;
        }

        .ep-about-grid {

            display: grid;

            grid-template-columns: 1.1fr 0.9fr;

            gap: 70px;

            align-items: center;
        }

        .ep-about-image {

            position: relative;

            border-radius: 20px;

            overflow: hidden;

            box-shadow: 0 25px 60px rgba(23,32,51,0.15);
        }

        .ep-about-image img {

            width: 100%;

            height: 460px;

            object-fit: cover;

            display: block;
        }

        .ep-about-badge {

            position: absolute;

            right: 20px;
            bottom: 20px;

            padding: 18px 22px;

            background: rgba(255,255,255,0.95);

            border-radius: 12px;

            box-shadow: 0 10px 35px rgba(0,0,0,0.12);
        }

        .ep-about-badge strong {

            display: block;

            font-size: 17px;

            font-weight: 800;

            color: #172033;
        }

        .ep-about-badge span {

            font-size: 12px;

            color: #7a8394;
        }

        .ep-about-content h3 {

            font-size: 32px;

            line-height: 1.3;

            font-weight: 800;

            margin: 0 0 20px;
        }

        .ep-about-content p {

            color: #697386;

            font-size: 15px;

            line-height: 1.9;

            margin-bottom: 20px;
        }

        .ep-check-list {

            padding: 0;

            margin: 25px 0;

            list-style: none;
        }

        .ep-check-list li {

            display: flex;

            align-items: flex-start;

            gap: 12px;

            margin-bottom: 14px;

            color: #4d586c;

            font-size: 14px;

            line-height: 1.6;
        }

        .ep-check-list i {

            color: #ff6b5f;

            margin-top: 3px;
        }


        /* =====================================================
           FEATURES
        ====================================================== */

        .ep-features {

            background: #f6f8fb;
        }

        .ep-feature-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 25px;
        }

        .ep-feature-card {

            position: relative;

            padding: 35px 30px;

            background: white;

            border: 1px solid #e9edf3;

            border-radius: 16px;

            transition:
                transform 0.35s ease,
                box-shadow 0.35s ease,
                border-color 0.35s ease;

            overflow: hidden;
        }

        .ep-feature-card:before {

            content: "";

            position: absolute;

            left: 0;
            top: 0;

            width: 100%;
            height: 3px;

            background: #ff6b5f;

            transform: scaleX(0);

            transform-origin: left;

            transition: transform 0.35s ease;
        }

        .ep-feature-card:hover {

            transform: translateY(-8px);

            border-color: transparent;

            box-shadow: 0 20px 45px rgba(23,32,51,0.10);
        }

        .ep-feature-card:hover:before {
            transform: scaleX(1);
        }

        .ep-feature-icon {

            width: 58px;
            height: 58px;

            border-radius: 14px;

            background: #fff0ee;

            color: #ff6b5f;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 21px;

            margin-bottom: 22px;
        }

        .ep-feature-card h4 {

            margin: 0 0 12px;

            font-size: 18px;

            font-weight: 800;

            color: #172033;
        }

        .ep-feature-card p {

            margin: 0;

            font-size: 13px;

            line-height: 1.8;

            color: #727c8d;
        }


        /* =====================================================
           PROCESS
        ====================================================== */

        .ep-process {

            background: #ffffff;
        }

        .ep-process-grid {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 25px;
        }

        .ep-process-card {

            text-align: center;

            padding: 35px 20px;

            position: relative;
        }

        .ep-process-number {

            width: 70px;
            height: 70px;

            margin: 0 auto 22px;

            border-radius: 50%;

            display: flex;

            align-items: center;
            justify-content: center;

            background: #172033;

            color: white;

            font-size: 20px;

            font-weight: 800;

            box-shadow:
                0 12px 30px rgba(23,32,51,0.18);
        }

        .ep-process-card h4 {

            margin: 0 0 12px;

            font-size: 17px;

            font-weight: 800;
        }

        .ep-process-card p {

            margin: 0;

            font-size: 13px;

            line-height: 1.8;

            color: #727c8d;
        }


        /* =====================================================
           CATEGORIES
        ====================================================== */

        .ep-categories {

            background: #f6f8fb;
        }

        .ep-category-grid {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;
        }

        .ep-category {

            position: relative;

            min-height: 190px;

            padding: 30px;

            border-radius: 16px;

            background: linear-gradient(
                145deg,
                #172033,
                #29344a
            );

            color: white;

            overflow: hidden;

            transition:
                transform 0.3s ease,
                box-shadow 0.3s ease;
        }

        .ep-category:hover {

            transform: translateY(-7px);

            box-shadow:
                0 20px 40px rgba(23,32,51,0.20);
        }

        .ep-category i {

            font-size: 30px;

            color: #ff8a80;

            margin-bottom: 25px;
        }

        .ep-category h4 {

            margin: 0 0 8px;

            font-size: 17px;

            font-weight: 800;
        }

        .ep-category p {

            margin: 0;

            font-size: 12px;

            line-height: 1.7;

            color: rgba(255,255,255,0.70);
        }

        .ep-category-number {

            position: absolute;

            right: 20px;
            bottom: 10px;

            font-size: 65px;

            line-height: 1;

            font-weight: 800;

            color: rgba(255,255,255,0.05);
        }


        /* =====================================================
           WHY EXAMPORTAL
        ====================================================== */

        .ep-why {

            background: #ffffff;
        }

        .ep-why-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 25px;
        }

        .ep-why-card {

            display: flex;

            gap: 20px;

            padding: 30px;

            border-radius: 16px;

            background: #f7f9fc;

            border: 1px solid #edf0f5;

            transition: all 0.3s ease;
        }

        .ep-why-card:hover {

            background: white;

            box-shadow:
                0 18px 40px rgba(23,32,51,0.08);

            transform: translateY(-5px);
        }

        .ep-why-icon {

            flex: 0 0 55px;

            width: 55px;
            height: 55px;

            border-radius: 13px;

            display: flex;

            align-items: center;
            justify-content: center;

            background: #fff0ee;

            color: #ff6b5f;

            font-size: 20px;
        }

        .ep-why-card h4 {

            margin: 0 0 8px;

            font-size: 16px;

            font-weight: 800;
        }

        .ep-why-card p {

            margin: 0;

            color: #727c8d;

            font-size: 13px;

            line-height: 1.7;
        }


        /* =====================================================
           CTA
        ====================================================== */

        .ep-cta {

            padding: 100px 0;

            background:
                linear-gradient(
                    135deg,
                    #172033,
                    #2a354b
                );

            color: white;
        }

        .ep-cta-box {

            max-width: 900px;

            margin: auto;

            text-align: center;
        }

        .ep-cta-box h2 {

            margin: 0 0 20px;

            font-size: clamp(32px, 4vw, 50px);

            line-height: 1.2;

            font-weight: 800;
        }

        .ep-cta-box p {

            max-width: 680px;

            margin: 0 auto 32px;

            color: rgba(255,255,255,0.72);

            font-size: 15px;

            line-height: 1.9;
        }


        /* =====================================================
           SCROLL ANIMATION
        ====================================================== */

        .ep-reveal {

            opacity: 0;

            transform: translateY(35px);

            transition:
                opacity 0.8s ease,
                transform 0.8s ease;
        }

        .ep-reveal.show {

            opacity: 1;

            transform: translateY(0);
        }


        /* =====================================================
           RESPONSIVE
        ====================================================== */

        @media (max-width: 1100px) {

            .ep-about-grid {
                grid-template-columns: 1fr;
            }

            .ep-about-image img {
                height: 420px;
            }

            .ep-feature-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .ep-category-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .ep-process-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

        }


        @media (max-width: 768px) {

            .ep-hero {
                min-height: 650px;
            }

            .ep-slider {
                height: 650px;
            }

            .ep-slide-content {
                padding: 100px 25px 100px;
            }

            .ep-hero-title {
                font-size: 43px;
                letter-spacing: -1px;
            }

            .ep-hero-description {
                font-size: 14px;
                line-height: 1.8;
            }

            .ep-arrow {

                width: 44px;
                height: 44px;

                font-size: 16px;
            }

            .ep-arrow-left {
                left: 12px;
            }

            .ep-arrow-right {
                right: 12px;
            }

            .ep-floating-bar {

                width: 92%;

                grid-template-columns: 1fr;

                padding: 15px;

                bottom: 0;
            }

            .ep-floating-item {

                border-right: none;

                border-bottom: 1px solid #e7ebf2;

                padding: 12px;
            }

            .ep-floating-item:last-child {
                border-bottom: none;
            }

            .ep-section {
                padding: 75px 0;
            }

            .ep-feature-grid,
            .ep-category-grid,
            .ep-process-grid,
            .ep-why-grid {

                grid-template-columns: 1fr;
            }

            .ep-about-image img {
                height: 330px;
            }

            .ep-about-content h3 {
                font-size: 27px;
            }

        }


        @media (max-width: 480px) {

            .ep-hero {
                min-height: 670px;
            }

            .ep-slider {
                height: 670px;
            }

            .ep-slide-content {
                padding: 90px 20px 120px;
            }

            .ep-small-label {
                font-size: 10px;
            }

            .ep-hero-title {
                font-size: 35px;
            }

            .ep-hero-description {
                font-size: 13px;
            }

            .ep-hero-buttons {

                flex-direction: column;

                align-items: stretch;
            }

            .ep-btn-primary,
            .ep-btn-outline {
                width: 100%;
            }

            .ep-arrow {

                width: 38px;
                height: 38px;

                font-size: 14px;
            }

            .ep-slider-dots {
                bottom: 105px;
            }

            .ep-floating-bar {
                display: none;
            }

        }

    </style>

</head>


<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

<jsp:include page="menu1.jsp" />


<!-- =========================================================
     LOGIN SUCCESS MESSAGE
========================================================= -->

<%
    String studentLoginSucessMessage =
        (String) request.getAttribute("studentLoginSucessMessage");

    String studentLogin =
        (String) session.getAttribute("studentLogin");
%>


<%
    if (studentLoginSucessMessage != null) {
%>

    <div
        style="
            position:fixed;
            top:90px;
            left:50%;
            transform:translateX(-50%);
            z-index:9999;
            width:min(600px,90%);
        ">

        <div
            class="alert alert-success alert-dismissible fade show"
            role="alert">

            <strong>
                <i class="fa fa-check-circle"></i>
                Welcome!
            </strong>

            <%= studentLoginSucessMessage %>

            <button
                type="button"
                class="close"
                data-dismiss="alert">

                <span>&times;</span>

            </button>

        </div>

    </div>

<%
    }
%>


<!-- =========================================================
     HERO SLIDER
========================================================= -->

<section class="ep-hero">

    <div class="ep-slider" id="epSlider">


        <!-- ================= SLIDE 1 ================= -->

        <div class="ep-slide active">

            <img
                src="${pageContext.request.contextPath}/assets1/images/slide-01.jpg"
                class="ep-slide-image"
                alt="Online Examination">

            <div class="ep-slide-overlay"></div>

            <div class="ep-slide-content">

                <div class="ep-hero-text">

                    <div class="ep-small-label">

                        <i class="fa fa-circle"></i>

                        ONLINE EXAMINATION PLATFORM

                    </div>

                    <h1 class="ep-hero-title">

                        Learn.
                        <span>Practice.</span>
                        Perform.

                    </h1>

                    <p class="ep-hero-description">

                        ExamPortal provides a structured online environment
                        where students can explore examinations, practice
                        questions, prepare effectively and track their results.

                    </p>

                    <div class="ep-hero-buttons">

                        <a
                            href="${pageContext.request.contextPath}/studentHome.jsp"
                            class="ep-btn-primary">

                            Explore Exams

                            <i class="fa fa-arrow-right"></i>

                        </a>

                        <a
                            href="#ep-features"
                            class="ep-btn-outline">

                            Discover Platform

                            <i class="fa fa-angle-down"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= SLIDE 2 ================= -->

        <div class="ep-slide">

            <img
                src="${pageContext.request.contextPath}/assets1/images/slide-02.jpg"
                class="ep-slide-image"
                alt="Online Learning">

            <div class="ep-slide-overlay"></div>

            <div class="ep-slide-content">

                <div class="ep-hero-text">

                    <div class="ep-small-label">

                        <i class="fa fa-circle"></i>

                        SMART EXAM PREPARATION

                    </div>

                    <h1 class="ep-hero-title">

                        Prepare With
                        <span>Confidence.</span>

                    </h1>

                    <p class="ep-hero-description">

                        Practice with organized questions and online tests
                        designed to help students improve their preparation
                        and understand their performance.

                    </p>

                    <div class="ep-hero-buttons">

                        <a
                            href="${pageContext.request.contextPath}/studentLogin.jsp"
                            class="ep-btn-primary">

                            Start Practice

                            <i class="fa fa-play"></i>

                        </a>

                        <a
                            href="#ep-process"
                            class="ep-btn-outline">

                            How It Works

                            <i class="fa fa-angle-down"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= SLIDE 3 ================= -->

        <div class="ep-slide">

            <img
                src="${pageContext.request.contextPath}/assets1/images/slide-03.jpg"
                class="ep-slide-image"
                alt="Student Success">

            <div class="ep-slide-overlay"></div>

            <div class="ep-slide-content">

                <div class="ep-hero-text">

                    <div class="ep-small-label">

                        <i class="fa fa-circle"></i>

                        YOUR DIGITAL EXAM SPACE

                    </div>

                    <h1 class="ep-hero-title">

                        Your Journey.
                        <span>Your Result.</span>

                    </h1>

                    <p class="ep-hero-description">

                        Access exam resources, practice tests, study materials
                        and result information from one simple and organized
                        platform.

                    </p>

                    <div class="ep-hero-buttons">

                        <a
                            href="${pageContext.request.contextPath}/resources.jsp"
                            class="ep-btn-primary">

                            Explore Resources

                            <i class="fa fa-book"></i>

                        </a>

                        <a
                            href="${pageContext.request.contextPath}/aboutus.jsp"
                            class="ep-btn-outline">

                            About ExamPortal

                            <i class="fa fa-info-circle"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= ARROWS ================= -->

        <button
            type="button"
            class="ep-arrow ep-arrow-left"
            id="epPrev"
            aria-label="Previous Slide">

            <i class="fa fa-chevron-left"></i>

        </button>


        <button
            type="button"
            class="ep-arrow ep-arrow-right"
            id="epNext"
            aria-label="Next Slide">

            <i class="fa fa-chevron-right"></i>

        </button>


        <!-- ================= DOTS ================= -->

        <div class="ep-slider-dots">

            <button
                class="ep-dot active"
                data-slide="0"
                aria-label="Slide 1">
            </button>

            <button
                class="ep-dot"
                data-slide="1"
                aria-label="Slide 2">
            </button>

            <button
                class="ep-dot"
                data-slide="2"
                aria-label="Slide 3">
            </button>

        </div>


        <!-- ================= FLOATING BAR ================= -->

        <div class="ep-floating-bar">

            <div class="ep-floating-item">

                <div class="ep-floating-icon">
                    <i class="fa fa-pencil"></i>
                </div>

                <div>

                    <h5>Online Exams</h5>

                    <p>Structured examination experience</p>

                </div>

            </div>


            <div class="ep-floating-item">

                <div class="ep-floating-icon">
                    <i class="fa fa-book"></i>
                </div>

                <div>

                    <h5>Practice & Learn</h5>

                    <p>Prepare with practice resources</p>

                </div>

            </div>


            <div class="ep-floating-item">

                <div class="ep-floating-icon">
                    <i class="fa fa-line-chart"></i>
                </div>

                <div>

                    <h5>Track Results</h5>

                    <p>Understand your exam performance</p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     ABOUT EXAMPORTAL
========================================================= -->

<section class="ep-section ep-about">

    <div class="ep-container">

        <div class="ep-about-grid ep-reveal">


            <div class="ep-about-image">

                <img
                    src="${pageContext.request.contextPath}/assets/images/image-gallery/slide_1.jpg"
                    alt="ExamPortal Learning">

                <div class="ep-about-badge">

                    <strong>ExamPortal</strong>

                    <span>Online Examination & Learning</span>

                </div>

            </div>


            <div class="ep-about-content">

                <span class="ep-section-label">
                    ABOUT THE PLATFORM
                </span>

                <h3>
                    A Simple Digital Space
                    For Better Exam Preparation
                </h3>

                <p>

                    ExamPortal is designed to bring examination,
                    preparation and learning resources together
                    in one organized platform.

                </p>

                <p>

                    Students can explore available exams, practice
                    questions, access resources and review their
                    performance through an easy-to-use interface.

                </p>


                <ul class="ep-check-list">

                    <li>
                        <i class="fa fa-check-circle"></i>
                        Explore available examinations
                    </li>

                    <li>
                        <i class="fa fa-check-circle"></i>
                        Practice questions and online tests
                    </li>

                    <li>
                        <i class="fa fa-check-circle"></i>
                        Access learning and study resources
                    </li>

                    <li>
                        <i class="fa fa-check-circle"></i>
                        Review examination results
                    </li>

                </ul>


                <a
                    href="${pageContext.request.contextPath}/aboutus.jsp"
                    class="ep-btn-primary">

                    Learn More

                    <i class="fa fa-arrow-right"></i>

                </a>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     FEATURES
========================================================= -->

<section
    class="ep-section ep-features"
    id="ep-features">

    <div class="ep-container">


        <div class="ep-section-heading ep-reveal">

            <span class="ep-section-label">
                PLATFORM FEATURES
            </span>

            <h2 class="ep-section-title">
                Everything You Need
                For Your Exam Journey
            </h2>

            <p class="ep-section-description">

                ExamPortal brings important examination and
                preparation features together in a clean,
                organized and student-friendly platform.

            </p>

        </div>


        <div class="ep-feature-grid">


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-pencil-square-o"></i>
                </div>

                <h4>Online Examination</h4>

                <p>
                    Participate in online examinations through
                    a structured and easy-to-use interface.
                </p>

            </div>


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-question-circle"></i>
                </div>

                <h4>Question Practice</h4>

                <p>
                    Practice questions to strengthen preparation
                    before attempting examinations.
                </p>

            </div>


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-clock-o"></i>
                </div>

                <h4>Timed Tests</h4>

                <p>
                    Attempt tests with a time-based examination
                    experience for better preparation.
                </p>

            </div>


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-bar-chart"></i>
                </div>

                <h4>Result Tracking</h4>

                <p>
                    Review examination results and understand
                    your performance after completing tests.
                </p>

            </div>


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-book"></i>
                </div>

                <h4>Study Resources</h4>

                <p>
                    Find useful learning material and resources
                    from the platform.
                </p>

            </div>


            <div class="ep-feature-card ep-reveal">

                <div class="ep-feature-icon">
                    <i class="fa fa-user"></i>
                </div>

                <h4>Student Account</h4>

                <p>
                    Manage your student activity and access
                    relevant examination information.
                </p>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     HOW IT WORKS
========================================================= -->

<section
    class="ep-section ep-process"
    id="ep-process">

    <div class="ep-container">


        <div class="ep-section-heading ep-reveal">

            <span class="ep-section-label">
                SIMPLE PROCESS
            </span>

            <h2 class="ep-section-title">
                How ExamPortal Works
            </h2>

            <p class="ep-section-description">

                Follow a simple process to prepare, practice
                and participate in online examinations.

            </p>

        </div>


        <div class="ep-process-grid">


            <div class="ep-process-card ep-reveal">

                <div class="ep-process-number">
                    01
                </div>

                <h4>Login</h4>

                <p>
                    Access your student account and enter
                    the examination platform.
                </p>

            </div>


            <div class="ep-process-card ep-reveal">

                <div class="ep-process-number">
                    02
                </div>

                <h4>Prepare</h4>

                <p>
                    Explore resources and practice questions
                    before attempting your exam.
                </p>

            </div>


            <div class="ep-process-card ep-reveal">

                <div class="ep-process-number">
                    03
                </div>

                <h4>Attempt</h4>

                <p>
                    Select an available examination and
                    complete the online test.
                </p>

            </div>


            <div class="ep-process-card ep-reveal">

                <div class="ep-process-number">
                    04
                </div>

                <h4>Review</h4>

                <p>
                    Check your result and use the outcome
                    to improve your preparation.
                </p>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     EXAM CATEGORIES
========================================================= -->

<section class="ep-section ep-categories">

    <div class="ep-container">


        <div class="ep-section-heading ep-reveal">

            <span class="ep-section-label">
                EXPLORE
            </span>

            <h2 class="ep-section-title">
                Explore Your Learning Areas
            </h2>

            <p class="ep-section-description">

                Choose from the categories and examination
                areas available through the platform.

            </p>

        </div>


        <div class="ep-category-grid">


            <div class="ep-category ep-reveal">

                <i class="fa fa-code"></i>

                <h4>Programming</h4>

                <p>
                    Practice programming concepts and
                    technical questions.
                </p>

                <span class="ep-category-number">
                    01
                </span>

            </div>


            <div class="ep-category ep-reveal">

                <i class="fa fa-laptop"></i>

                <h4>Technology</h4>

                <p>
                    Explore technology-focused examination
                    and learning topics.
                </p>

                <span class="ep-category-number">
                    02
                </span>

            </div>


            <div class="ep-category ep-reveal">

                <i class="fa fa-database"></i>

                <h4>Database</h4>

                <p>
                    Strengthen database concepts through
                    practice and examination.
                </p>

                <span class="ep-category-number">
                    03
                </span>

            </div>


            <div class="ep-category ep-reveal">

                <i class="fa fa-graduation-cap"></i>

                <h4>General Learning</h4>

                <p>
                    Explore other learning categories
                    configured in the platform.
                </p>

                <span class="ep-category-number">
                    04
                </span>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     WHY EXAMPORTAL
========================================================= -->

<section class="ep-section ep-why">

    <div class="ep-container">


        <div class="ep-section-heading ep-reveal">

            <span class="ep-section-label">
                WHY EXAMPORTAL
            </span>

            <h2 class="ep-section-title">
                Built Around The Student Experience
            </h2>

            <p class="ep-section-description">

                The platform focuses on keeping examination
                preparation simple, organized and accessible.

            </p>

        </div>


        <div class="ep-why-grid">


            <div class="ep-why-card ep-reveal">

                <div class="ep-why-icon">
                    <i class="fa fa-mobile"></i>
                </div>

                <div>

                    <h4>Responsive Interface</h4>

                    <p>
                        Designed to work across desktop,
                        tablet and mobile screen sizes.
                    </p>

                </div>

            </div>


            <div class="ep-why-card ep-reveal">

                <div class="ep-why-icon">
                    <i class="fa fa-bolt"></i>
                </div>

                <div>

                    <h4>Simple Navigation</h4>

                    <p>
                        Important examination and learning
                        options remain easy to discover.
                    </p>

                </div>

            </div>


            <div class="ep-why-card ep-reveal">

                <div class="ep-why-icon">
                    <i class="fa fa-shield"></i>
                </div>

                <div>

                    <h4>Structured Platform</h4>

                    <p>
                        Examination functionality is organized
                        through separate student and admin areas.
                    </p>

                </div>

            </div>


            <div class="ep-why-card ep-reveal">

                <div class="ep-why-icon">
                    <i class="fa fa-cogs"></i>
                </div>

                <div>

                    <h4>Organized Management</h4>

                    <p>
                        Examination content and related data
                        can be managed through the application.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     CTA
========================================================= -->

<section class="ep-cta">

    <div class="ep-container">

        <div class="ep-cta-box ep-reveal">

            <span class="ep-section-label">
                START YOUR JOURNEY
            </span>

            <h2>
                Ready To Prepare For Your Next Exam?
            </h2>

            <p>

                Explore ExamPortal, practice available questions,
                discover learning resources and take the next
                step in your examination preparation.

            </p>

            <div class="ep-hero-buttons"
                 style="justify-content:center;">

                <a
                    href="${pageContext.request.contextPath}/studentHome.jsp"
                    class="ep-btn-primary">

                    Explore ExamPortal

                    <i class="fa fa-arrow-right"></i>

                </a>

                <a
                    href="${pageContext.request.contextPath}/aboutus.jsp"
                    class="ep-btn-outline">

                    About Us

                    <i class="fa fa-info-circle"></i>

                </a>

            </div>

        </div>

    </div>

</section>



<!-- =========================================================
     FOOTER
========================================================= -->

<jsp:include page="footer1.jsp" />



<!-- =========================================================
     JAVASCRIPT
========================================================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {


        /* =================================================
           SLIDER
        ================================================= */

        var slides =
            document.querySelectorAll(".ep-slide");

        var dots =
            document.querySelectorAll(".ep-dot");

        var prevButton =
            document.getElementById("epPrev");

        var nextButton =
            document.getElementById("epNext");

        var currentSlide = 0;

        var autoSlide;


        function showSlide(index) {

            if (index >= slides.length) {
                index = 0;
            }

            if (index < 0) {
                index = slides.length - 1;
            }

            currentSlide = index;


            for (var i = 0; i < slides.length; i++) {

                slides[i].classList.remove("active");

            }


            for (var j = 0; j < dots.length; j++) {

                dots[j].classList.remove("active");

            }


            slides[currentSlide].classList.add("active");


            if (dots[currentSlide]) {

                dots[currentSlide].classList.add("active");

            }

        }


        function nextSlide() {

            showSlide(currentSlide + 1);

        }


        function previousSlide() {

            showSlide(currentSlide - 1);

        }


        function startAutoSlide() {

            clearInterval(autoSlide);

            autoSlide =
                setInterval(function () {

                    nextSlide();

                }, 5000);

        }


        function resetAutoSlide() {

            startAutoSlide();

        }


        nextButton.addEventListener(
            "click",
            function () {

                nextSlide();

                resetAutoSlide();

            }
        );


        prevButton.addEventListener(
            "click",
            function () {

                previousSlide();

                resetAutoSlide();

            }
        );


        dots.forEach(function (dot) {

            dot.addEventListener(
                "click",
                function () {

                    var slideNumber =
                        parseInt(
                            this.getAttribute("data-slide")
                        );

                    showSlide(slideNumber);

                    resetAutoSlide();

                }
            );

        });


        /* =================================================
           PAUSE SLIDER ON HOVER
        ================================================= */

        var slider =
            document.getElementById("epSlider");


        slider.addEventListener(
            "mouseenter",
            function () {

                clearInterval(autoSlide);

            }
        );


        slider.addEventListener(
            "mouseleave",
            function () {

                startAutoSlide();

            }
        );


        /* =================================================
           TOUCH / SWIPE
        ================================================= */

        var touchStartX = 0;

        var touchEndX = 0;


        slider.addEventListener(
            "touchstart",
            function (event) {

                touchStartX =
                    event.changedTouches[0].screenX;

            },
            {
                passive: true
            }
        );


        slider.addEventListener(
            "touchend",
            function (event) {

                touchEndX =
                    event.changedTouches[0].screenX;

                handleSwipe();

            },
            {
                passive: true
            }
        );


        function handleSwipe() {

            var swipeDistance =
                touchStartX - touchEndX;


            if (Math.abs(swipeDistance) < 50) {
                return;
            }


            if (swipeDistance > 0) {

                nextSlide();

            } else {

                previousSlide();

            }

            resetAutoSlide();

        }


        /* =================================================
           KEYBOARD NAVIGATION
        ================================================= */

        document.addEventListener(
            "keydown",
            function (event) {

                if (event.key === "ArrowRight") {

                    nextSlide();

                    resetAutoSlide();

                }

                if (event.key === "ArrowLeft") {

                    previousSlide();

                    resetAutoSlide();

                }

            }
        );


        /* =================================================
           START SLIDER
        ================================================= */

        showSlide(0);

        startAutoSlide();


        /* =================================================
           SCROLL REVEAL ANIMATION
        ================================================= */

        var revealElements =
            document.querySelectorAll(".ep-reveal");


        function revealOnScroll() {

            var windowHeight =
                window.innerHeight;


            revealElements.forEach(
                function (element) {

                    var elementTop =
                        element.getBoundingClientRect().top;


                    if (
                        elementTop <
                        windowHeight - 80
                    ) {

                        element.classList.add("show");

                    }

                }
            );

        }


        window.addEventListener(
            "scroll",
            revealOnScroll
        );


        revealOnScroll();


        /* =================================================
           SMOOTH INTERNAL LINKS
        ================================================= */

        document.querySelectorAll(
            'a[href^="#"]'
        ).forEach(
            function (anchor) {

                anchor.addEventListener(
                    "click",
                    function (event) {

                        var targetId =
                            this.getAttribute("href");


                        if (
                            targetId &&
                            targetId !== "#"
                        ) {

                            var target =
                                document.querySelector(
                                    targetId
                                );


                            if (target) {

                                event.preventDefault();


                                target.scrollIntoView({
                                    behavior: "smooth",
                                    block: "start"
                                });

                            }

                        }

                    }
                );

            }
        );

    });

</script>


</body>

</html>