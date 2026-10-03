<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description"
        content="ExamPortal Placement and Career Opportunities">

    <meta name="author" content="ExamPortal">

    <title>ExamPortal | Placement Opportunities</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">

    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .jobs-page {
            min-height: 100vh;
            padding: 120px 20px 85px;
        }

        .jobs-container {
            max-width: 1180px;
            margin: 0 auto;
        }

        /* ==============================
           HERO
        ============================== */

        .jobs-hero {
            position: relative;
            overflow: hidden;
            padding: 58px 50px;
            margin-bottom: 30px;
            border-radius: 26px;
            background:
                linear-gradient(
                    135deg,
                    #0f172a 0%,
                    #172554 52%,
                    #1d4ed8 100%
                );
            box-shadow:
                0 22px 55px rgba(15, 23, 42, 0.18);
        }

        .jobs-hero::before {
            content: "";
            position: absolute;
            width: 330px;
            height: 330px;
            top: -170px;
            right: -70px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.06);
        }

        .jobs-hero::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            left: -100px;
            bottom: -140px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.045);
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 15px;
            margin-bottom: 18px;
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 50px;
            background: rgba(255,255,255,0.08);
            color: #dbeafe;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .hero-badge::before {
            content: "";
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #60a5fa;
        }

        .hero-title {
            max-width: 700px;
            margin: 0 0 14px;
            color: #ffffff;
            font-size: 39px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.8px;
        }

        .hero-description {
            max-width: 720px;
            margin: 0;
            color: #cbd5e1;
            font-size: 14px;
            line-height: 1.85;
        }

        /* ==============================
           STATS
        ============================== */

        .job-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-bottom: 30px;
        }

        .stat-card {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 20px;
            border: 1px solid #e5eaf1;
            border-radius: 17px;
            background: #ffffff;
            box-shadow: 0 8px 25px rgba(15,23,42,0.05);
        }

        .stat-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            flex-shrink: 0;
            border-radius: 13px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 20px;
        }

        .stat-number {
            display: block;
            margin-bottom: 3px;
            color: #0f172a;
            font-size: 18px;
            font-weight: 800;
        }

        .stat-label {
            color: #64748b;
            font-size: 11px;
            font-weight: 500;
        }

        /* ==============================
           MAIN CARD
        ============================== */

        .jobs-card {
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 23px;
            background: #ffffff;
            box-shadow: 0 12px 38px rgba(15,23,42,0.07);
        }

        .jobs-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            padding: 28px 30px;
            border-bottom: 1px solid #edf1f5;
        }

        .heading-area {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .heading-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            flex-shrink: 0;
            border-radius: 14px;
            background: #eff6ff;
            color: #2563eb;
            font-size: 21px;
        }

        .heading-area h2 {
            margin: 0 0 5px;
            color: #0f172a;
            font-size: 20px;
            font-weight: 800;
        }

        .heading-area p {
            margin: 0;
            color: #64748b;
            font-size: 12px;
        }

        /* ==============================
           SEARCH
        ============================== */

        .search-box {
            position: relative;
            width: 260px;
            flex-shrink: 0;
        }

        .search-box input {
            width: 100%;
            height: 42px;
            padding: 0 15px 0 42px;
            border: 1px solid #dbe2ea;
            border-radius: 11px;
            outline: none;
            background: #f8fafc;
            color: #334155;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            transition: all .2s ease;
        }

        .search-box input:focus {
            border-color: #3b82f6;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(59,130,246,.10);
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
            font-size: 15px;
        }

        /* ==============================
           JOB LIST
        ============================== */

        .jobs-list {
            padding: 8px 24px 24px;
        }

        .job-item {
            display: grid;
            grid-template-columns: minmax(190px, 0.8fr)
                                 minmax(300px, 1.7fr)
                                 130px
                                 105px;
            align-items: center;
            gap: 20px;
            padding: 19px 18px;
            margin-top: 10px;
            border: 1px solid transparent;
            border-radius: 15px;
            transition:
                transform .2s ease,
                border-color .2s ease,
                background .2s ease,
                box-shadow .2s ease;
        }

        .job-item:hover {
            transform: translateY(-2px);
            border-color: #dbeafe;
            background: #f8fbff;
            box-shadow: 0 8px 25px rgba(37,99,235,.07);
        }

        .job-column-label {
            display: none;
        }

        .job-type {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #0f172a;
            font-size: 13px;
            font-weight: 700;
        }

        .company-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 43px;
            height: 43px;
            flex-shrink: 0;
            border-radius: 12px;
            background: #eef2ff;
            color: #4f46e5;
            font-size: 18px;
        }

        .job-title {
            color: #334155;
            font-size: 13px;
            font-weight: 500;
            line-height: 1.6;
        }

        .job-date {
            color: #64748b;
            font-size: 12px;
            font-weight: 600;
        }

        .date-badge {
            display: inline-flex;
            align-items: center;
            padding: 7px 10px;
            border-radius: 8px;
            background: #f8fafc;
            color: #64748b;
            font-size: 10px;
            font-weight: 600;
        }

        .apply-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            min-width: 90px;
            padding: 10px 15px;
            border-radius: 9px;
            background: #2563eb;
            color: #ffffff !important;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none !important;
            transition: all .2s ease;
            box-shadow: 0 5px 15px rgba(37,99,235,.16);
        }

        .apply-btn:hover {
            background: #1d4ed8;
            color: #ffffff !important;
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(37,99,235,.23);
        }

        /* ==============================
           TABLE HEADER
        ============================== */

        .jobs-table-header {
            display: grid;
            grid-template-columns: minmax(190px, 0.8fr)
                                 minmax(300px, 1.7fr)
                                 130px
                                 105px;
            gap: 20px;
            padding: 15px 42px;
            border-bottom: 1px solid #edf1f5;
            background: #f8fafc;
            color: #64748b;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: .8px;
            text-transform: uppercase;
        }

        /* ==============================
           EMPTY STATE
        ============================== */

        .empty-state {
            padding: 65px 25px;
            text-align: center;
        }

        .empty-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 65px;
            height: 65px;
            margin: 0 auto 18px;
            border-radius: 18px;
            background: #f1f5f9;
            color: #64748b;
            font-size: 27px;
        }

        .empty-state h3 {
            margin: 0 0 8px;
            color: #0f172a;
            font-size: 18px;
            font-weight: 700;
        }

        .empty-state p {
            margin: 0;
            color: #64748b;
            font-size: 12px;
        }

        /* ==============================
           MOBILE
        ============================== */

        @media (max-width: 900px) {

            .jobs-table-header {
                display: none;
            }

            .job-item {
                grid-template-columns: 1fr 1fr;
                gap: 15px;
                padding: 20px;
                border: 1px solid #e5eaf1;
                background: #ffffff;
            }

            .job-item:hover {
                background: #f8fbff;
            }

            .job-column-label {
                display: block;
                margin-bottom: 5px;
                color: #94a3b8;
                font-size: 9px;
                font-weight: 700;
                letter-spacing: .6px;
                text-transform: uppercase;
            }

            .job-type,
            .job-title {
                font-size: 12px;
            }

            .job-date {
                font-size: 11px;
            }

            .apply-btn {
                width: 100%;
            }

            .search-box {
                width: 230px;
            }
        }

        @media (max-width: 700px) {

            .jobs-page {
                padding: 95px 15px 60px;
            }

            .jobs-hero {
                padding: 40px 25px;
                border-radius: 21px;
            }

            .hero-title {
                font-size: 29px;
            }

            .hero-description {
                font-size: 13px;
            }

            .job-stats {
                grid-template-columns: 1fr;
            }

            .jobs-card-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-box {
                width: 100%;
            }

            .jobs-list {
                padding: 8px 15px 20px;
            }

            .job-item {
                grid-template-columns: 1fr;
                gap: 14px;
            }
        }

        @media (max-width: 480px) {

            .jobs-page {
                padding-left: 10px;
                padding-right: 10px;
            }

            .jobs-hero {
                padding: 32px 20px;
            }

            .hero-title {
                font-size: 25px;
            }

            .jobs-card-header {
                padding: 22px;
            }

            .heading-area h2 {
                font-size: 17px;
            }

            .jobs-list {
                padding-left: 12px;
                padding-right: 12px;
            }

            .job-item {
                padding: 18px;
                border-radius: 14px;
            }
        }

    </style>

</head>

<body>

    <jsp:include page="menu1.jsp" />


    <main class="jobs-page">

        <div class="jobs-container">


            <!-- HERO -->

            <section class="jobs-hero">

                <div class="hero-content">

                    <span class="hero-badge">
                        Career Opportunities
                    </span>

                    <h1 class="hero-title">
                        Build Your Career With The Right Opportunity
                    </h1>

                    <p class="hero-description">
                        Explore software development, programming and technology
                        opportunities available through ExamPortal. Find relevant
                        roles and take the next step toward your career.
                    </p>

                </div>

            </section>


            <%
                ArrayList<List> listOfJobs =
                    (ArrayList<List>) request.getAttribute("listOfJobs");

                int totalJobs = (listOfJobs == null) ? 0 : listOfJobs.size();
            %>


            <!-- STATS -->

            <section class="job-stats">

                <div class="stat-card">

                    <div class="stat-icon">
                        &#128188;
                    </div>

                    <div>
                        <span class="stat-number">
                            <%=totalJobs%>
                        </span>

                        <span class="stat-label">
                            Available Opportunities
                        </span>
                    </div>

                </div>


                <div class="stat-card">

                    <div class="stat-icon">
                        &#128187;
                    </div>

                    <div>
                        <span class="stat-number">
                            IT &amp; Tech
                        </span>

                        <span class="stat-label">
                            Technology focused roles
                        </span>
                    </div>

                </div>


                <div class="stat-card">

                    <div class="stat-icon">
                        &#128200;
                    </div>

                    <div>
                        <span class="stat-number">
                            Career
                        </span>

                        <span class="stat-label">
                            Explore your next opportunity
                        </span>
                    </div>

                </div>

            </section>


            <!-- JOBS CARD -->

            <section class="jobs-card">


                <div class="jobs-card-header">

                    <div class="heading-area">

                        <div class="heading-icon">
                            &#128188;
                        </div>

                        <div>

                            <h2>
                                Latest Opportunities
                            </h2>

                            <p>
                                Explore available jobs and apply directly.
                            </p>

                        </div>

                    </div>


                    <div class="search-box">

                        <span class="search-icon">
                            &#128269;
                        </span>

                        <input
                            type="text"
                            id="jobSearch"
                            placeholder="Search jobs...">

                    </div>

                </div>


                <%
                    if (listOfJobs == null || listOfJobs.size() == 0) {
                %>

                    <div class="empty-state">

                        <div class="empty-icon">
                            &#128188;
                        </div>

                        <h3>
                            No Jobs Available
                        </h3>

                        <p>
                            There are currently no placement opportunities available.
                        </p>

                    </div>

                <%
                    } else {
                %>


                    <!-- TABLE HEADER -->

                    <div class="jobs-table-header">

                        <div>Job Type</div>
                        <div>Position</div>
                        <div>Date Posted</div>
                        <div>Action</div>

                    </div>


                    <!-- JOB LIST -->

                    <div class="jobs-list" id="jobsList">

                        <%
                            for (List item : listOfJobs) {
                        %>

                        <article class="job-item">

                            <div>

                                <span class="job-column-label">
                                    Job Type
                                </span>

                                <div class="job-type">

                                    <span class="company-icon">
                                        &#128187;
                                    </span>

                                    <span>
                                        <%=item.get(0)%>
                                    </span>

                                </div>

                            </div>


                            <div>

                                <span class="job-column-label">
                                    Position
                                </span>

                                <div class="job-title">
                                    <%=item.get(2)%>
                                </div>

                            </div>


                            <div>

                                <span class="job-column-label">
                                    Date Posted
                                </span>

                                <div class="job-date">

                                    <span class="date-badge">
                                        &#128197;&nbsp;
                                        <%=item.get(3)%>
                                    </span>

                                </div>

                            </div>


                            <div>

                                <span class="job-column-label">
                                    Action
                                </span>

                                <a
                                    class="apply-btn"
                                    href="<%=item.get(1)%>"
                                    target="_blank"
                                    rel="noopener noreferrer">

                                    Apply
                                    <span>&#8594;</span>

                                </a>

                            </div>

                        </article>

                        <%
                            }
                        %>

                    </div>


                <%
                    }
                %>


            </section>

        </div>

    </main>


    <jsp:include page="footer1.jsp" />


    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const searchInput = document.getElementById("jobSearch");
            const jobs = document.querySelectorAll(".job-item");

            if (!searchInput) {
                return;
            }

            searchInput.addEventListener("input", function () {

                const searchValue =
                    this.value.toLowerCase().trim();

                jobs.forEach(function (job) {

                    const jobText =
                        job.textContent.toLowerCase();

                    if (jobText.indexOf(searchValue) !== -1) {
                        job.style.display = "";
                    } else {
                        job.style.display = "none";
                    }

                });

            });

        });

    </script>

</body>

</html>