<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

<title>ExamPortal | Exam Schedule</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: #f6f8fc;
    color: #172033;
    font-family: 'Montserrat', Arial, sans-serif;
}

.schedule-page {
    min-height: 80vh;
    padding: 115px 20px 80px;
}

.schedule-container {
    max-width: 1200px;
    margin: 0 auto;
}

/* HEADER */

.schedule-header {
    text-align: center;
    margin-bottom: 38px;
}

.schedule-badge {
    display: inline-block;
    padding: 8px 16px;
    border-radius: 30px;
    background: #eaf8ef;
    color: #159447;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-bottom: 15px;
}

.schedule-header h1 {
    margin: 0;
    font-size: 40px;
    line-height: 1.2;
    font-weight: 600;
    color: #14213d;
}

.schedule-header p {
    max-width: 700px;
    margin: 13px auto 0;
    color: #6b7280;
    font-size: 15px;
    line-height: 1.7;
}

/* SUMMARY */

.schedule-summary {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.summary-card {
    background: #ffffff;
    border: 1px solid #e7ebf1;
    border-radius: 14px;
    padding: 20px;
    box-shadow: 0 8px 25px rgba(15, 23, 42, 0.05);
}

.summary-label {
    color: #7b8494;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: .5px;
}

.summary-value {
    display: block;
    margin-top: 7px;
    font-size: 25px;
    font-weight: 700;
    color: #172033;
}

/* TABLE CARD */

.schedule-card {
    background: #ffffff;
    border: 1px solid #e7ebf1;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 12px 35px rgba(15, 23, 42, 0.07);
}

.card-top {
    padding: 24px 25px;
    border-bottom: 1px solid #edf0f4;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
}

.card-top h2 {
    margin: 0;
    font-size: 20px;
    font-weight: 600;
    color: #172033;
}

.card-top p {
    margin: 5px 0 0;
    color: #7b8494;
    font-size: 13px;
}

.schedule-status {
    background: #eef6ff;
    color: #1677d2;
    padding: 8px 13px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}

/* TABLE */

.table-wrapper {
    width: 100%;
    overflow-x: auto;
}

.schedule-table {
    width: 100%;
    min-width: 900px;
    border-collapse: collapse;
}

.schedule-table thead {
    background: #172033;
}

.schedule-table th {
    padding: 17px 16px;
    color: #ffffff;
    text-align: left;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}

.schedule-table td {
    padding: 18px 16px;
    border-bottom: 1px solid #edf0f4;
    color: #4b5563;
    font-size: 13px;
    vertical-align: middle;
}

.schedule-table tbody tr {
    transition: .2s ease;
}

.schedule-table tbody tr:hover {
    background: #f8fafc;
}

.schedule-table tbody tr:last-child td {
    border-bottom: none;
}

/* TEST NAME */

.test-name {
    color: #172033 !important;
    font-weight: 700;
    min-width: 190px;
}

.test-name small {
    display: block;
    margin-top: 5px;
    color: #8a93a3;
    font-size: 11px;
    font-weight: 500;
}

/* TYPE */

.test-type {
    display: inline-flex;
    align-items: center;
    padding: 7px 11px;
    border-radius: 20px;
    background: #eaf8ef;
    color: #168747;
    font-size: 11px;
    font-weight: 700;
}

/* SUBJECT */

.subject-badge {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 7px;
    background: #f0f4ff;
    color: #315bbd;
    font-size: 12px;
    font-weight: 600;
}

/* NUMBERS */

.number-value {
    font-weight: 700;
    color: #172033;
}

.duration {
    white-space: nowrap;
    font-weight: 600;
}

/* DATE */

.date-box {
    white-space: nowrap;
}

.date-main {
    display: block;
    color: #374151;
    font-weight: 600;
}

.date-label {
    display: block;
    margin-top: 4px;
    color: #9aa2af;
    font-size: 10px;
}

/* EMPTY */

.empty-state {
    padding: 65px 20px !important;
    text-align: center !important;
}

.empty-icon {
    width: 65px;
    height: 65px;
    margin: 0 auto 16px;
    border-radius: 50%;
    background: #f0f4ff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 29px;
}

.empty-state h3 {
    margin: 0;
    color: #172033;
    font-size: 18px;
    font-weight: 600;
}

.empty-state p {
    margin: 8px 0 0;
    color: #8a93a3;
    font-size: 13px;
}

/* INFO */

.info-section {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
    margin-top: 25px;
}

.info-card {
    background: #ffffff;
    border: 1px solid #e7ebf1;
    border-radius: 14px;
    padding: 22px;
    box-shadow: 0 8px 25px rgba(15, 23, 42, 0.04);
}

.info-icon {
    width: 42px;
    height: 42px;
    border-radius: 10px;
    background: #eef4ff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    margin-bottom: 13px;
}

.info-card h3 {
    margin: 0 0 7px;
    font-size: 15px;
    color: #172033;
}

.info-card p {
    margin: 0;
    color: #737d8d;
    font-size: 12px;
    line-height: 1.7;
}

/* RESPONSIVE */

@media (max-width: 900px) {

    .schedule-summary {
        grid-template-columns: 1fr;
    }

    .info-section {
        grid-template-columns: 1fr;
    }

}

@media (max-width: 768px) {

    .schedule-page {
        padding: 95px 14px 60px;
    }

    .schedule-header h1 {
        font-size: 30px;
    }

    .schedule-header p {
        font-size: 13px;
    }

    .card-top {
        align-items: flex-start;
        flex-direction: column;
    }

    .schedule-status {
        white-space: normal;
    }

}

</style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<section class="schedule-page">

    <div class="schedule-container">

        <!-- PAGE HEADER -->

        <div class="schedule-header">

            <span class="schedule-badge">
                Home &nbsp;›&nbsp; Exam Schedule
            </span>

            <h1>Upcoming Exam Schedule</h1>

            <p>
                Explore scheduled assessments, test types, duration,
                marks and examination dates available on ExamPortal.
            </p>

        </div>

        <%

            List<Test> listOfAllTest =
                (List<Test>) request.getAttribute("listOfAlltest");

            if (listOfAllTest == null) {
                listOfAllTest = new ArrayList<Test>();
            }

            DateFormat dateFormat =
                new SimpleDateFormat("yyyy-MM-dd");

            int totalTests = listOfAllTest.size();

        %>

        <!-- SUMMARY -->

        <div class="schedule-summary">

            <div class="summary-card">
                <span class="summary-label">
                    Scheduled Tests
                </span>

                <span class="summary-value">
                    <%= totalTests %>
                </span>
            </div>

            <div class="summary-card">
                <span class="summary-label">
                    Test Type
                </span>

                <span class="summary-value">
                    Practice
                </span>
            </div>

            <div class="summary-card">
                <span class="summary-label">
                    Platform
                </span>

                <span class="summary-value">
                    ExamPortal
                </span>
            </div>

        </div>

        <!-- MAIN CARD -->

        <div class="schedule-card">

            <div class="card-top">

                <div>

                    <h2>Available Examination Schedule</h2>

                    <p>
                        Check your test details before starting preparation.
                    </p>

                </div>

                <span class="schedule-status">
                    ● Scheduled Tests
                </span>

            </div>

            <div class="table-wrapper">

                <table class="schedule-table">

                    <thead>

                        <tr>

                            <th>Test Name</th>

                            <th>Subject</th>

                            <th>Test Type</th>

                            <th>Questions</th>

                            <th>Marks</th>

                            <th>Duration</th>

                            <th>Test Opens</th>

                            <th>Test Closes</th>

                        </tr>

                    </thead>

                    <tbody>

                    <%

                        if (listOfAllTest.isEmpty()) {

                    %>

                        <tr>

                            <td colspan="8" class="empty-state">

                                <div class="empty-icon">
                                    📅
                                </div>

                                <h3>
                                    No Upcoming Test Available
                                </h3>

                                <p>
                                    New examinations will appear here
                                    when they are scheduled by the admin.
                                </p>

                            </td>

                        </tr>

                    <%

                        } else {

                            for (Test test : listOfAllTest) {

                                String openDate = "";

                                String closeDate = "";

                                if (test.getOpen() != null) {
                                    openDate =
                                        dateFormat.format(test.getOpen());
                                }

                                if (test.getclose() != null) {
                                    closeDate =
                                        dateFormat.format(test.getclose());
                                }

                    %>

                        <tr>

                            <td class="test-name">

                                <%= test.getTestName() %>

                            </td>

                            <td>

                                <span class="subject-badge">

                                    <%
                                        try {
                                            com.examhub.impl.ExamDaoImpl
                                                examDaoImpl =
                                                new com.examhub.impl.ExamDaoImpl();

                                            Exam exam =
                                                examDaoImpl.viewExam(
                                                    test.getExamId()
                                                );

                                            if (exam != null) {
                                    %>

                                                <%= exam.getExamName() %>

                                    <%
                                            } else {
                                    %>

                                                Exam

                                    <%
                                            }
                                        } catch (Exception e) {
                                    %>

                                            Exam

                                    <%
                                        }
                                    %>

                                </span>

                            </td>

                            <td>

                                <span class="test-type">

                                    <%= test.getTestType() %>

                                </span>

                            </td>

                            <td>

                                <span class="number-value">

                                    <%= test.getMaxQuestion() %>

                                </span>

                            </td>

                            <td>

                                <span class="number-value">

                                    <%= test.getMaxMarks() %>

                                </span>

                            </td>

                            <td>

                                <span class="duration">

                                    <%= test.getDuration() %> min

                                </span>

                            </td>

                            <td class="date-box">

                                <span class="date-main">

                                    <%= openDate %>

                                </span>

                                <span class="date-label">
                                    START DATE
                                </span>

                            </td>

                            <td class="date-box">

                                <%

                                    if (closeDate.equals("")
                                        || closeDate.equals("0001-01-01")) {

                                %>

                                    <span class="date-main">
                                        No Close Date
                                    </span>

                                <%

                                    } else {

                                %>

                                    <span class="date-main">

                                        <%= closeDate %>

                                    </span>

                                    <span class="date-label">
                                        END DATE
                                    </span>

                                <%

                                    }

                                %>

                            </td>

                        </tr>

                    <%

                            }

                        }

                    %>

                    </tbody>

                </table>

            </div>

        </div>

        <!-- INFORMATION -->

        <div class="info-section">

            <div class="info-card">

                <div class="info-icon">
                    📝
                </div>

                <h3>Practice Tests</h3>

                <p>
                    Practice tests help students revise concepts
                    and improve their preparation before attempting
                    examinations.
                </p>

            </div>

            <div class="info-card">

                <div class="info-icon">
                    ⏱
                </div>

                <h3>Time Management</h3>

                <p>
                    Check the available duration and maximum questions
                    before starting your online assessment.
                </p>

            </div>

            <div class="info-card">

                <div class="info-icon">
                    🎯
                </div>

                <h3>Exam Preparation</h3>

                <p>
                    Review the scheduled dates, marks and test details
                    so you can prepare effectively.
                </p>

            </div>

        </div>

    </div>

</section>

<jsp:include page="footer1.jsp" />

</body>

</html>