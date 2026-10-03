<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.examhub.pojo.*"%>

<%
/* =========================================================
   STUDENT SECURITY
   ========================================================= */

String studentUsername =
        (String) session.getAttribute("studentLogin");

if (studentUsername == null) {

    response.sendRedirect(
        request.getContextPath() + "/studentLogin.jsp"
    );

    return;
}


/* =========================================================
   CERTIFICATE DATA
   ========================================================= */

Student student =
        (Student) request.getAttribute("student");

Result result =
        (Result) request.getAttribute("result");

Test test =
        (Test) request.getAttribute("test");

Exam exam =
        (Exam) request.getAttribute("exam");

String certificateId =
        (String) request.getAttribute("certificateId");

String issueDate =
        (String) request.getAttribute("issueDate");

Object percentageObject =
        request.getAttribute("percentage");

Object gradeObject =
        request.getAttribute("grade");

Object statusObject =
        request.getAttribute("status");


/* =========================================================
   VALIDATION
   ========================================================= */

if (student == null ||
    result == null ||
    test == null ||
    certificateId == null) {
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>ExamPortal | Certificate</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;

    display: flex;
    align-items: center;
    justify-content: center;

    padding: 25px;

    background:
        radial-gradient(
            circle at 10% 10%,
            #dbeafe,
            transparent 30%
        ),
        radial-gradient(
            circle at 90% 90%,
            #fef3c7,
            transparent 30%
        ),
        #f1f5f9;

    font-family:
        Arial,
        sans-serif;
}

.error-card {
    width: 100%;
    max-width: 500px;

    padding: 50px 35px;

    text-align: center;

    border: 1px solid #e2e8f0;
    border-radius: 25px;

    background: #fff;

    box-shadow:
        0 30px 80px
        rgba(15,23,42,.15);
}

.error-card h1 {
    color: #0f172a;
}

.error-card p {
    color: #64748b;
}

.error-card a {
    display: inline-flex;

    margin-top: 20px;
    padding: 13px 20px;

    border-radius: 10px;

    background: #2563eb;
    color: #fff;

    text-decoration: none;
}

</style>

</head>

<body>

<div class="error-card">

    <div style="font-size:45px;">
        ⚠
    </div>

    <h1>
        Certificate Unavailable
    </h1>

    <p>
        This certificate has not been issued or could not be loaded.
    </p>

    <a href="${pageContext.request.contextPath}/studentResult.jsp">
        Back to My Results
    </a>

</div>

</body>

</html>

<%
return;
}


/* =========================================================
   SAFE VALUES
   ========================================================= */

double percentage =
        percentageObject instanceof Number
        ? ((Number) percentageObject).doubleValue()
        : 0;

String grade =
        gradeObject != null
        ? String.valueOf(gradeObject)
        : "A";

String status =
        statusObject != null
        ? String.valueOf(statusObject)
        : "Passed";

String studentName =
        student.getName() != null &&
        !student.getName().trim().isEmpty()
        ? student.getName().trim()
        : studentUsername;

String testName =
        test.getTestName() != null &&
        !test.getTestName().trim().isEmpty()
        ? test.getTestName().trim()
        : "Assessment";

String examName =
        exam != null &&
        exam.getExamName() != null &&
        !exam.getExamName().trim().isEmpty()
        ? exam.getExamName().trim()
        : "Examination";

String percentageText =
        String.format("%.0f", percentage);

%>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    ExamPortal | Certificate of Achievement
</title>


<link rel="preconnect"
      href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&family=Playfair+Display:wght@500;600;700&family=Allura&display=swap"
      rel="stylesheet">


<style>

/* =========================================================
   GLOBAL
   ========================================================= */

* {
    box-sizing: border-box;
}

html,
body {
    margin: 0;
    min-height: 100%;
}

body {

    color: #172033;

    font-family:
        'Montserrat',
        sans-serif;

    background:

        radial-gradient(
            circle at 5% 5%,
            rgba(37,99,235,.14),
            transparent 25%
        ),

        radial-gradient(
            circle at 95% 95%,
            rgba(212,175,55,.16),
            transparent 28%
        ),

        linear-gradient(
            135deg,
            #eef2f7,
            #f8fafc
        );

}


/* =========================================================
   TOP APPLICATION BAR
   ========================================================= */

.topbar {

    position: sticky;

    top: 0;

    z-index: 9999;

    height: 72px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 30px;

    background:
        rgba(10,18,35,.97);

    border-bottom:
        1px solid
        rgba(255,255,255,.08);

    box-shadow:
        0 15px 40px
        rgba(15,23,42,.18);

    backdrop-filter:
        blur(18px);

}


.brand-wrapper {

    display: flex;

    align-items: center;

    gap: 12px;

}


.brand-logo {

    position: relative;

    width: 39px;

    height: 39px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 11px;

    background:

        linear-gradient(
            145deg,
            #3b82f6,
            #1d4ed8
        );

    color: #fff;

    font-size: 14px;

    font-weight: 800;

    letter-spacing: -.5px;

    box-shadow:
        0 7px 22px
        rgba(37,99,235,.35);

}


.brand-logo::after {

    content: "";

    position: absolute;

    inset: -4px;

    border:
        1px solid
        rgba(212,175,55,.6);

    border-radius: 14px;

}


.brand-text {

    color: #fff;

    font-size: 14px;

    font-weight: 800;

    letter-spacing: 2px;

}


.brand-subtitle {

    margin-top: 2px;

    color: #94a3b8;

    font-size: 6px;

    font-weight: 600;

    letter-spacing: 1.5px;

    text-transform: uppercase;

}


.toolbar-actions {

    display: flex;

    align-items: center;

    gap: 9px;

}


.toolbar-button {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 7px;

    min-height: 39px;

    padding: 0 15px;

    border:
        1px solid
        rgba(255,255,255,.14);

    border-radius: 9px;

    background:
        rgba(255,255,255,.07);

    color: #fff;

    text-decoration: none;

    font-family:
        'Montserrat',
        sans-serif;

    font-size: 8px;

    font-weight: 700;

    cursor: pointer;

    transition: .25s ease;

}


.toolbar-button:hover {

    transform:
        translateY(-2px);

    background:
        rgba(255,255,255,.13);

}


.toolbar-button.primary {

    border-color: #2563eb;

    background:
        linear-gradient(
            135deg,
            #2563eb,
            #1d4ed8
        );

    box-shadow:
        0 7px 22px
        rgba(37,99,235,.27);

}


/* =========================================================
   MAIN PAGE
   ========================================================= */

.page {

    padding:
        48px
        20px
        80px;

}


/* =========================================================
   PREMIUM CERTIFICATE
   ========================================================= */

.certificate {

    position: relative;

    width: 100%;

    max-width: 1180px;

    min-height: 790px;

    margin: auto;

    padding: 11px;

    background:

        linear-gradient(
            135deg,
            #9f761b,
            #e6c75d 12%,
            #fff2a9 25%,
            #b88a22 45%,
            #f3d66d 68%,
            #a87816 85%,
            #efd87b
        );

    box-shadow:

        0 45px 110px
        rgba(15,23,42,.25),

        0 10px 30px
        rgba(15,23,42,.10);

    animation:
        certificateEnter
        .8s
        cubic-bezier(.2,.8,.2,1);

}


.certificate::before {

    content: "";

    position: absolute;

    inset: 4px;

    border:
        1px solid
        rgba(255,255,255,.75);

    pointer-events: none;

}


.outer-frame {

    position: relative;

    width: 100%;

    min-height: 768px;

    padding: 8px;

    background: #fff;

    border:
        1px solid
        #9c761f;

}


.inner-frame {

    position: relative;

    min-height: 750px;

    overflow: hidden;

    padding:
        58px
        75px
        48px;

    border:
        2px solid
        #c79b2d;

    text-align: center;

    background:

        radial-gradient(
            circle at 50% 45%,
            rgba(212,175,55,.065),
            transparent 42%
        ),

        linear-gradient(
            180deg,
            #ffffff,
            #fffdf7
        );

}


/* =========================================================
   PREMIUM CORNERS
   ========================================================= */

.corner {

    position: absolute;

    width: 92px;

    height: 92px;

    border:
        3px solid
        #c79b2d;

    opacity: .95;

}


.corner::before {

    content: "";

    position: absolute;

    inset: 9px;

    border:
        1px solid
        #e2c86e;

}


.corner.tl {

    top: 17px;
    left: 17px;

    border-right: 0;
    border-bottom: 0;

}


.corner.tr {

    top: 17px;
    right: 17px;

    border-left: 0;
    border-bottom: 0;

}


.corner.bl {

    bottom: 17px;
    left: 17px;

    border-right: 0;
    border-top: 0;

}


.corner.br {

    bottom: 17px;
    right: 17px;

    border-left: 0;
    border-top: 0;

}


/* =========================================================
   DECORATIVE CIRCLES
   ========================================================= */

.decor {

    position: absolute;

    width: 210px;

    height: 210px;

    border:
        1px solid
        rgba(199,155,45,.16);

    border-radius: 50%;

}


.decor::before {

    content: "";

    position: absolute;

    inset: 17px;

    border:
        1px solid
        rgba(199,155,45,.11);

    border-radius: 50%;

}


.decor::after {

    content: "";

    position: absolute;

    inset: 35px;

    border:
        1px dashed
        rgba(199,155,45,.08);

    border-radius: 50%;

}


.decor.left {

    left: -125px;

    top: 50%;

    transform:
        translateY(-50%);

}


.decor.right {

    right: -125px;

    top: 50%;

    transform:
        translateY(-50%);

}


/* =========================================================
   WATERMARK
   ========================================================= */

.watermark {

    position: absolute;

    top: 50%;
    left: 50%;

    transform:
        translate(-50%,-50%)
        rotate(-18deg);

    color:
        rgba(15,23,42,.023);

    font-size: 280px;

    font-weight: 800;

    letter-spacing: 15px;

    line-height: 1;

    white-space: nowrap;

    pointer-events: none;

}


/* =========================================================
   OFFICIAL BRAND HEADER
   ========================================================= */

.brand-seal {

    position: relative;

    z-index: 10;

    width: 82px;

    height: 82px;

    margin:
        0 auto
        14px;

    display: flex;

    align-items: center;

    justify-content: center;

    border:
        3px solid
        #c79b2d;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            #fffdf2 0%,
            #fff7d8 60%,
            #f4e4a5 100%
        );

    box-shadow:

        inset 0 0 0 5px #fff,

        inset 0 0 0 6px #d8b752,

        0 8px 22px
        rgba(157,116,25,.14);

}


.brand-seal-inner {

    display: flex;

    align-items: center;

    justify-content: center;

    width: 58px;

    height: 58px;

    border:
        1px dashed
        #b88a22;

    border-radius: 50%;

    color: #1d4ed8;

    font-size: 18px;

    font-weight: 800;

}


.company-name {

    position: relative;

    z-index: 10;

    color: #1d4ed8;

    font-size: 13px;

    font-weight: 800;

    letter-spacing: 5px;

    text-transform: uppercase;

}


.company-tagline {

    position: relative;

    z-index: 10;

    margin-top: 5px;

    color: #9b7b2d;

    font-size: 6px;

    font-weight: 700;

    letter-spacing: 2.2px;

    text-transform: uppercase;

}


/* =========================================================
   CERTIFICATE TITLE
   ========================================================= */

.title {

    position: relative;

    z-index: 10;

    margin:
        14px
        0
        0;

    color: #101827;

    font-family:
        'Playfair Display',
        serif;

    font-size: 58px;

    line-height: 1.1;

    font-weight: 700;

}


.title-decoration {

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 13px;

    margin:
        11px
        auto
        29px;

    color: #a67c1e;

    font-size: 7px;

    font-weight: 800;

    letter-spacing: 3px;

}


.title-line {

    width: 75px;

    height: 1px;

    background:
        linear-gradient(
            90deg,
            transparent,
            #c79b2d
        );

}


.title-line.right {

    background:
        linear-gradient(
            90deg,
            #c79b2d,
            transparent
        );

}


/* =========================================================
   PRESENTED
   ========================================================= */

.presented {

    position: relative;

    z-index: 10;

    color: #718096;

    font-size: 8px;

    font-weight: 600;

    letter-spacing: 1.5px;

    text-transform: uppercase;

}


/* =========================================================
   STUDENT NAME
   ========================================================= */

.student-name {

    position: relative;

    z-index: 10;

    display: inline-block;

    max-width: 92%;

    margin:
        7px
        auto
        0;

    color: #101827;

    font-family:
        'Playfair Display',
        serif;

    font-size: 45px;

    line-height: 1.2;

    font-weight: 700;

}


.name-rule {

    width: 430px;

    max-width: 75%;

    height: 2px;

    margin:
        9px
        auto
        23px;

    background:
        linear-gradient(
            90deg,
            transparent,
            #c79b2d 18%,
            #e1c15d 50%,
            #c79b2d 82%,
            transparent
        );

}


/* =========================================================
   ACHIEVEMENT TEXT
   ========================================================= */

.description {

    position: relative;

    z-index: 10;

    max-width: 820px;

    margin: auto;

    color: #475569;

    font-size: 10px;

    line-height: 1.95;

}


.description strong {

    color: #111827;

    font-weight: 800;

}


/* =========================================================
   ACHIEVEMENT BADGE
   ========================================================= */

.excellence {

    position: relative;

    z-index: 10;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 9px;

    margin:
        22px
        auto
        22px;

    padding:
        9px
        19px;

    border:
        1px solid
        #e0c56a;

    border-radius: 50px;

    background:
        linear-gradient(
            135deg,
            #fffdf4,
            #fff7dc
        );

    color: #8b681f;

    font-size: 7px;

    font-weight: 800;

    letter-spacing: 1.3px;

}


.star {

    color: #c79b2d;

    font-size: 12px;

}


/* =========================================================
   RESULT PANEL
   ========================================================= */

.result-panel {

    position: relative;

    z-index: 10;

    display: grid;

    grid-template-columns:
        repeat(4,1fr);

    gap: 11px;

    width: 100%;

    max-width: 820px;

    margin:
        0
        auto
        20px;

}


.result-box {

    position: relative;

    padding:
        15px
        8px;

    border:
        1px solid
        #e7d293;

    border-radius: 12px;

    background:
        linear-gradient(
            145deg,
            #fff,
            #fffaf0
        );

    box-shadow:
        0 8px 20px
        rgba(157,116,25,.055);

}


.result-box::before {

    content: "";

    position: absolute;

    top: 0;
    left: 14%;

    width: 72%;
    height: 2px;

    background:
        linear-gradient(
            90deg,
            transparent,
            #d4af37,
            transparent
        );

}


.result-label {

    display: block;

    margin-bottom: 6px;

    color: #9a7629;

    font-size: 6px;

    font-weight: 800;

    letter-spacing: 1px;

    text-transform: uppercase;

}


.result-value {

    display: block;

    color: #101827;

    font-size: 16px;

    font-weight: 800;

}


/* =========================================================
   PASSED
   ========================================================= */

.status {

    position: relative;

    z-index: 10;

    display: inline-flex;

    align-items: center;

    gap: 7px;

    padding:
        8px
        17px;

    border:
        1px solid
        #a7f3d0;

    border-radius: 50px;

    background:
        #ecfdf5;

    color: #047857;

    font-size: 7px;

    font-weight: 800;

    letter-spacing: 1.1px;

    text-transform: uppercase;

}


.status-dot {

    width: 6px;

    height: 6px;

    border-radius: 50%;

    background: #10b981;

    box-shadow:
        0 0 9px
        rgba(16,185,129,.55);

}


/* =========================================================
   BOTTOM AREA
   ========================================================= */

.bottom {

    position: relative;

    z-index: 10;

    display: grid;

    grid-template-columns:
        1fr
        auto
        1fr;

    align-items: end;

    gap: 45px;

    width: 100%;

    max-width: 820px;

    margin:
        31px
        auto
        0;

}


/* =========================================================
   AAMIR KHAN SIGNATURE
   ========================================================= */

.signature-area {

    text-align: left;

}


.signature {

    min-height: 43px;

    color: #172033;

    font-family:
        'Allura',
        cursive;

    font-size: 36px;

    line-height: 1;

    white-space: nowrap;

}


.signature-line {

    width: 185px;

    height: 1px;

    margin-top: 2px;

    background:
        #4b5563;

}


.signature-label {

    margin-top: 6px;

    color: #64748b;

    font-size: 6px;

    font-weight: 800;

    letter-spacing: 1px;

    text-transform: uppercase;

}


/* =========================================================
   CENTER AUTHENTICATION SEAL
   ========================================================= */

.authentication-seal {

    width: 72px;

    height: 72px;

    display: flex;

    align-items: center;

    justify-content: center;

    border:
        2px solid
        #c79b2d;

    border-radius: 50%;

    background:
        #fffdf4;

    box-shadow:

        inset 0 0 0 4px #fff,

        inset 0 0 0 5px #e1c36a;

}


.authentication-inner {

    width: 50px;

    height: 50px;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

    border:
        1px dashed
        #b88a22;

    border-radius: 50%;

    color: #92702a;

    font-size: 6px;

    font-weight: 800;

    letter-spacing: .8px;

    line-height: 1.4;

}


/* =========================================================
   CERTIFICATE META
   ========================================================= */

.meta {

    text-align: right;

}


.meta-item {

    margin-bottom: 8px;

}


.meta-label {

    display: block;

    margin-bottom: 3px;

    color: #a1a9b5;

    font-size: 6px;

    font-weight: 800;

    letter-spacing: 1px;

    text-transform: uppercase;

}


.meta-value {

    color: #334155;

    font-size: 8px;

    font-weight: 800;

}


/* =========================================================
   FOOTNOTE
   ========================================================= */

.footnote {

    position: relative;

    z-index: 10;

    margin-top: 21px;

    color: #a1a9b5;

    font-size: 6px;

    letter-spacing: .7px;

}


/* =========================================================
   ANIMATION
   ========================================================= */

@keyframes certificateEnter {

    from {

        opacity: 0;

        transform:
            translateY(25px)
            scale(.98);

    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);

    }

}


/* =========================================================
   RESPONSIVE
   ========================================================= */

@media (max-width: 900px) {

    .certificate {

        min-height: auto;

    }

    .inner-frame {

        padding:
            50px
            38px
            45px;

    }

    .title {

        font-size: 48px;

    }

    .student-name {

        font-size: 37px;

    }

    .result-panel {

        grid-template-columns:
            repeat(2,1fr);

    }

}


@media (max-width: 650px) {

    .topbar {

        height: 62px;

        padding:
            0
            14px;

    }

    .brand-text {

        font-size: 11px;

    }

    .brand-subtitle {

        display: none;

    }

    .toolbar-button.back {

        display: none;

    }

    .toolbar-button {

        padding:
            0
            10px;

    }

    .page {

        padding:
            18px
            7px
            45px;

    }

    .certificate {

        padding: 6px;

    }

    .outer-frame {

        padding: 5px;

    }

    .inner-frame {

        min-height: auto;

        padding:
            40px
            17px
            35px;

    }

    .corner {

        width: 55px;

        height: 55px;

    }

    .corner.tl,
    .corner.tr {

        top: 10px;

    }

    .corner.bl,
    .corner.br {

        bottom: 10px;

    }

    .corner.tl,
    .corner.bl {

        left: 10px;

    }

    .corner.tr,
    .corner.br {

        right: 10px;

    }

    .brand-seal {

        width: 64px;

        height: 64px;

    }

    .brand-seal-inner {

        width: 45px;

        height: 45px;

        font-size: 14px;

    }

    .company-name {

        font-size: 9px;

        letter-spacing: 3px;

    }

    .title {

        font-size: 35px;

    }

    .title-decoration {

        margin-bottom: 25px;

    }

    .student-name {

        font-size: 28px;

    }

    .description {

        font-size: 8px;

        line-height: 1.8;

    }

    .excellence {

        font-size: 6px;

        padding:
            8px
            12px;

    }

    .result-panel {

        grid-template-columns:
            repeat(2,1fr);

        gap: 8px;

    }

    .result-value {

        font-size: 14px;

    }

    .bottom {

        grid-template-columns: 1fr;

        gap: 22px;

        align-items: center;

    }

    .signature-area,
    .meta {

        text-align: center;

    }

    .signature-line {

        margin-left: auto;

        margin-right: auto;

    }

    .authentication-seal {

        order: -1;

    }

    .watermark {

        font-size: 150px;

    }

}


@media (max-width: 390px) {

    .title {

        font-size: 31px;

    }

    .student-name {

        font-size: 24px;

    }

    .result-panel {

        grid-template-columns: 1fr;

    }

}


/* =========================================================
   PRINT / SAVE PDF
   ========================================================= */

@media print {

    @page {

        size: A4 landscape;

        margin: 0;

    }

    html,
    body {

        width: 100%;

        min-height: 100%;

        background: #fff !important;

    }

    body {

        -webkit-print-color-adjust:
            exact !important;

        print-color-adjust:
            exact !important;

    }

    .topbar {

        display: none !important;

    }

    .page {

        padding: 0 !important;

    }

    .certificate {

        width: 100vw;

        max-width: none;

        min-height: 100vh;

        padding: 9px;

        box-shadow: none !important;

        animation: none !important;

    }

    .outer-frame {

        min-height:
            calc(100vh - 18px);

    }

    .inner-frame {

        min-height:
            calc(100vh - 34px);

        padding:
            48px
            62px
            38px;

    }

    .title {

        font-size: 47px;

    }

    .student-name {

        font-size: 37px;

    }

    .description {

        font-size: 9px;

    }

    .bottom {

        margin-top: 27px;

    }

    .toolbar-actions {

        display: none !important;

    }

}

</style>

</head>


<body>


<!-- =========================================================
     TOP BAR
     ========================================================= -->

<header class="topbar">


<div class="brand-wrapper">

    <div class="brand-logo">
        EP
    </div>

    <div>

        <div class="brand-text">
            EXAMPORTAL
        </div>

        <div class="brand-subtitle">
            Digital Examination Platform
        </div>

    </div>

</div>


<div class="toolbar-actions">


<a
    href="${pageContext.request.contextPath}/studentResult.jsp"
    class="toolbar-button back">

    ← My Results

</a>


<button
    type="button"
    class="toolbar-button primary"
    onclick="printCertificate()">

    🖨 Print / Save PDF

</button>


</div>


</header>


<!-- =========================================================
     CERTIFICATE
     ========================================================= -->

<main class="page">


<section class="certificate">


<div class="outer-frame">


<div class="inner-frame">


<!-- PREMIUM CORNERS -->

<div class="corner tl"></div>
<div class="corner tr"></div>
<div class="corner bl"></div>
<div class="corner br"></div>


<!-- DECORATIVE CIRCLES -->

<div class="decor left"></div>
<div class="decor right"></div>


<!-- WATERMARK -->

<div class="watermark">
    EP
</div>


<!-- =====================================================
     COMPANY BRAND
     ===================================================== -->

<div class="brand-seal">

    <div class="brand-seal-inner">
        EP
    </div>

</div>


<div class="company-name">
    EXAMPORTAL
</div>


<div class="company-tagline">
    Digital Examination &amp; Learning Platform
</div>


<!-- =====================================================
     TITLE
     ===================================================== -->

<h1 class="title">
    Certificate
</h1>


<div class="title-decoration">

    <span class="title-line"></span>

    <span>
        OF ACHIEVEMENT
    </span>

    <span class="title-line right"></span>

</div>


<!-- =====================================================
     STUDENT
     ===================================================== -->

<div class="presented">

    THIS CERTIFICATE IS PROUDLY PRESENTED TO

</div>


<div class="student-name">

    <%=studentName%>

</div>


<div class="name-rule"></div>


<!-- =====================================================
     DESCRIPTION
     ===================================================== -->

<div class="description">

    This is to formally recognize that

    <strong>
        <%=studentName%>
    </strong>

    has successfully completed the

    <strong>
        <%=testName%>
    </strong>

    assessment under

    <strong>
        <%=examName%>
    </strong>

    through the ExamPortal digital examination platform,
    demonstrating successful performance in the assessment.

</div>


<!-- =====================================================
     EXCELLENCE BADGE
     ===================================================== -->

<div class="excellence">

    <span class="star">
        ✦
    </span>

    EXCELLENCE IN ACADEMIC PERFORMANCE

    <span class="star">
        ✦
    </span>

</div>


<!-- =====================================================
     RESULT
     ===================================================== -->

<div class="result-panel">


<div class="result-box">

    <span class="result-label">
        Score
    </span>

    <span class="result-value">

        <%=result.getObtained()%>
        /
        <%=result.getMaxMarks()%>

    </span>

</div>


<div class="result-box">

    <span class="result-label">
        Percentage
    </span>

    <span class="result-value">

        <%=percentageText%>%

    </span>

</div>


<div class="result-box">

    <span class="result-label">
        Grade
    </span>

    <span class="result-value">

        <%=grade%>

    </span>

</div>


<div class="result-box">

    <span class="result-label">
        Questions
    </span>

    <span class="result-value">

        <%=result.getMaxQuestions()%>

    </span>

</div>


</div>


<!-- =====================================================
     STATUS
     ===================================================== -->

<div class="status">

    <span class="status-dot"></span>

    <%=status%>

</div>


<!-- =====================================================
     BOTTOM INFORMATION
     ===================================================== -->

<div class="bottom">


<!-- =====================================================
     AAMIR KHAN SIGNATURE
     ===================================================== -->

<div class="signature-area">

    <div class="signature">
        Aamir Khan
    </div>

    <div class="signature-line"></div>

    <div class="signature-label">
        Authorized Signature
    </div>

</div>


<!-- =====================================================
     VERIFICATION SEAL
     ===================================================== -->

<div class="authentication-seal">

    <div class="authentication-inner">

        VERIFIED

        <br>

        EXAMPORTAL

    </div>

</div>


<!-- =====================================================
     CERTIFICATE INFORMATION
     ===================================================== -->

<div class="meta">


<div class="meta-item">

    <span class="meta-label">
        Certificate ID
    </span>

    <span class="meta-value">
        <%=certificateId%>
    </span>

</div>


<div class="meta-item">

    <span class="meta-label">
        Issue Date
    </span>

    <span class="meta-value">
        <%=issueDate%>
    </span>

</div>


</div>


</div>


<!-- =====================================================
     FOOTNOTE
     ===================================================== -->

<div class="footnote">

    Digitally generated certificate • ExamPortal •
    Certificate ID: <%=certificateId%>

</div>


</div>

</div>

</section>

</main>


<script>

/* =========================================================
   PRINT / SAVE PDF
   ========================================================= */

function printCertificate() {

    window.print();

}


/* =========================================================
   CTRL + P
   ========================================================= */

document.addEventListener(
    "keydown",
    function(event) {

        if (
            (event.ctrlKey || event.metaKey) &&
            event.key.toLowerCase() === "p"
        ) {

            event.preventDefault();

            window.print();

        }

    }
);

</script>


</body>

</html>