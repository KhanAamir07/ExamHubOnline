<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>

<%
/* =========================================================
   ADMIN SECURITY
   ========================================================= */

Object adminSession = session.getAttribute("admin");

if (adminSession == null) {

    response.sendRedirect(
            request.getContextPath()
            + "/adminLogin.jsp");

    return;
}

List<ArrayList<Object>> resultReportList =
        (List<ArrayList<Object>>)
        request.getAttribute("resultReportList");

if (resultReportList == null) {
    resultReportList =
            new ArrayList<ArrayList<Object>>();
}

String certificateSent =
        request.getParameter("certificateSent");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ExamPortal | Student Results</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/global.css">

<link rel="preconnect"
      href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
      rel="stylesheet">


<style>

/* =========================================================
   RESET
   ========================================================= */

* {
    box-sizing: border-box;
}


/* =========================================================
   PAGE
   ========================================================= */

body {
    margin: 0;
    font-family: 'Montserrat', sans-serif;
    background: #f4f7fb;
    color: #0f172a;
}


/* =========================================================
   IMPORTANT:
   CONTENT STARTS AFTER ADMIN SIDEBAR
   ========================================================= */

.result-admin-page {

    min-height: 100vh;

    margin-left: 250px;

    padding: 30px 24px 80px;

    width: calc(100% - 250px);
}


/* =========================================================
   CONTAINER
   ========================================================= */

.result-admin-container {

    width: 100%;

    max-width: 1180px;

    margin: 0 auto;
}


/* =========================================================
   HERO
   ========================================================= */

.result-hero {

    position: relative;

    overflow: hidden;

    margin-bottom: 25px;

    padding: 38px 36px;

    border-radius: 24px;

    background:

        radial-gradient(
            circle at 90% 10%,
            rgba(96,165,250,.28),
            transparent 30%
        ),

        radial-gradient(
            circle at 10% 100%,
            rgba(59,130,246,.18),
            transparent 35%
        ),

        linear-gradient(
            135deg,
            #0f172a,
            #172554 55%,
            #1d4ed8
        );

    box-shadow:
        0 22px 55px rgba(15,23,42,.18);
}


.result-hero h1 {

    position: relative;

    z-index: 2;

    margin: 0 0 8px;

    color: #fff;

    font-size: 30px;

    font-weight: 800;
}


.result-hero p {

    position: relative;

    z-index: 2;

    margin: 0;

    color: #cbd5e1;

    font-size: 11px;
}


/* =========================================================
   SUCCESS MESSAGE
   ========================================================= */

.success-message {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 20px;

    padding: 15px 18px;

    border: 1px solid #86efac;

    border-radius: 14px;

    background: #ecfdf5;

    color: #047857;

    font-size: 11px;

    font-weight: 600;

    animation: messageIn .4s ease;
}


.success-icon {

    display: flex;

    align-items: center;

    justify-content: center;

    width: 29px;

    height: 29px;

    flex-shrink: 0;

    border-radius: 50%;

    background: #10b981;

    color: #fff;

    font-weight: 800;
}


/* =========================================================
   RESULTS CARD
   ========================================================= */

.results-card {

    overflow: hidden;

    border: 1px solid #e2e8f0;

    border-radius: 24px;

    background: #fff;

    box-shadow:
        0 15px 45px rgba(15,23,42,.07);
}


.results-card-header {

    padding: 28px;

    border-bottom: 1px solid #edf1f5;
}


.results-card-header h2 {

    margin: 0 0 6px;

    color: #0f172a;

    font-size: 20px;

    font-weight: 800;
}


.results-card-header p {

    margin: 0;

    color: #64748b;

    font-size: 10px;
}


/* =========================================================
   TABLE
   ========================================================= */

.table-wrapper {

    width: 100%;

    overflow-x: auto;
}


.results-table {

    width: 100%;

    min-width: 900px;

    border-collapse: collapse;
}


.results-table th {

    padding: 15px 12px;

    background: #f8fafc;

    border-bottom: 1px solid #e2e8f0;

    color: #475569;

    text-align: left;

    font-size: 8px;

    font-weight: 800;

    letter-spacing: .7px;

    text-transform: uppercase;
}


.results-table td {

    padding: 17px 12px;

    border-bottom: 1px solid #edf1f5;

    color: #334155;

    font-size: 10px;

    vertical-align: middle;
}


.results-table tbody tr {

    transition: .2s ease;
}


.results-table tbody tr:hover {

    background: #f8fbff;
}


/* =========================================================
   TEST TITLE
   ========================================================= */

.test-title {

    max-width: 270px;

    color: #0f172a;

    font-weight: 700;

    line-height: 1.55;
}


/* =========================================================
   STUDENT
   ========================================================= */

.student-name {

    color: #1e3a8a;

    font-weight: 700;
}


/* =========================================================
   MARKS
   ========================================================= */

.marks {

    color: #2563eb;

    font-weight: 700;
}


/* =========================================================
   GRADE
   ========================================================= */

.grade {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    width: 35px;

    height: 35px;

    border-radius: 50%;

    background: #eff6ff;

    color: #2563eb;

    font-size: 11px;

    font-weight: 800;
}


/* =========================================================
   STATUS
   ========================================================= */

.status {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 7px 11px;

    border-radius: 50px;

    font-size: 8px;

    font-weight: 800;

    text-transform: uppercase;
}


.status-pass {

    background: #ecfdf5;

    color: #059669;
}


.status-pass::before {

    content: "";

    width: 6px;

    height: 6px;

    border-radius: 50%;

    background: #10b981;
}


.status-fail {

    background: #fef2f2;

    color: #dc2626;
}


.status-fail::before {

    content: "";

    width: 6px;

    height: 6px;

    border-radius: 50%;

    background: #ef4444;
}


/* =========================================================
   SEND CERTIFICATE
   ========================================================= */

.certificate-send {

    position: relative;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 7px;

    min-height: 36px;

    padding: 0 14px;

    overflow: hidden;

    border: 0;

    border-radius: 10px;

    background:
        linear-gradient(
            135deg,
            #f59e0b,
            #d97706
        );

    color: #fff !important;

    text-decoration: none !important;

    font-size: 8px;

    font-weight: 800;

    box-shadow:
        0 8px 20px rgba(217,119,6,.22);

    transition:
        transform .25s ease,
        box-shadow .25s ease;
}


.certificate-send::before {

    content: "";

    position: absolute;

    top: 0;

    left: -70px;

    width: 45px;

    height: 100%;

    background: rgba(255,255,255,.25);

    transform: skewX(-20deg);

    transition: left .45s ease;
}


.certificate-send:hover {

    transform: translateY(-2px);

    box-shadow:
        0 12px 28px rgba(217,119,6,.30);
}


.certificate-send:hover::before {

    left: 120%;
}


/* =========================================================
   CERTIFICATE SENT
   ========================================================= */

.certificate-sent {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 8px 11px;

    border: 1px solid #a7f3d0;

    border-radius: 50px;

    background: #ecfdf5;

    color: #059669;

    font-size: 8px;

    font-weight: 800;
}


.not-available {

    color: #94a3b8;

    font-size: 8px;

    font-weight: 600;
}


/* =========================================================
   EMPTY
   ========================================================= */

.empty-results {

    padding: 75px 20px;

    text-align: center;
}


.empty-results-icon {

    display: flex;

    align-items: center;

    justify-content: center;

    width: 68px;

    height: 68px;

    margin: 0 auto 17px;

    border-radius: 20px;

    background: #eff6ff;

    color: #2563eb;

    font-size: 28px;
}


.empty-results h3 {

    margin: 0 0 8px;

    color: #0f172a;

    font-size: 18px;

    font-weight: 800;
}


.empty-results p {

    margin: 0;

    color: #64748b;

    font-size: 10px;
}


/* =========================================================
   ANIMATION
   ========================================================= */

@keyframes messageIn {

    from {

        opacity: 0;

        transform: translateY(-8px);
    }

    to {

        opacity: 1;

        transform: translateY(0);
    }
}


/* =========================================================
   FOOTER ALIGNMENT
   ========================================================= */

.examportal-footer {

    margin-left: 250px;

    width: calc(100% - 250px);
}


/* =========================================================
   RESPONSIVE
   ========================================================= */

@media (max-width: 1100px) {

    .result-admin-page {

        margin-left: 250px;

        width: calc(100% - 250px);

        padding-left: 18px;

        padding-right: 18px;
    }

    .examportal-footer {

        margin-left: 250px;

        width: calc(100% - 250px);
    }
}


@media (max-width: 700px) {

    .result-admin-page {

        margin-left: 0;

        width: 100%;

        padding: 20px 12px 60px;
    }

    .result-hero {

        padding: 30px 22px;
    }

    .result-hero h1 {

        font-size: 25px;
    }

    .results-card-header {

        padding: 23px 20px;
    }

    .examportal-footer {

        margin-left: 0;

        width: 100%;
    }
}

</style>

</head>


<body>


<!-- =========================================================
     EXISTING ADMIN SIDEBAR
     ========================================================= -->

<jsp:include page="menu.jsp" />


<!-- =========================================================
     RESULT PAGE
     ========================================================= -->

<main class="result-admin-page">

    <div class="result-admin-container">


        <!-- HERO -->

        <section class="result-hero">

            <h1>
                Student Result Report
            </h1>

            <p>
                Manage student performance and certificate availability.
            </p>

        </section>


<%

if ("1".equals(certificateSent)) {

%>

        <!-- SUCCESS MESSAGE -->

        <div class="success-message">

            <div class="success-icon">
                ✓
            </div>

            Certificate sent successfully to the student's Result page.

        </div>

<%

}

%>


        <!-- RESULTS -->

        <section class="results-card">


            <div class="results-card-header">

                <h2>
                    Examination Results
                </h2>

                <p>
                    Review scores and issue certificates to eligible students.
                </p>

            </div>


<%

if (resultReportList.isEmpty()) {

%>


            <!-- EMPTY STATE -->

            <div class="empty-results">

                <div class="empty-results-icon">
                    &#128202;
                </div>

                <h3>
                    No Results Available
                </h3>

                <p>
                    Student results will appear here after an examination is completed.
                </p>

            </div>


<%

} else {

%>


            <!-- TABLE -->

            <div class="table-wrapper">

                <table class="results-table">


                    <thead>

                        <tr>

                            <th>
                                Test Name
                            </th>

                            <th>
                                Test Type
                            </th>

                            <th>
                                Student
                            </th>

                            <th>
                                Marks
                            </th>

                            <th>
                                Obtained
                            </th>

                            <th>
                                Grade
                            </th>

                            <th>
                                Status
                            </th>

                            <th>
                                Certificate
                            </th>

                        </tr>

                    </thead>


                    <tbody>


<%

for (ArrayList<Object> record : resultReportList) {


    String testName =
            String.valueOf(record.get(0));


    String testType =
            String.valueOf(record.get(1));


    String username =
            String.valueOf(record.get(2));


    Object marks =
            record.get(3);


    Object obtained =
            record.get(4);


    char grade =
            ((Character) record.get(5))
            .charValue();


    String status =
            String.valueOf(record.get(6));


    int testId =
            ((Number) record.get(7))
            .intValue();


    int certificateState =
            ((Number) record.get(8))
            .intValue();


    boolean certificateIssued =
            certificateState != -1;


    boolean eligible =
            grade == 'A';


    String sendCertificateUrl =

            request.getContextPath()

            + "/resultServlet?operation=sendCertificate"

            + "&username="

            + java.net.URLEncoder.encode(
                    username,
                    "UTF-8")

            + "&testId="

            + testId;

%>


                        <tr>


                            <!-- TEST -->

                            <td>

                                <div class="test-title">

                                    <%=testName%>

                                </div>

                            </td>


                            <!-- TYPE -->

                            <td>

                                <%=testType%>

                            </td>


                            <!-- STUDENT -->

                            <td>

                                <span class="student-name">

                                    <%=username%>

                                </span>

                            </td>


                            <!-- MARKS -->

                            <td>

                                <%=marks%>

                            </td>


                            <!-- OBTAINED -->

                            <td>

                                <span class="marks">

                                    <%=obtained%>

                                </span>

                            </td>


                            <!-- GRADE -->

                            <td>

                                <span class="grade">

                                    <%=grade%>

                                </span>

                            </td>


                            <!-- STATUS -->

                            <td>

                                <span class="status
                                    <%= "Pass".equalsIgnoreCase(status)
                                        ? "status-pass"
                                        : "status-fail" %>">

                                    <%=status%>

                                </span>

                            </td>


                            <!-- CERTIFICATE -->

                            <td>

<%

if (certificateIssued) {

%>

                                <span class="certificate-sent">

                                    ✓ Certificate Sent

                                </span>

<%

} else if (eligible) {

%>

                                <a
                                    class="certificate-send"
                                    href="<%=sendCertificateUrl%>">

                                    ✦ Send Certificate

                                </a>

<%

} else {

%>

                                <span class="not-available">

                                    Not Available

                                </span>

<%

}

%>

                            </td>


                        </tr>


<%

}

%>


                    </tbody>

                </table>

            </div>


<%

}

%>


        </section>


    </div>

</main>


<!-- =========================================================
     FOOTER
     ========================================================= -->

<jsp:include page="footer1.jsp" />


</body>

</html>