<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>

<%
/* =========================================================
   STUDENT AUTHENTICATION
   ========================================================= */

String studentUsername =
        (String) session.getAttribute("studentLogin");

if (studentUsername == null) {

    response.sendRedirect(
            request.getContextPath()
            + "/studentLogin.jsp");

    return;
}

ResultDaoImpl resultDao =
        new ResultDaoImpl();

TestDaoImpl testDao =
        new TestDaoImpl();

List<Result> allResults =
        resultDao.viewAllResults();

List<Result> studentResults =
        new ArrayList<Result>();

for (Result res : allResults) {

    if (studentUsername.equalsIgnoreCase(
            res.getStudUsername())) {

        studentResults.add(res);
    }
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ExamPortal | My Results</title>

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

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: #f4f7fb;
    color: #172033;
    font-family: 'Montserrat', sans-serif;
}

.result-page {
    min-height: 100vh;
    padding: 115px 20px 90px;
}

.result-container {
    width: 100%;
    max-width: 1180px;
    margin: auto;
}

.result-hero {
    position: relative;
    overflow: hidden;
    min-height: 245px;
    padding: 45px;
    margin-bottom: 30px;
    border-radius: 28px;

    background:
        radial-gradient(
            circle at 85% 20%,
            rgba(96,165,250,.25),
            transparent 30%
        ),
        radial-gradient(
            circle at 10% 100%,
            rgba(59,130,246,.20),
            transparent 35%
        ),
        linear-gradient(
            135deg,
            #0f172a,
            #172554 55%,
            #1d4ed8
        );

    box-shadow:
        0 25px 60px rgba(15,23,42,.18);
}

.result-hero h1 {
    margin: 0 0 12px;
    color: #fff;
    font-size: 36px;
    font-weight: 800;
}

.result-hero p {
    max-width: 700px;
    margin: 0;
    color: #cbd5e1;
    font-size: 12px;
    line-height: 1.9;
}

.result-badge {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 8px 15px;
    margin-bottom: 16px;
    border: 1px solid rgba(255,255,255,.15);
    border-radius: 50px;
    background: rgba(255,255,255,.08);
    color: #dbeafe;
    font-size: 9px;
    font-weight: 700;
    letter-spacing: 1.2px;
    text-transform: uppercase;
}

.result-badge::before {
    content: "";
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: #60a5fa;
    box-shadow: 0 0 12px #60a5fa;
}

.results-card {
    overflow: hidden;
    border: 1px solid #e2e8f0;
    border-radius: 25px;
    background: #fff;
    box-shadow:
        0 15px 45px rgba(15,23,42,.07);
}

.results-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    padding: 28px 32px;
    border-bottom: 1px solid #edf1f5;
}

.results-header h2 {
    margin: 0 0 6px;
    color: #0f172a;
    font-size: 20px;
    font-weight: 800;
}

.results-header p {
    margin: 0;
    color: #64748b;
    font-size: 10px;
}

.student-badge {
    padding: 10px 17px;
    border: 1px solid #dbeafe;
    border-radius: 50px;
    background: #eff6ff;
    color: #2563eb;
    font-size: 10px;
    font-weight: 700;
}

.results-body {
    padding: 28px;
}

.result-item {
    position: relative;
    overflow: hidden;
    margin-bottom: 25px;
    padding: 25px;
    border: 1px solid #e2e8f0;
    border-radius: 20px;
    background: linear-gradient(
        145deg,
        #ffffff,
        #f8fafc
    );
    transition:
        transform .3s ease,
        box-shadow .3s ease,
        border-color .3s ease;
}

.result-item:hover {
    transform: translateY(-4px);
    border-color: #bfdbfe;
    box-shadow:
        0 18px 40px rgba(37,99,235,.10);
}

.test-info {
    position: relative;
    z-index: 2;
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 20px;
    margin-bottom: 23px;
}

.test-name {
    margin: 0 0 8px;
    color: #0f172a;
    font-size: 18px;
    font-weight: 800;
}

.test-type {
    color: #64748b;
    font-size: 10px;
}

.status {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 7px;
    min-width: 95px;
    padding: 9px 15px;
    border-radius: 50px;
    font-size: 9px;
    font-weight: 800;
    text-transform: uppercase;
}

.status::before {
    content: "";
    width: 6px;
    height: 6px;
    border-radius: 50%;
}

.status-pass {
    background: #ecfdf5;
    color: #059669;
}

.status-pass::before {
    background: #10b981;
}

.status-fail {
    background: #fef2f2;
    color: #dc2626;
}

.status-fail::before {
    background: #ef4444;
}

.result-stats {
    position: relative;
    z-index: 2;
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 12px;
}

.stat-box {
    min-height: 92px;
    padding: 16px;
    border: 1px solid #e9eef5;
    border-radius: 14px;
    background: rgba(248,250,252,.8);
}

.stat-label {
    display: block;
    margin-bottom: 10px;
    color: #64748b;
    font-size: 8px;
    font-weight: 700;
    letter-spacing: .5px;
    text-transform: uppercase;
}

.stat-value {
    color: #0f172a;
    font-size: 19px;
    font-weight: 800;
}

.score-section {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-top: 23px;
    padding-top: 22px;
    border-top: 1px solid #edf1f5;
}

.score-bar {
    flex: 1;
    height: 9px;
    overflow: hidden;
    border-radius: 50px;
    background: #e2e8f0;
}

.score-progress {
    height: 100%;
    border-radius: 50px;
    background: linear-gradient(
        90deg,
        #2563eb,
        #60a5fa
    );
    transition: width 1.2s ease;
}

.percentage {
    min-width: 65px;
    color: #2563eb;
    font-size: 17px;
    font-weight: 800;
    text-align: right;
}

.result-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 11px;
    margin-top: 22px;
}

.result-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    min-height: 43px;
    padding: 0 17px;
    border-radius: 11px;
    text-decoration: none !important;
    font-family: 'Montserrat', sans-serif;
    font-size: 9px;
    font-weight: 800;
    cursor: pointer;
    transition:
        transform .25s ease,
        box-shadow .25s ease;
}

.result-btn:hover {
    transform: translateY(-2px);
}

.retake-btn {
    border: 1px solid #2563eb;
    background: #2563eb;
    color: #fff !important;
}

.practice-btn {
    border: 1px solid #dbeafe;
    background: #eff6ff;
    color: #2563eb !important;
}

.help-btn {
    border: 1px solid #e2e8f0;
    background: #fff;
    color: #334155 !important;
}

.certificate-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 9px;
    min-height: 43px;
    padding: 0 18px;
    border: 1px solid #f59e0b;
    border-radius: 11px;
    background: linear-gradient(
        135deg,
        #f59e0b,
        #d97706
    );
    color: #fff !important;
    text-decoration: none !important;
    font-size: 9px;
    font-weight: 800;
    box-shadow:
        0 8px 20px rgba(217,119,6,.20);
    transition:
        transform .25s ease,
        box-shadow .25s ease;
}

.certificate-btn:hover {
    transform: translateY(-2px);
    box-shadow:
        0 12px 28px rgba(217,119,6,.30);
}

.certificate-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 21px;
    height: 21px;
    border-radius: 6px;
    background: rgba(255,255,255,.18);
}

.certificate-waiting {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    min-height: 43px;
    padding: 0 16px;
    border: 1px dashed #cbd5e1;
    border-radius: 11px;
    background: #f8fafc;
    color: #94a3b8;
    font-size: 9px;
    font-weight: 700;
}

.certificate-available {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-top: 18px;
    padding: 14px 16px;
    border: 1px solid #fde68a;
    border-radius: 13px;
    background: linear-gradient(
        135deg,
        #fffbeb,
        #fff7ed
    );
}

.certificate-available-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 38px;
    height: 38px;
    flex-shrink: 0;
    border-radius: 11px;
    background: #f59e0b;
    color: #fff;
    font-size: 16px;
}

.certificate-available-title {
    margin: 0 0 3px;
    color: #92400e;
    font-size: 10px;
    font-weight: 800;
}

.certificate-available-text {
    margin: 0;
    color: #a16207;
    font-size: 8px;
    line-height: 1.6;
}

.help-box {
    display: none;
    margin-top: 18px;
    padding: 20px;
    border: 1px solid #dbeafe;
    border-radius: 15px;
    background: linear-gradient(
        135deg,
        #eff6ff,
        #f8fafc
    );
}

.help-box.show {
    display: block;
}

.help-title {
    margin-bottom: 10px;
    color: #1e3a8a;
    font-size: 12px;
    font-weight: 800;
}

.help-box p,
.help-list {
    color: #475569;
    font-size: 10px;
    line-height: 1.8;
}

.help-list {
    margin-top: 10px;
}

.empty-result {
    padding: 75px 25px;
    text-align: center;
}

.empty-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 76px;
    height: 76px;
    margin: 0 auto 20px;
    border-radius: 22px;
    background: #eff6ff;
    color: #2563eb;
    font-size: 31px;
}

.empty-result h3 {
    margin: 0 0 8px;
    font-size: 19px;
}

.empty-result p {
    margin: 0;
    color: #64748b;
    font-size: 11px;
}

@media (max-width: 900px) {

    .result-stats {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 650px) {

    .result-page {
        padding: 95px 12px 65px;
    }

    .result-hero {
        padding: 32px 24px;
    }

    .result-hero h1 {
        font-size: 27px;
    }

    .results-header {
        align-items: flex-start;
        flex-direction: column;
        padding: 24px;
    }

    .results-body {
        padding: 15px;
    }

    .result-item {
        padding: 18px;
    }

    .test-info {
        flex-direction: column;
    }

    .result-stats {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 420px) {

    .result-stats {
        grid-template-columns: 1fr;
    }

    .result-actions {
        flex-direction: column;
    }

    .result-btn,
    .certificate-btn,
    .certificate-waiting {
        width: 100%;
    }

    .certificate-available {
        align-items: flex-start;
    }

    .result-hero h1 {
        font-size: 24px;
    }
}

</style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<main class="result-page">

<div class="result-container">

<section class="result-hero">

    <span class="result-badge">
        Performance Dashboard
    </span>

    <h1>
        My Examination Results
    </h1>

    <p>
        Track your scores, review your performance and
        access certificates issued by ExamPortal.
    </p>

</section>

<section class="results-card">

<div class="results-header">

    <div>

        <h2>
            Examination History
        </h2>

        <p>
            Your completed tests, performance and certificates
        </p>

    </div>

    <span class="student-badge">
        <%=studentUsername%>
    </span>

</div>

<div class="results-body">

<%
if (studentResults.isEmpty()) {
%>

<div class="empty-result">

    <div class="empty-icon">
        &#128202;
    </div>

    <h3>
        No Results Available
    </h3>

    <p>
        Complete an examination to see your performance here.
    </p>

</div>

<%
} else {

int resultCounter = 0;

for (Result res : studentResults) {

    resultCounter++;

    Test test =
            testDao.viewTest(
                    res.getTestId());

    String testName =
            "Examination";

    String testType =
            "Test";

    if (test != null) {

        if (test.getTestName() != null) {
            testName =
                    test.getTestName();
        }

        if (test.getTestType() != null) {
            testType =
                    test.getTestType();
        }
    }

    int percentage = 0;

    if (res.getMaxMarks() > 0) {

        percentage =
                (res.getObtained() * 100)
                / res.getMaxMarks();
    }

    boolean passed =
            percentage >= 60;

    boolean certificateSent =
            res.getView() != -1;

    String certificateUrl =
            request.getContextPath()
            + "/resultServlet?operation=certificate"
            + "&username="
            + java.net.URLEncoder.encode(
                    studentUsername,
                    "UTF-8")
            + "&testId="
            + res.getTestId();
%>

<article class="result-item">

<div class="test-info">

    <div>

        <h3 class="test-name">
            <%=testName%>
        </h3>

        <div class="test-type">

            <%=testType%>
            &nbsp; • &nbsp;
            Test ID:
            <%=res.getTestId()%>

        </div>

    </div>

    <span class="status
        <%=passed
            ? "status-pass"
            : "status-fail"%>">

        <%=passed
            ? "Passed"
            : "Failed"%>

    </span>

</div>

<div class="result-stats">

    <div class="stat-box">

        <span class="stat-label">
            Total Questions
        </span>

        <span class="stat-value">
            <%=res.getMaxQuestions()%>
        </span>

    </div>

    <div class="stat-box">

        <span class="stat-label">
            Attempted
        </span>

        <span class="stat-value">
            <%=res.getAttempted()%>
        </span>

    </div>

    <div class="stat-box">

        <span class="stat-label">
            Correct
        </span>

        <span class="stat-value">
            <%=res.getCorrect()%>
        </span>

    </div>

    <div class="stat-box">

        <span class="stat-label">
            Score
        </span>

        <span class="stat-value">
            <%=res.getObtained()%>
            /
            <%=res.getMaxMarks()%>
        </span>

    </div>

    <div class="stat-box">

        <span class="stat-label">
            Percentage
        </span>

        <span class="stat-value">
            <%=percentage%>%
        </span>

    </div>

</div>

<div class="score-section">

    <div class="score-bar">

        <div
            class="score-progress"
            style="width:<%=percentage%>%;">
        </div>

    </div>

    <div class="percentage">
        <%=percentage%>%
    </div>

</div>

<div class="result-actions">

    <a
        class="result-btn retake-btn"
        href="${pageContext.request.contextPath}/attemptTestServlet?operation=attemptTest&testId=<%=res.getTestId()%>">

        ↻ Retake Test

    </a>

    <a
        class="result-btn practice-btn"
        href="${pageContext.request.contextPath}/studentHome.jsp">

        ✦ Practice Again

    </a>

    <button
        type="button"
        class="result-btn help-btn"
        onclick="toggleHelp(<%=resultCounter%>)">

        ? Help & Improve

    </button>

<%
if (certificateSent) {
%>

    <a
        class="certificate-btn"
        href="<%=certificateUrl%>">

        <span class="certificate-icon">
            ✦
        </span>

        View Certificate

    </a>

<%
} else {
%>

    <span class="certificate-waiting">

        ⏳ Awaiting Certificate

    </span>

<%
}
%>

</div>

<%
if (certificateSent) {
%>

<div class="certificate-available">

    <div class="certificate-available-icon">
        ✦
    </div>

    <div>

        <p class="certificate-available-title">
            Certificate Available
        </p>

        <p class="certificate-available-text">
            Your certificate has been issued by ExamPortal.
            Open it to view the certificate and use the
            Print / Save PDF option.
        </p>

    </div>

</div>

<%
}
%>

<div
    class="help-box"
    id="helpBox<%=resultCounter%>">

    <div class="help-title">
        ? &nbsp; Help & Improve
    </div>

<%
if (passed) {
%>

    <p>
        You successfully completed this examination.
        Continue practicing to improve your performance.
    </p>

    <ul class="help-list">

        <li>
            Review difficult questions.
        </li>

        <li>
            Practice the same subject again.
        </li>

        <li>
            Retake the assessment for improvement.
        </li>

    </ul>

<%
} else {
%>

    <p>
        Use this result to identify the topics that
        need more preparation.
    </p>

    <ul class="help-list">

        <li>
            Review the concepts covered in the test.
        </li>

        <li>
            Practice more questions.
        </li>

        <li>
            Retake the test after preparation.
        </li>

    </ul>

<%
}
%>

</div>

</article>

<%
}
}
%>

</div>

</section>

</div>

</main>

<jsp:include page="footer1.jsp" />

<script>

function toggleHelp(id) {

    var box =
        document.getElementById(
            "helpBox" + id
        );

    if (!box) {
        return;
    }

    box.classList.toggle("show");
}

window.addEventListener(
    "load",
    function() {

        var bars =
            document.querySelectorAll(
                ".score-progress"
            );

        bars.forEach(
            function(bar) {

                var width =
                    bar.style.width;

                bar.style.width =
                    "0%";

                setTimeout(
                    function() {

                        bar.style.width =
                            width;

                    },
                    250
                );
            }
        );
    }
);

</script>

</body>

</html>