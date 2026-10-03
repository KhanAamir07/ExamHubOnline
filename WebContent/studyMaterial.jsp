<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Offline Study Material</title>
    
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
            background: #f5f7fb;
            color: #1e293b;
            font-family: 'Montserrat', sans-serif;
        }

        .material-page {
            min-height: 100vh;
            padding: 115px 20px 80px;
        }

        .material-container {
            max-width: 1150px;
            margin: auto;
        }

        /* HERO */

        .material-hero {
            position: relative;
            overflow: hidden;
            margin-bottom: 30px;
            padding: 55px 45px;
            border-radius: 24px;
            background: linear-gradient(
                135deg,
                #0f172a 0%,
                #172554 55%,
                #1e40af 100%
            );
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.18);
        }

        .material-hero::before {
            content: "";
            position: absolute;
            width: 300px;
            height: 300px;
            right: -100px;
            top: -140px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
        }

        .material-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            left: -70px;
            bottom: -110px;
            border-radius: 50%;
            background: rgba(255,255,255,0.04);
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-badge {
            display: inline-flex;
            padding: 8px 15px;
            margin-bottom: 17px;
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 50px;
            background: rgba(255,255,255,0.08);
            color: #e2e8f0;
            font-size: 11px;
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

        .hero-description {
            max-width: 720px;
            margin: 0;
            color: #cbd5e1;
            font-size: 14px;
            line-height: 1.8;
        }

        /* CONTENT CARD */

        .material-card {
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            background: #ffffff;
            box-shadow: 0 12px 35px rgba(15,23,42,0.07);
        }

        .material-header {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 27px 32px;
            border-bottom: 1px solid #edf1f5;
        }

        .material-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 52px;
            height: 52px;
            flex-shrink: 0;
            border-radius: 15px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 23px;
        }

        .material-header h2 {
            margin: 0 0 5px;
            color: #0f172a;
            font-size: 20px;
            font-weight: 700;
        }

        .material-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        /* TABLE */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .material-table {
            width: 100%;
            min-width: 700px;
            border-collapse: collapse;
        }

        .material-table thead th {
            padding: 17px 25px;
            border-bottom: 1px solid #e2e8f0;
            background: #f8fafc;
            color: #64748b;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .7px;
            text-align: left;
            text-transform: uppercase;
        }

        .material-table tbody td {
            padding: 19px 25px;
            border-bottom: 1px solid #eef2f7;
            color: #475569;
            font-size: 13px;
            line-height: 1.6;
            vertical-align: middle;
        }

        .material-table tbody tr {
            transition: all .2s ease;
        }

        .material-table tbody tr:hover {
            background: #f8fbff;
        }

        .material-table tbody tr:last-child td {
            border-bottom: none;
        }

        .book-name {
            display: flex;
            align-items: center;
            gap: 13px;
            color: #0f172a;
            font-weight: 600;
        }

        .book-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            flex-shrink: 0;
            border-radius: 11px;
            background: #f1f5f9;
            color: #2563eb;
            font-size: 17px;
        }

        .download-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 9px 15px;
            border: 1px solid #dbeafe;
            border-radius: 9px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none;
            transition: all .2s ease;
        }

        .download-btn:hover {
            border-color: #2563eb;
            background: #2563eb;
            color: #ffffff;
            text-decoration: none;
            transform: translateY(-1px);
            box-shadow: 0 5px 14px rgba(37,99,235,.18);
        }

        .count-badge {
            display: inline-block;
            margin-left: 5px;
            padding: 4px 9px;
            border-radius: 50px;
            background: #f1f5f9;
            color: #64748b;
            font-size: 10px;
            font-weight: 600;
        }

        /* MOBILE */

        @media (max-width: 768px) {

            .material-page {
                padding: 95px 15px 60px;
            }

            .material-hero {
                padding: 40px 25px;
                border-radius: 20px;
            }

            .hero-title {
                font-size: 29px;
            }

            .hero-description {
                font-size: 13px;
            }

            .material-header {
                padding: 22px;
            }

            .table-wrapper {
                overflow-x: auto;
            }

            .material-table thead th,
            .material-table tbody td {
                padding: 15px 18px;
            }
        }

        @media (max-width: 480px) {

            .material-page {
                padding-left: 10px;
                padding-right: 10px;
            }

            .material-hero {
                padding: 32px 20px;
            }

            .hero-title {
                font-size: 25px;
            }

            .material-header {
                gap: 12px;
            }

            .material-icon {
                width: 45px;
                height: 45px;
                font-size: 19px;
            }

            .material-header h2 {
                font-size: 17px;
            }

            .book-name {
                gap: 9px;
            }

            .book-icon {
                width: 36px;
                height: 36px;
            }
        }

    </style>

</head>

<body>

    <jsp:include page="menu1.jsp" />

    <main class="material-page">

        <div class="material-container">

            <!-- HERO -->

            <section class="material-hero">

                <div class="hero-content">

                    <span class="hero-badge">
                        Learning Resources
                    </span>

                    <h1 class="hero-title">
                        Offline Study Material
                    </h1>

                    <p class="hero-description">
                        Explore the available study resources and reference
                        books to strengthen your preparation for Java, Python,
                        JDBC, JSP, Servlets and programming interviews.
                    </p>

                </div>

            </section>


            <!-- MATERIAL CARD -->

            <section class="material-card">

                <div class="material-header">

                    <div class="material-icon">
                        &#128218;
                    </div>

                    <div>

                        <h2>
                            Books & Study Resources
                            <span class="count-badge">16 Resources</span>
                        </h2>

                        <p>
                            Click on View / Download to access the study material.
                        </p>

                    </div>

                </div>


                <div class="table-wrapper">

                    <table class="material-table">

                        <thead>

                            <tr>
                                <th>Book Name</th>
                                <th>Access Material</th>
                            </tr>

                        </thead>

                        <tbody>

                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        Head First Java 2nd Edition
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1IyFRkyQPBOmk-xVJGXr6tobF8eTbc5_V/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        Setup-and-Config
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/14X3eOv5IyNZPIo9yWWdY-pWceyuRe_Hp/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        OCA Java SE 8 Programmer I Certification Guide
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1jkhbozwddIvo2sYuUb363XioaX-1wH7S/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        Python Book
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1xaBq_jN8s8cU6Fw-cfRAE5yGjnsRtm-c/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        Programming Python, 4th Edition (2010)
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1GpnXEjACuaVOALZu_Fhs3MDKbp1J6toE/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        Servlet Basics
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/12KPUryS-ianTDpusQPPH0KCkf30-I4kr/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128451;</span>
                                        Configuring Databases
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1ADdGx4RzIvZ3l57P9RXZ_SaApDeu3CiE/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128451;</span>
                                        Accessing Databases JDBC
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1zMh_PBKoDIHXc2U-AjxF1P0R_a5P_xkA/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        Cracking the Coding Interview
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1sFup_VTvktgybANYSKEf0Ai026D_YIVU/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP and JavaBeans
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1TmtgUKvpkbKmDuymJYMlpcPZR6R21dF-/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP EL
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1zY_Uzh2HeDG8qr7tariWH2Ro-Db87ljF/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP File Inclusion
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1vDoFJDCeBMJKdX2N4g_FEL7a2og8pMJg/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP Overview
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/151TuVQBeCHRNEz7aC0tu6Ik9fcWmTVML/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP Page Directive
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/14nkGd7pgmMUvNEKyQIxFnCL5LHpCGy0A/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        JSP Scripting Elements
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1E3s9jXZT_5Dv3UW0Gc3c51OSeh7GPcFh/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        MVC
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1xJ3v3oHp6VWgHB4vn9EvqSXBmMvaUYQQ/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128214;</span>
                                        Overview
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1xhqcgiZYb18B3DThB8Og-4VUHJKMJQ4Y/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <div class="book-name">
                                        <span class="book-icon">&#128187;</span>
                                        Session Tracking
                                    </div>
                                </td>

                                <td>
                                    <a class="download-btn"
                                        target="_blank"
                                        href="https://drive.google.com/file/d/1K2qR3HTULm9kDZqL-7nbfi_Y9kaxrQE1/view?usp=sharing">
                                        &#128065; View / Download
                                    </a>
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

            </section>

        </div>

    </main>

    <jsp:include page="footer1.jsp" />

</body>

</html>