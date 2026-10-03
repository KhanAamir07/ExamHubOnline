<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ExamPortal | Result Dashboard</title>

 <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/global.css">

<link rel="preconnect"
      href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link
 href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
 rel="stylesheet">


<style>

/* =====================================================
   BASE
===================================================== */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: #f5f7fb;
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


/* =====================================================
   HERO
===================================================== */

.result-hero {

    position: relative;
    overflow: hidden;

    display: flex;
    align-items: center;
    justify-content: space-between;

    min-height: 310px;

    padding: 42px 48px;

    border-radius: 30px;

    background:
        radial-gradient(
            circle at 90% 20%,
            rgba(96,165,250,.30),
            transparent 28%
        ),
        radial-gradient(
            circle at 10% 100%,
            rgba(59,130,246,.18),
            transparent 32%
        ),
        linear-gradient(
            135deg,
            #0f172a,
            #172554 55%,
            #1d4ed8
        );

    box-shadow:
        0 25px 65px rgba(15,23,42,.20);

    animation: slideDown .7s ease;
}

.hero-content {
    position: relative;
    z-index: 3;
    max-width: 650px;
}

.hero-badge {

    display: inline-flex;
    align-items: center;
    gap: 8px;

    padding: 8px 15px;

    margin-bottom: 17px;

    border: 1px solid rgba(255,255,255,.16);
    border-radius: 50px;

    background: rgba(255,255,255,.08);

    color: #dbeafe;

    font-size: 9px;
    font-weight: 700;

    letter-spacing: 1px;
    text-transform: uppercase;

    backdrop-filter: blur(10px);
}

.hero-badge::before {

    content: "";

    width: 7px;
    height: 7px;

    border-radius: 50%;

    background: #60a5fa;

    box-shadow:
        0 0 15px #60a5fa;
}

.hero-content h1 {

    margin: 0 0 12px;

    color: #fff;

    font-size: 37px;
    line-height: 1.15;

    font-weight: 800;
}

.hero-content p {

    margin: 0;

    color: #cbd5e1;

    font-size: 11px;
    line-height: 1.9;
}

.hero-test {

    margin-top: 18px;

    color: #bfdbfe;

    font-size: 10px;
    font-weight: 600;
}


/* =====================================================
   SCORE RING
===================================================== */

.score-ring-wrapper {

    position: relative;
    z-index: 3;

    display: flex;
    align-items: center;
    justify-content: center;

    width: 210px;
    height: 210px;

    flex-shrink: 0;

    border-radius: 50%;

    background:
        conic-gradient(
            #60a5fa
            <%=request.getAttribute("percentage")%>%,
            rgba(255,255,255,.10)
            0
        );

    box-shadow:
        0 0 45px rgba(96,165,250,.20);

    animation: scoreReveal 1.2s ease;
}

.score-ring-wrapper::before {

    content: "";

    position: absolute;

    width: 172px;
    height: 172px;

    border-radius: 50%;

    background: #111c38;

    box-shadow:
        inset 0 0 30px rgba(0,0,0,.20);
}

.score-center {

    position: relative;
    z-index: 5;

    text-align: center;
}

.score-number {

    display: block;

    color: #fff;

    font-size: 37px;
    font-weight: 800;
}

.score-label {

    color: #93c5fd;

    font-size: 9px;
    font-weight: 700;

    letter-spacing: 1px;
    text-transform: uppercase;
}


/* =====================================================
   STATUS
===================================================== */

.status-pill {

    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;

    margin-top: 18px;

    padding: 9px 17px;

    border-radius: 50px;

    font-size: 9px;
    font-weight: 800;

    text-transform: uppercase;
}

.status-pill::before {

    content: "";

    width: 7px;
    height: 7px;

    border-radius: 50%;
}

.passed {

    background: rgba(16,185,129,.15);
    color: #6ee7b7;

    border: 1px solid rgba(16,185,129,.25);
}

.passed::before {

    background: #34d399;

    box-shadow:
        0 0 10px #34d399;
}

.failed {

    background: rgba(239,68,68,.15);
    color: #fca5a5;

    border: 1px solid rgba(239,68,68,.25);
}

.failed::before {

    background: #f87171;

    box-shadow:
        0 0 10px #f87171;
}


/* =====================================================
   OVERVIEW
===================================================== */

.overview-grid {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 15px;

    margin-top: 25px;
}

.overview-card {

    padding: 21px;

    border: 1px solid #e2e8f0;

    border-radius: 18px;

    background: #fff;

    box-shadow:
        0 10px 30px rgba(15,23,42,.05);

    transition: .25s ease;

    animation: cardUp .7s ease both;
}

.overview-card:hover {

    transform: translateY(-4px);

    box-shadow:
        0 18px 38px rgba(15,23,42,.09);
}

.overview-label {

    display: block;

    margin-bottom: 9px;

    color: #64748b;

    font-size: 8px;
    font-weight: 700;

    text-transform: uppercase;

    letter-spacing: .5px;
}

.overview-value {

    color: #0f172a;

    font-size: 23px;
    font-weight: 800;
}

.overview-sub {

    margin-top: 5px;

    color: #94a3b8;

    font-size: 8px;
}


/* =====================================================
   SECTION CARD
===================================================== */

.section-card {

    margin-top: 25px;

    padding: 27px;

    border: 1px solid #e2e8f0;

    border-radius: 22px;

    background: #fff;

    box-shadow:
        0 12px 38px rgba(15,23,42,.06);

    animation: cardUp .8s ease;
}

.section-title {

    display: flex;
    align-items: center;
    justify-content: space-between;

    gap: 15px;

    margin-bottom: 24px;
}

.section-title h2 {

    margin: 0;

    color: #0f172a;

    font-size: 18px;
    font-weight: 800;
}

.section-title span {

    color: #64748b;

    font-size: 9px;
}


/* =====================================================
   PERFORMANCE GRID
===================================================== */

.performance-grid {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 15px;
}

.performance-item {

    padding: 18px;

    border-radius: 15px;

    background: #f8fafc;

    border: 1px solid #edf1f5;
}

.performance-top {

    display: flex;
    align-items: center;
    justify-content: space-between;

    margin-bottom: 11px;
}

.performance-name {

    color: #475569;

    font-size: 9px;
    font-weight: 700;
}

.performance-number {

    color: #0f172a;

    font-size: 13px;
    font-weight: 800;
}

.progress {

    height: 8px;

    overflow: hidden;

    border-radius: 50px;

    background: #e2e8f0;
}

.progress-bar {

    height: 100%;

    border-radius: 50px;

    background:
        linear-gradient(
            90deg,
            #2563eb,
            #60a5fa
        );

    width: 0;

    transition:
        width 1.2s cubic-bezier(.2,.8,.2,1);
}


/* =====================================================
   ANALYTICS GRID
===================================================== */

.analytics-grid {

    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 20px;

    margin-top: 25px;
}

.analytics-card {

    padding: 27px;

    border: 1px solid #e2e8f0;

    border-radius: 22px;

    background: #fff;

    box-shadow:
        0 12px 38px rgba(15,23,42,.06);

    animation: cardUp .9s ease;
}

.analytics-head {

    margin-bottom: 22px;
}

.analytics-head h3 {

    margin: 0 0 5px;

    color: #0f172a;

    font-size: 17px;
    font-weight: 800;
}

.analytics-head p {

    margin: 0;

    color: #64748b;

    font-size: 9px;
}


/* =====================================================
   METRIC
===================================================== */

.metric-row {

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 15px 0;

    border-bottom: 1px solid #edf1f5;
}

.metric-row:last-child {
    border-bottom: none;
}

.metric-name {

    color: #64748b;

    font-size: 9px;
    font-weight: 600;
}

.metric-value {

    color: #0f172a;

    font-size: 15px;
    font-weight: 800;
}


/* =====================================================
   INSIGHT
===================================================== */

.insight {

    position: relative;

    margin-top: 25px;

    padding: 25px 27px;

    overflow: hidden;

    border-radius: 22px;

    background:
        linear-gradient(
            135deg,
            #eff6ff,
            #f8fafc
        );

    border: 1px solid #dbeafe;
}

.insight::after {

    content: "";

    position: absolute;

    width: 160px;
    height: 160px;

    right: -80px;
    top: -80px;

    border-radius: 50%;

    background: rgba(37,99,235,.06);
}

.insight h3 {

    margin: 0 0 8px;

    color: #1e3a8a;

    font-size: 15px;
    font-weight: 800;
}

.insight p {

    position: relative;
    z-index: 2;

    margin: 0;

    color: #475569;

    font-size: 10px;

    line-height: 1.9;
}


/* =====================================================
   ACTIONS
===================================================== */

.actions {

    display: flex;
    flex-wrap: wrap;

    gap: 12px;

    margin-top: 25px;
}

.action-btn {

    display: inline-flex;

    align-items: center;
    justify-content: center;

    min-height: 46px;

    padding: 0 20px;

    border-radius: 12px;

    text-decoration: none !important;

    font-family:
        'Montserrat',
        sans-serif;

    font-size: 9px;
    font-weight: 800;

    transition: .25s ease;
}

.action-btn:hover {

    transform: translateY(-3px);
}

.retake {

    color: #fff !important;

    background: #2563eb;

    box-shadow:
        0 9px 22px rgba(37,99,235,.20);
}

.retake:hover {
    background: #1d4ed8;
}

.practice {

    color: #2563eb !important;

    background: #eff6ff;

    border: 1px solid #dbeafe;
}

.help {

    color: #334155 !important;

    background: #fff;

    border: 1px solid #e2e8f0;
}


/* =====================================================
   HELP PANEL
===================================================== */

.help-panel {

    display: none;

    margin-top: 18px;

    padding: 22px;

    border-radius: 17px;

    background: #f8fafc;

    border: 1px solid #e2e8f0;

    animation: helpOpen .35s ease;
}

.help-panel.show {
    display: block;
}

.help-panel h4 {

    margin: 0 0 9px;

    color: #0f172a;

    font-size: 13px;
    font-weight: 800;
}

.help-panel p {

    margin: 0;

    color: #64748b;

    font-size: 10px;

    line-height: 1.8;
}


/* =====================================================
   ANIMATION
===================================================== */

@keyframes slideDown {

    from {
        opacity: 0;
        transform: translateY(-20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes cardUp {

    from {
        opacity: 0;
        transform: translateY(20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes scoreReveal {

    from {
        opacity: 0;
        transform: scale(.75) rotate(-30deg);
    }

    to {
        opacity: 1;
        transform: scale(1) rotate(0);
    }
}

@keyframes helpOpen {

    from {
        opacity: 0;
        transform: translateY(-7px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width:950px) {

    .result-hero {
        flex-direction: column;
        align-items: flex-start;
        gap: 30px;
    }

    .score-ring-wrapper {
        align-self: center;
    }

    .overview-grid {
        grid-template-columns:
            repeat(2,1fr);
    }

    .performance-grid {
        grid-template-columns:
            repeat(2,1fr);
    }
}


@media(max-width:650px) {

    .result-page {
        padding:
            95px 12px 65px;
    }

    .result-hero {
        padding: 30px 23px;
    }

    .hero-content h1 {
        font-size: 28px;
    }

    .score-ring-wrapper {
        width: 180px;
        height: 180px;
    }

    .score-ring-wrapper::before {
        width: 146px;
        height: 146px;
    }

    .score-number {
        font-size: 31px;
    }

    .overview-grid,
    .performance-grid,
    .analytics-grid {
        grid-template-columns: 1fr;
    }

    .section-card,
    .analytics-card {
        padding: 20px;
    }

    .actions {
        flex-direction: column;
    }

    .action-btn {
        width: 100%;
    }
}

</style>

</head>


<body>


<jsp:include page="menu1.jsp" />


<%

String studentLogin =
        (String) session.getAttribute("studentLogin");

Result resultToView =
        (Result) request.getAttribute("resultToView");

Test test =
        (Test) request.getAttribute("test");


Integer percentageObj =
        (Integer) request.getAttribute("percentage");

int percentage =
        percentageObj != null
        ? percentageObj
        : 0;


String resultStatus =
        (String) request.getAttribute("resultStatus");

Character gradeObj =
        (Character) request.getAttribute("grade");

char grade =
        gradeObj != null
        ? gradeObj
        : 'D';


Double rankObj =
        (Double) request.getAttribute("rank");

double rank =
        rankObj != null
        ? rankObj
        : 0;


Double percentileObj =
        (Double) request.getAttribute("percentile");

double percentile =
        percentileObj != null
        ? percentileObj
        : 0;


Double accuracyObj =
        (Double) request.getAttribute("accuracy");

double accuracy =
        accuracyObj != null
        ? accuracyObj
        : 0;


Integer wrongObj =
        (Integer) request.getAttribute("wrong");

int wrong =
        wrongObj != null
        ? wrongObj
        : 0;


Integer unattemptedObj =
        (Integer) request.getAttribute("unattempted");

int unattempted =
        unattemptedObj != null
        ? unattemptedObj
        : 0;


double attempted =
        resultToView != null
        ? resultToView.getAttempted()
        : 0;


int correct =
        resultToView != null
        ? resultToView.getCorrect()
        : 0;


int maxQuestions =
        resultToView != null
        ? resultToView.getMaxQuestions()
        : 0;


int maxMarks =
        resultToView != null
        ? resultToView.getMaxMarks()
        : 0;


int obtained =
        resultToView != null
        ? resultToView.getObtained()
        : 0;


%>


<main class="result-page">


<div class="result-container">


<!-- =================================================
     HERO
================================================= -->

<section class="result-hero">


<div class="hero-content">


<span class="hero-badge">
    Examination Completed
</span>


<h1>
    Your Result is Ready
</h1>


<p>
    Review your performance, understand your strengths,
    identify areas for improvement and continue practicing.
</p>


<%

if (test != null) {

%>

<div class="hero-test">
    <%=test.getTestName()%>
    &nbsp; • &nbsp;
    <%=test.getTestType()%>
</div>

<%

}

%>


<div class="status-pill
    <%=resultStatus != null
        && resultStatus.equalsIgnoreCase("Passed")
        ? "passed"
        : "failed"%>">

    <%=resultStatus != null
        ? resultStatus
        : "Completed"%>

</div>


</div>


<!-- SCORE -->

<div class="score-ring-wrapper"
     style="
     background:
     conic-gradient(
         #60a5fa <%=percentage%>%,
         rgba(255,255,255,.10) 0
     );">


<div class="score-center">

    <span class="score-number">
        <%=percentage%>%
    </span>

    <span class="score-label">
        Overall Score
    </span>

</div>


</div>


</section>



<!-- =================================================
     QUICK OVERVIEW
================================================= -->

<section class="overview-grid">


<div class="overview-card">

    <span class="overview-label">
        Score
    </span>

    <div class="overview-value">
        <%=obtained%>/<%=maxMarks%>
    </div>

    <div class="overview-sub">
        Marks obtained
    </div>

</div>


<div class="overview-card">

    <span class="overview-label">
        Grade
    </span>

    <div class="overview-value">
        <%=grade%>
    </div>

    <div class="overview-sub">
        Performance grade
    </div>

</div>


<div class="overview-card">

    <span class="overview-label">
        Rank
    </span>

    <div class="overview-value">
        #<%=String.format("%.0f", rank)%>
    </div>

    <div class="overview-sub">
        In this test
    </div>

</div>


<div class="overview-card">

    <span class="overview-label">
        Percentile
    </span>

    <div class="overview-value">
        <%=String.format("%.1f", percentile)%>%
    </div>

    <div class="overview-sub">
        Relative performance
    </div>

</div>


</section>



<!-- =================================================
     QUESTION PERFORMANCE
================================================= -->

<section class="section-card">


<div class="section-title">

    <h2>
        Question Performance
    </h2>

    <span>
        Based on your actual attempt
    </span>

</div>


<div class="performance-grid">


<div class="performance-item">

    <div class="performance-top">

        <span class="performance-name">
            Attempted
        </span>

        <span class="performance-number">
            <%=resultToView.getAttempted()%>
        </span>

    </div>

    <div class="progress">

        <div
            class="progress-bar"
            data-width="<%=maxQuestions > 0
                ? (resultToView.getAttempted()*100/maxQuestions)
                : 0%>">
        </div>

    </div>

</div>


<div class="performance-item">

    <div class="performance-top">

        <span class="performance-name">
            Correct
        </span>

        <span class="performance-number">
            <%=correct%>
        </span>

    </div>

    <div class="progress">

        <div
            class="progress-bar"
            data-width="<%=maxQuestions > 0
                ? (correct*100/maxQuestions)
                : 0%>">
        </div>

    </div>

</div>


<div class="performance-item">

    <div class="performance-top">

        <span class="performance-name">
            Wrong
        </span>

        <span class="performance-number">
            <%=wrong%>
        </span>

    </div>

    <div class="progress">

        <div
            class="progress-bar"
            data-width="<%=maxQuestions > 0
                ? (wrong*100/maxQuestions)
                : 0%>">
        </div>

    </div>

</div>


<div class="performance-item">

    <div class="performance-top">

        <span class="performance-name">
            Unattempted
        </span>

        <span class="performance-number">
            <%=unattempted%>
        </span>

    </div>

    <div class="progress">

        <div
            class="progress-bar"
            data-width="<%=maxQuestions > 0
                ? (unattempted*100/maxQuestions)
                : 0%>">
        </div>

    </div>

</div>


</div>


</section>



<!-- =================================================
     ANALYTICS
================================================= -->

<div class="analytics-grid">


<!-- ACCURACY -->

<section class="analytics-card">


<div class="analytics-head">

    <h3>
        Accuracy & Efficiency
    </h3>

    <p>
        How accurately you answered attempted questions
    </p>

</div>


<div class="metric-row">

    <span class="metric-name">
        Accuracy
    </span>

    <span class="metric-value">
        <%=String.format("%.1f", accuracy)%>%
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Correct Answers
    </span>

    <span class="metric-value">
        <%=correct%>
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Incorrect Answers
    </span>

    <span class="metric-value">
        <%=wrong%>
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Unattempted
    </span>

    <span class="metric-value">
        <%=unattempted%>
    </span>

</div>


</section>



<!-- RANK -->

<section class="analytics-card">


<div class="analytics-head">

    <h3>
        Performance Position
    </h3>

    <p>
        Your position among recorded attempts
    </p>

</div>


<div class="metric-row">

    <span class="metric-name">
        Rank
    </span>

    <span class="metric-value">
        #<%=String.format("%.0f", rank)%>
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Percentile
    </span>

    <span class="metric-value">
        <%=String.format("%.1f", percentile)%>%
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Maximum Marks
    </span>

    <span class="metric-value">
        <%=maxMarks%>
    </span>

</div>


<div class="metric-row">

    <span class="metric-name">
        Total Questions
    </span>

    <span class="metric-value">
        <%=maxQuestions%>
    </span>

</div>


</section>


</div>



<!-- =================================================
     SMART INSIGHT
================================================= -->

<section class="insight">


<h3>

<%

if (percentage >= 75) {

%>

Excellent Performance

<%

} else if (percentage >= 60) {

%>

Good Progress

<%

} else {

%>

Improvement Opportunity

<%

}

%>

</h3>


<p>

<%

if (percentage >= 75) {

%>

You achieved a strong score in this test.
Continue practicing to maintain your performance
and improve your accuracy even further.

<%

} else if (percentage >= 60) {

%>

You have successfully completed the test.
Review the questions you found difficult and
practice again to move toward a higher score.

<%

} else {

%>

Use this attempt as a learning opportunity.
Review the topic, practice more questions and
retake the test when you are ready.

<%

}

%>

</p>


</section>



<!-- =================================================
     ACTIONS
================================================= -->

<div class="actions">


<a
 class="action-btn retake"
 href="${pageContext.request.contextPath}/attemptTestServlet?operation=attemptTest&testId=<%=resultToView.getTestId()%>">

    ↻ &nbsp; Retake Test

</a>


<a
 class="action-btn practice"
 href="${pageContext.request.contextPath}/studentHome.jsp">

    ✦ &nbsp; Practice Again

</a>


<a
 class="action-btn help"
 href="javascript:void(0)"
 onclick="toggleHelp()">

    ? &nbsp; Help & Improve

</a>


</div>



<!-- =================================================
     HELP
================================================= -->

<div
 id="helpPanel"
 class="help-panel">


<h4>
    How can you improve?
</h4>


<p>

<%

if (wrong > 0) {

%>

You have <strong><%=wrong%></strong> incorrect answer<%=wrong == 1 ? "" : "s"%>.
Review those concepts and attempt similar questions again.

<%

} else if (unattempted > 0) {

%>

You have <strong><%=unattempted%></strong>
unattempted question<%=unattempted == 1 ? "" : "s"%>.
Work on time management and try to attempt more questions.

<%

} else {

%>

You attempted every question. Focus on improving
accuracy and reducing incorrect answers in your next attempt.

<%

}

%>

</p>


</div>


</div>

</main>


<jsp:include page="footer1.jsp" />


<script>

/* =====================================================
   PROGRESS ANIMATION
===================================================== */

window.addEventListener("load", function() {

    var bars =
        document.querySelectorAll(".progress-bar");

    bars.forEach(function(bar) {

        var width =
            bar.getAttribute("data-width");

        setTimeout(function() {

            bar.style.width =
                width + "%";

        }, 300);

    });

});


/* =====================================================
   HELP
===================================================== */

function toggleHelp() {

    var panel =
        document.getElementById("helpPanel");

    panel.classList.toggle("show");

}

</script>


</body>

</html>