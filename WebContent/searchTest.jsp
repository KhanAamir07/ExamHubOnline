<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>
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

<title>ExamPortal | Practice Center</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap');

* {
    box-sizing: border-box;
}

html,
body {
    margin: 0;
    padding: 0;
    font-family: 'Montserrat', sans-serif !important;
    background: #f5f7fb;
    color: #172033;
}

/* ===============================
   MAIN PAGE
================================ */

.practice-page {
    min-height: 100vh;
    padding: 135px 5% 90px;
}

/* ===============================
   TOP HERO
================================ */

.practice-header {
    max-width: 1250px;
    margin: 0 auto 28px;
    padding: 38px 42px;
    border-radius: 24px;
    background: linear-gradient(
        135deg,
        #111827 0%,
        #1e293b 60%,
        #172554 100%
    );
    position: relative;
    overflow: hidden;
    box-shadow: 0 20px 50px rgba(15,23,42,.12);
}

.practice-header:before {
    content: "";
    position: absolute;
    width: 230px;
    height: 230px;
    border-radius: 50%;
    right: -70px;
    top: -100px;
    background: rgba(59,130,246,.16);
}

.practice-header:after {
    content: "";
    position: absolute;
    width: 150px;
    height: 150px;
    border-radius: 50%;
    left: 48%;
    bottom: -100px;
    background: rgba(96,165,250,.08);
}

.header-content {
    position: relative;
    z-index: 2;
}

.header-label {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #93c5fd;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    margin-bottom: 12px;
}

.header-label span {
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: #60a5fa;
}

.practice-header h1 {
    margin: 0;
    color: #fff;
    font-size: 34px;
    font-weight: 800;
    letter-spacing: -.5px;
}

.practice-header h1 strong {
    color: #60a5fa;
}

.practice-header p {
    margin: 10px 0 0;
    max-width: 680px;
    color: #cbd5e1;
    font-size: 13px;
    line-height: 1.8;
}

/* ===============================
   CONTENT
================================ */

.practice-content {
    max-width: 1250px;
    margin: auto;
}

.content-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.content-title h2 {
    margin: 0;
    font-size: 22px;
    font-weight: 800;
    color: #111827;
}

.content-title p {
    margin: 6px 0 0;
    color: #64748b;
    font-size: 12px;
}

/* ===============================
   TEST COUNT
================================ */

.test-count {
    padding: 10px 15px;
    background: #fff;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    color: #2563eb;
    font-size: 11px;
    font-weight: 700;
}

/* ===============================
   TABLE CARD
================================ */

.test-table-card {
    background: #fff;
    border-radius: 20px;
    border: 1px solid #e7ebf1;
    overflow: hidden;
    box-shadow: 0 15px 40px rgba(15,23,42,.06);
}

/* ===============================
   TABLE
================================ */

.test-table {
    width: 100%;
    border-collapse: collapse;
}

.test-table thead {
    background: #f8fafc;
}

.test-table thead th {
    padding: 18px 18px;
    text-align: left;
    color: #475569;
    font-size: 10px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: .7px;
    border-bottom: 1px solid #e8edf3;
    white-space: nowrap;
}

.test-table tbody td {
    padding: 20px 18px;
    border-bottom: 1px solid #edf1f5;
    color: #334155;
    font-size: 12px;
    vertical-align: middle;
}

.test-table tbody tr {
    transition: all .25s ease;
}

.test-table tbody tr:hover {
    background: #f8fbff;
}

.test-table tbody tr:last-child td {
    border-bottom: none;
}

/* ===============================
   TEST NAME
================================ */

.test-name {
    color: #111827 !important;
    font-weight: 700 !important;
    min-width: 230px;
}

.test-name-wrap {
    display: flex;
    align-items: center;
    gap: 12px;
}

.test-icon {
    width: 38px;
    height: 38px;
    min-width: 38px;
    border-radius: 11px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #eff6ff;
    color: #2563eb;
    font-size: 15px;
    font-weight: 800;
}

.test-title {
    line-height: 1.45;
}

/* ===============================
   TYPE
================================ */

.type-badge {
    display: inline-flex;
    padding: 7px 10px;
    border-radius: 20px;
    background: #eef2ff;
    color: #4338ca;
    font-size: 9px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: .5px;
}

/* ===============================
   NUMBER VALUES
================================ */

.value-box {
    font-weight: 700;
    color: #1e293b;
}

.duration {
    color: #475569;
    font-weight: 600;
}

.close-date {
    color: #64748b;
    font-weight: 600;
    white-space: nowrap;
}

/* ===============================
   ACTIONS
================================ */

.action-buttons {
    display: flex;
    align-items: center;
    gap: 7px;
    white-space: nowrap;
}

.action-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 36px;
    padding: 0 13px;
    border-radius: 9px;
    text-decoration: none !important;
    font-family: 'Montserrat', sans-serif !important;
    font-size: 9px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: .35px;
    transition: all .25s ease;
}

.attempt-btn {
    background: #2563eb;
    color: #fff !important;
    box-shadow: 0 7px 16px rgba(37,99,235,.20);
}

.attempt-btn:hover {
    background: #1d4ed8;
    transform: translateY(-2px);
}

.result-btn {
    background: #eef2ff;
    color: #4338ca !important;
}

.result-btn:hover {
    background: #e0e7ff;
}

.retake-btn {
    background: #f1f5f9;
    color: #334155 !important;
}

.retake-btn:hover {
    background: #e2e8f0;
}

/* ===============================
   EMPTY STATE
================================ */

.empty-state {
    text-align: center;
    padding: 65px 25px;
}

.empty-icon {
    width: 64px;
    height: 64px;
    margin: 0 auto 18px;
    border-radius: 18px;
    background: #eff6ff;
    color: #2563eb;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 25px;
    font-weight: 800;
}

.empty-state h3 {
    margin: 0 0 8px;
    color: #111827;
    font-size: 19px;
    font-weight: 800;
}

.empty-state p {
    margin: 0;
    color: #64748b;
    font-size: 12px;
}

/* ===============================
   RESPONSIVE
================================ */

@media (max-width: 1100px) {

    .practice-page {
        padding-left: 25px;
        padding-right: 25px;
    }

    .test-table-card {
        overflow-x: auto;
    }

    .test-table {
        min-width: 950px;
    }
}

@media (max-width: 700px) {

    .practice-page {
        padding: 110px 15px 60px;
    }

    .practice-header {
        padding: 30px 24px;
        border-radius: 20px;
    }

    .practice-header h1 {
        font-size: 27px;
    }

    .content-top {
        display: block;
    }

    .test-count {
        display: inline-block;
        margin-top: 12px;
    }

}

</style>

</head>


<body>

<jsp:include page="menu1.jsp" />


<%
ResultDaoImpl resultDao = new ResultDaoImpl();

String studentLogin =
        (String) session.getAttribute("studentLogin");

String studentLoginSucessMessage =
        (String) request.getAttribute(
                "studentLoginSucessMessage");

List<Test> listOfAllTest =
        (List<Test>) request.getAttribute(
                "listOfAlltest");

if (listOfAllTest == null) {
    listOfAllTest = new ArrayList<Test>();
}

DateFormat dateFormat =
        new SimpleDateFormat("yyyy-MM-dd");

if (studentLogin != null) {
%>


<div class="practice-page">


    <!-- ================= HEADER ================= -->

    <div class="practice-header">

        <div class="header-content">

            <div class="header-label">
                <span></span>
                ExamPortal Learning Center
            </div>

            <h1>
                Practice <strong>Center</strong>
            </h1>

            <p>
                Challenge yourself with carefully prepared practice
                assessments. Attempt an exam, review your performance
                and continue improving your skills.
            </p>

        </div>

    </div>


    <!-- ================= CONTENT ================= -->

    <div class="practice-content">


        <div class="content-top">

            <div class="content-title">

                <h2>
                    Available Assessments
                </h2>

                <p>
                    Choose an assessment and begin your preparation.
                </p>

            </div>


            <div class="test-count">

                <%= listOfAllTest.size() %>
                Assessment<%= listOfAllTest.size() != 1 ? "s" : "" %>

            </div>

        </div>


        <!-- ================= TABLE ================= -->

        <div class="test-table-card">


        <%
        if (listOfAllTest.size() == 0) {
        %>


            <div class="empty-state">

                <div class="empty-icon">
                    !
                </div>

                <h3>
                    No Assessment Available
                </h3>

                <p>
                    There are currently no assessments available
                    for this category. Please explore another
                    category from the EXAM menu.
                </p>

            </div>


        <%
        } else {
        %>


            <table class="test-table">


                <thead>

                    <tr>

                        <th>
                            Assessment
                        </th>

                        <th>
                            Type
                        </th>

                        <th>
                            Questions
                        </th>

                        <th>
                            Marks
                        </th>

                        <th>
                            Duration
                        </th>

                        <th>
                            Closes
                        </th>

                        <th>
                            Action
                        </th>

                    </tr>

                </thead>


                <tbody>


                <%
                for (int i = 0;
                     i < listOfAllTest.size();
                     i++) {

                    Test test =
                            listOfAllTest.get(i);

                    String closeDate;

                    if (test.getclose() != null) {

                        closeDate =
                                dateFormat.format(
                                        test.getclose());

                    } else {

                        closeDate =
                                "No Close Date";
                    }

                    boolean alreadyAttempted =
                            resultDao.isTestAttempted(
                                    test.getTestId(),
                                    studentLogin);
                %>


                    <tr>


                        <!-- TEST NAME -->

                        <td class="test-name">

                            <div class="test-name-wrap">

                                <div class="test-icon">
                                    ✓
                                </div>

                                <div class="test-title">
                                    <%= test.getTestName() %>
                                </div>

                            </div>

                        </td>


                        <!-- TYPE -->

                        <td>

                            <span class="type-badge">

                                <%= test.getTestType() %>

                            </span>

                        </td>


                        <!-- QUESTIONS -->

                        <td>

                            <span class="value-box">
                                <%= test.getMaxQuestion() %>
                            </span>

                        </td>


                        <!-- MARKS -->

                        <td>

                            <span class="value-box">
                                <%= test.getMaxMarks() %>
                            </span>

                        </td>


                        <!-- DURATION -->

                        <td>

                            <span class="duration">
                                <%= test.getDuration() %> min
                            </span>

                        </td>


                        <!-- CLOSE DATE -->

                        <td>

                            <span class="close-date">

                            <%
                            if ("0001-01-01".equals(closeDate)) {
                            %>

                                No Close Date

                            <%
                            } else {
                            %>

                                <%= closeDate %>

                            <%
                            }
                            %>

                            </span>

                        </td>


                        <!-- ACTION -->

                        <td>

                            <div class="action-buttons">


                            <%
                            if (alreadyAttempted) {
                            %>


                                <!-- VIEW RESULT -->

                                <a
                                    class="action-btn result-btn"
                                    target="_blank"
                                    href="<%=request.getContextPath()%>/resultServlet?operation=viewResult&testId=<%=test.getTestId()%>">

                                    View Result

                                </a>


                                <!-- RETAKE -->

                                <a
                                    class="action-btn retake-btn"
                                    target="_blank"
                                    onclick="return confirm('Do you want to retake this assessment? Your new attempt will be saved separately.');"
                                    href="<%=request.getContextPath()%>/attemptTestServlet?operation=attemptTest&testId=<%=test.getTestId()%>">

                                    Retake

                                </a>


                            <%
                            } else {
                            %>


                                <!-- ATTEMPT -->

                                <a
                                    class="action-btn attempt-btn"
                                    target="_blank"
                                    onclick="return confirm('The assessment will start now. Are you ready?');"
                                    href="<%=request.getContextPath()%>/attemptTestServlet?operation=attemptTest&testId=<%=test.getTestId()%>">

                                    Start Assessment

                                </a>


                            <%
                            }
                            %>


                            </div>

                        </td>


                    </tr>


                <%
                }
                %>


                </tbody>

            </table>


        <%
        }
        %>


        </div>

    </div>

</div>


<jsp:include page="footer1.jsp" />


<%
} else {
%>

<jsp:forward page="index.jsp" />

<%
}
%>


</body>

</html>