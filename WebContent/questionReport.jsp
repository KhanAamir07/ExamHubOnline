<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Admin | Question Report</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="ExamPortal Question Report">

    <!-- Google Font -->
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">
    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- DataTables -->
    <link rel="stylesheet"
          href="assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css">

    <!-- Existing Theme -->
    <link rel="stylesheet"
          href="assets/css/style.min.css">

    <style>

        /* =====================================================
           GLOBAL
           ===================================================== */

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;

            background: #f5f7fb;

            color: #172033;

            font-family: 'Montserrat', sans-serif !important;
        }

        /* =====================================================
           PAGE
           ===================================================== */

        .question-report-page {
            min-height: 100vh;

            padding: 42px 24px 60px;
        }

        .question-report-wrapper {
            width: 100%;
            max-width: 1550px;

            margin: 0 auto;
        }

        /* =====================================================
           HEADER
           ===================================================== */

        .report-header {
            position: relative;

            overflow: hidden;

            margin-bottom: 22px;
            padding: 32px 36px;

            background:
                linear-gradient(
                    135deg,
                    #ffffff 0%,
                    #f7fbff 100%
                );

            border: 1px solid #e7edf5;

            border-radius: 22px;

            box-shadow:
                0 14px 40px rgba(24, 39, 75, 0.07);
        }

        .report-header::before {
            content: "";

            position: absolute;

            width: 190px;
            height: 190px;

            right: -70px;
            top: -105px;

            border-radius: 50%;

            background:
                rgba(13, 110, 253, 0.08);
        }

        .report-header-content {
            position: relative;

            z-index: 2;
        }

        .report-eyebrow {
            display: inline-flex;

            align-items: center;

            margin-bottom: 11px;

            padding: 7px 13px;

            border-radius: 30px;

            background: #eef5ff;

            color: #0d6efd;

            font-size: 10px;

            font-weight: 700;

            letter-spacing: 1px;

            text-transform: uppercase;
        }

        .report-title {
            margin: 0;

            color: #142238;

            font-size: 31px;

            line-height: 1.25;

            font-weight: 700;

            letter-spacing: -0.6px;
        }

        .report-description {
            margin: 9px 0 0;

            max-width: 750px;

            color: #7b8798;

            font-size: 13px;

            line-height: 1.7;

            font-weight: 500;
        }

        /* =====================================================
           SUMMARY
           ===================================================== */

        .summary-grid {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 17px;

            margin-bottom: 22px;
        }

        .summary-card {
            position: relative;

            overflow: hidden;

            padding: 21px;

            background: #ffffff;

            border: 1px solid #e8edf4;

            border-radius: 17px;

            box-shadow:
                0 9px 28px rgba(24, 39, 75, 0.05);
        }

        .summary-card::after {
            content: "";

            position: absolute;

            width: 80px;
            height: 80px;

            right: -30px;
            bottom: -35px;

            border-radius: 50%;

            background: #f3f7ff;
        }

        .summary-label {
            position: relative;

            z-index: 2;

            display: block;

            margin-bottom: 7px;

            color: #8490a2;

            font-size: 10px;

            font-weight: 700;

            letter-spacing: .7px;

            text-transform: uppercase;
        }

        .summary-value {
            position: relative;

            z-index: 2;

            color: #172033;

            font-size: 27px;

            line-height: 1;

            font-weight: 700;
        }

        /* =====================================================
           TABLE CARD
           ===================================================== */

        .question-card {
            background: #ffffff;

            border: 1px solid #e7ecf3;

            border-radius: 22px;

            padding: 25px;

            box-shadow:
                0 15px 45px rgba(24, 39, 75, 0.07);
        }

        .card-heading {
            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 15px;

            margin-bottom: 20px;
        }

        .card-heading h2 {
            margin: 0;

            color: #172033;

            font-size: 19px;

            font-weight: 700;
        }

        .card-heading p {
            margin: 5px 0 0;

            color: #8993a3;

            font-size: 11px;

            font-weight: 500;
        }

        .question-count-badge {
            display: inline-flex;

            align-items: center;

            justify-content: center;

            padding: 8px 13px;

            border-radius: 30px;

            background: #eef5ff;

            color: #0d6efd;

            font-size: 10px;

            font-weight: 700;

            white-space: nowrap;
        }

        /* =====================================================
           TABLE
           ===================================================== */

        .table-scroll {
            overflow-x: auto;

            width: 100%;

            border: 1px solid #e7ecf3;

            border-radius: 15px;
        }

        .question-table {
            width: 100%;

            min-width: 1350px;

            margin: 0;

            border-collapse: separate;

            border-spacing: 0;

            font-family: 'Montserrat', sans-serif !important;
        }

        .question-table thead th {
            padding: 15px 13px !important;

            background: #f7f9fc !important;

            color: #5d6879 !important;

            border-top: 0 !important;

            border-bottom: 1px solid #e3e8ef !important;

            font-size: 10px !important;

            font-weight: 700 !important;

            letter-spacing: .45px;

            text-transform: uppercase;

            white-space: nowrap;

            vertical-align: middle !important;
        }

        .question-table thead th:first-child {
            border-top-left-radius: 14px;
        }

        .question-table thead th:last-child {
            border-top-right-radius: 14px;
        }

        .question-table tbody td {
            padding: 16px 13px !important;

            background: #ffffff !important;

            color: #596579 !important;

            border-top: 0 !important;

            border-bottom: 1px solid #edf0f4 !important;

            font-size: 11px !important;

            font-weight: 500 !important;

            vertical-align: top !important;

            line-height: 1.65;
        }

        .question-table tbody tr {
            transition:
                background .2s ease;
        }

        .question-table tbody tr:hover td {
            background: #f9fbff !important;
        }

        .question-table tbody tr:last-child td {
            border-bottom: 0 !important;
        }

        /* =====================================================
           QUESTION ID
           ===================================================== */

        .question-id {
            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 34px;

            height: 30px;

            padding: 0 8px;

            border-radius: 9px;

            background: #f1f5f9;

            color: #475467;

            font-size: 10px;

            font-weight: 700;
        }

        /* =====================================================
           QUESTION TEXT
           ===================================================== */

        .question-text {
            min-width: 250px;

            max-width: 350px;

            color: #18263d;

            font-size: 12px;

            font-weight: 600;

            line-height: 1.65;
        }

        /* =====================================================
           EXAM / SECTION
           ===================================================== */

        .exam-name {
            display: inline-block;

            padding: 6px 9px;

            border-radius: 8px;

            background: #eef5ff;

            color: #0d6efd;

            font-size: 10px;

            font-weight: 700;

            line-height: 1.4;
        }

        .section-name {
            display: inline-block;

            padding: 6px 9px;

            border-radius: 8px;

            background: #f5f3ff;

            color: #6657c7;

            font-size: 10px;

            font-weight: 700;

            line-height: 1.4;
        }

        /* =====================================================
           OPTIONS
           ===================================================== */

        .option-box {
            min-width: 145px;

            max-width: 220px;

            padding: 9px 11px;

            background: #f8fafc;

            border: 1px solid #e8edf3;

            border-radius: 9px;

            color: #536174;

            font-size: 10px;

            line-height: 1.55;
        }

        .option-label {
            display: block;

            margin-bottom: 3px;

            color: #9aa4b2;

            font-size: 8px;

            font-weight: 700;

            letter-spacing: .5px;

            text-transform: uppercase;
        }

        /* =====================================================
           ANSWER
           ===================================================== */

        .answer-box {
            min-width: 130px;

            padding: 9px 11px;

            border: 1px solid #d7f0df;

            border-radius: 9px;

            background: #effaf3;

            color: #16834d;

            font-size: 10px;

            font-weight: 700;

            line-height: 1.55;
        }

        .answer-label {
            display: block;

            margin-bottom: 3px;

            color: #54a879;

            font-size: 8px;

            font-weight: 700;

            letter-spacing: .5px;

            text-transform: uppercase;
        }

        /* =====================================================
           EMPTY
           ===================================================== */

        .empty-state {
            padding: 65px 20px !important;

            text-align: center;

            color: #8993a3 !important;

            font-size: 12px !important;
        }

        .empty-icon {
            width: 55px;
            height: 55px;

            display: flex;

            align-items: center;
            justify-content: center;

            margin: 0 auto 13px;

            border-radius: 15px;

            background: #f3f7ff;

            color: #0d6efd;

            font-size: 21px;
        }

        .empty-title {
            display: block;

            margin-bottom: 5px;

            color: #475467;

            font-size: 14px;

            font-weight: 700;
        }

        /* =====================================================
           DATATABLE
           ===================================================== */

        .dataTables_wrapper {
            font-family: 'Montserrat', sans-serif !important;
        }

        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 14px;
        }

        .dataTables_wrapper .dataTables_filter label,
        .dataTables_wrapper .dataTables_length label {
            color: #667085;

            font-size: 11px;

            font-weight: 600;
        }

        .dataTables_wrapper .dataTables_filter input,
        .dataTables_wrapper .dataTables_length select {
            margin-left: 7px;

            padding: 8px 11px;

            border: 1px solid #dce2ea !important;

            border-radius: 9px;

            outline: none;

            background: #ffffff;

            color: #344054;

            font-family: 'Montserrat', sans-serif;

            font-size: 10px;
        }

        .dataTables_wrapper .dataTables_filter input:focus {
            border-color: #86b7fe !important;

            box-shadow:
                0 0 0 3px rgba(13, 110, 253, 0.08);
        }

        .dataTables_wrapper .dataTables_info {
            padding-top: 16px !important;

            color: #8993a3;

            font-size: 10px;

            font-weight: 500;
        }

        .dataTables_wrapper .dataTables_paginate {
            padding-top: 11px !important;
        }

        .dataTables_wrapper
        .dataTables_paginate
        .paginate_button {
            padding: 6px 10px !important;

            border: 0 !important;

            border-radius: 8px !important;

            color: #64748b !important;

            font-size: 10px !important;

            font-weight: 600;
        }

        .dataTables_wrapper
        .dataTables_paginate
        .paginate_button.current {
            background: #0d6efd !important;

            color: #ffffff !important;
        }

        .dataTables_wrapper
        .dataTables_paginate
        .paginate_button:hover {
            background: #eef5ff !important;

            color: #0d6efd !important;
        }

        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 900px) {

            .summary-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

        }

        @media (max-width: 600px) {

            .question-report-page {
                padding: 20px 12px 40px;
            }

            .report-header {
                padding: 25px 21px;

                border-radius: 17px;
            }

            .report-title {
                font-size: 25px;
            }

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .question-card {
                padding: 15px;

                border-radius: 17px;
            }

            .card-heading {
                display: block;
            }

            .question-count-badge {
                margin-top: 12px;
            }

        }

    </style>

</head>


<body>

<%
    String admin =
            (String) session.getAttribute("adminLogin");

    if (admin == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/adminLogin.jsp");

        return;
    }

    List<Question> listOfAllQuestion =
            (List<Question>) request.getAttribute(
                    "listOfQuestion");

    if (listOfAllQuestion == null) {
        listOfAllQuestion =
                new ArrayList<Question>();
    }

    int totalQuestions =
            listOfAllQuestion.size();

    Set<Integer> examIds =
            new HashSet<Integer>();

    Set<Integer> sectionIds =
            new HashSet<Integer>();

    for (Question question :
            listOfAllQuestion) {

        sectionIds.add(
                question.getSectionId());
    }

    SectionDaoImpl sectionDaoImpl =
            new SectionDaoImpl();

    ExamDaoImpl examDaoImpl =
            new ExamDaoImpl();

    for (Integer sectionId :
            sectionIds) {

        Section section =
                sectionDaoImpl.viewSection(
                        sectionId);

        if (section != null) {

            examIds.add(
                    section.getExamId());
        }
    }

    int totalExams =
            examIds.size();

    int totalSections =
            sectionIds.size();
%>


<div class="question-report-page">

    <div class="question-report-wrapper">


        <!-- =================================================
             HEADER
             ================================================= -->

        <div class="report-header">

            <div class="report-header-content">

                <div class="report-eyebrow">
                    ExamPortal Administration
                </div>

                <h1 class="report-title">
                    Question Report
                </h1>

                <p class="report-description">
                    Review all questions, exams, sections,
                    options and correct answers in one place.
                </p>

            </div>

        </div>


        <!-- =================================================
             SUMMARY
             ================================================= -->

        <div class="summary-grid">

            <div class="summary-card">

                <span class="summary-label">
                    Total Questions
                </span>

                <div class="summary-value">
                    <%=totalQuestions%>
                </div>

            </div>


            <div class="summary-card">

                <span class="summary-label">
                    Exams Covered
                </span>

                <div class="summary-value">
                    <%=totalExams%>
                </div>

            </div>


            <div class="summary-card">

                <span class="summary-label">
                    Sections Covered
                </span>

                <div class="summary-value">
                    <%=totalSections%>
                </div>

            </div>

        </div>


        <!-- =================================================
             TABLE
             ================================================= -->

        <div class="question-card">

            <div class="card-heading">

                <div>

                    <h2>
                        Question Bank Overview
                    </h2>

                    <p>
                        Complete question details with
                        associated exam and section.
                    </p>

                </div>

                <div class="question-count-badge">
                    <%=totalQuestions%> Questions
                </div>

            </div>


            <div class="table-scroll">

                <table
                    class="table question-table table-bordered table-striped table-hover dataTable js-exportable">

                    <thead>

                        <tr>

                            <th>
                                Question ID
                            </th>

                            <th>
                                Question
                            </th>

                            <th>
                                Exam
                            </th>

                            <th>
                                Section
                            </th>

                            <th>
                                Option 1
                            </th>

                            <th>
                                Option 2
                            </th>

                            <th>
                                Option 3
                            </th>

                            <th>
                                Option 4
                            </th>

                            <th>
                                Correct Answer
                            </th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        if (listOfAllQuestion.size() == 0) {
                    %>

                        <tr>

                            <td
                                colspan="9"
                                class="empty-state">

                                <div class="empty-icon">
                                    ?
                                </div>

                                <span class="empty-title">
                                    No Questions Available
                                </span>

                                No questions have been added
                                to the selected subject yet.

                            </td>

                        </tr>

                    <%
                        } else {

                            for (Question question :
                                    listOfAllQuestion) {

                                Section questionSection =
                                        sectionDaoImpl.viewSection(
                                                question.getSectionId());

                                Exam questionExam = null;

                                if (questionSection != null) {

                                    questionExam =
                                            examDaoImpl.viewExam(
                                                    questionSection.getExamId());
                                }
                    %>

                        <tr>

                            <!-- QUESTION ID -->

                            <td>

                                <span class="question-id">
                                    <%=question.getQuestionId()%>
                                </span>

                            </td>


                            <!-- QUESTION -->

                            <td>

                                <div class="question-text">
                                    <%=question.getQuestion()%>
                                </div>

                            </td>


                            <!-- EXAM -->

                            <td>

                                <%
                                    if (questionExam != null) {
                                %>

                                    <span class="exam-name">
                                        <%=questionExam.getExamName()%>
                                    </span>

                                <%
                                    } else {
                                %>

                                    <span class="exam-name">
                                        -
                                    </span>

                                <%
                                    }
                                %>

                            </td>


                            <!-- SECTION -->

                            <td>

                                <%
                                    if (questionSection != null) {
                                %>

                                    <span class="section-name">
                                        <%=questionSection.getSectionName()%>
                                    </span>

                                <%
                                    } else {
                                %>

                                    <span class="section-name">
                                        -
                                    </span>

                                <%
                                    }
                                %>

                            </td>


                            <!-- OPTION 1 -->

                            <td>

                                <div class="option-box">

                                    <span class="option-label">
                                        Option 1
                                    </span>

                                    <%=question.getOption1()%>

                                </div>

                            </td>


                            <!-- OPTION 2 -->

                            <td>

                                <div class="option-box">

                                    <span class="option-label">
                                        Option 2
                                    </span>

                                    <%=question.getOption2()%>

                                </div>

                            </td>


                            <!-- OPTION 3 -->

                            <td>

                                <div class="option-box">

                                    <span class="option-label">
                                        Option 3
                                    </span>

                                    <%=question.getOption3()%>

                                </div>

                            </td>


                            <!-- OPTION 4 -->

                            <td>

                                <div class="option-box">

                                    <span class="option-label">
                                        Option 4
                                    </span>

                                    <%=question.getOption4()%>

                                </div>

                            </td>


                            <!-- ANSWER -->

                            <td>

                                <div class="answer-box">

                                    <span class="answer-label">
                                        Correct Answer
                                    </span>

                                    <%=question.getAnswer()%>

                                </div>

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

    </div>

</div>


<!-- =========================================================
     SCRIPTS
     ========================================================= -->

<script src="assets/bundles/libscripts.bundle.js"></script>

<script src="assets/bundles/vendorscripts.bundle.js"></script>

<script src="assets/bundles/datatablescripts.bundle.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/dataTables.buttons.min.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/buttons.bootstrap4.min.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/buttons.colVis.min.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/buttons.flash.min.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/buttons.html5.min.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/buttons.print.min.js"></script>


<script>

    $(document).ready(function () {

        $('.js-exportable').DataTable({

            responsive: false,

            pageLength: 10,

            ordering: true,

            searching: true,

            info: true,

            lengthChange: false,

            autoWidth: false,

            dom:
                '<"row"<"col-sm-6"B><"col-sm-6"f>>' +
                'rt' +
                '<"row"<"col-sm-6"i><"col-sm-6"p>>',

            buttons: [
                {
                    extend: 'copy',
                    text: 'Copy'
                },
                {
                    extend: 'csv',
                    text: 'CSV'
                },
                {
                    extend: 'print',
                    text: 'Print'
                }
            ]

        });

    });

</script>


</body>

</html>