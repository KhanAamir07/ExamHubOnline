<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Admin | Test Report</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
          
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

    <link rel="stylesheet"
          href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css">

    <link rel="stylesheet"
          href="assets/css/style.min.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif !important;
        }

        .report-page {
            min-height: 100vh;
            padding: 42px 24px 60px;
        }

        .report-wrapper {
            max-width: 1550px;
            margin: auto;
        }

        .report-header {
            position: relative;
            overflow: hidden;
            padding: 34px 38px;
            margin-bottom: 22px;
            background: linear-gradient(135deg, #ffffff, #f7fbff);
            border: 1px solid #e6ecf4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .report-header:after {
            content: "";
            position: absolute;
            width: 210px;
            height: 210px;
            right: -80px;
            top: -115px;
            border-radius: 50%;
            background: rgba(13,110,253,.08);
        }

        .header-content {
            position: relative;
            z-index: 2;
        }

        .eyebrow {
            display: inline-flex;
            padding: 7px 13px;
            margin-bottom: 11px;
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
            font-size: 31px;
            font-weight: 700;
            letter-spacing: -.6px;
            color: #142238;
        }

        .report-description {
            margin: 9px 0 0;
            color: #7b8798;
            font-size: 13px;
            line-height: 1.7;
            font-weight: 500;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 17px;
            margin-bottom: 22px;
        }

        .summary-card {
            position: relative;
            overflow: hidden;
            padding: 21px;
            background: #fff;
            border: 1px solid #e8edf4;
            border-radius: 17px;
            box-shadow: 0 10px 30px rgba(24,39,75,.05);
        }

        .summary-card:after {
            content: "";
            position: absolute;
            width: 80px;
            height: 80px;
            right: -30px;
            bottom: -35px;
            border-radius: 50%;
            background: #f1f6ff;
        }

        .summary-label {
            display: block;
            margin-bottom: 7px;
            color: #8490a2;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: .7px;
            text-transform: uppercase;
        }

        .summary-value {
            color: #172033;
            font-size: 28px;
            font-weight: 700;
        }

        .table-card {
            padding: 25px;
            background: #fff;
            border: 1px solid #e7ecf3;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .card-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
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
        }

        .count-badge {
            padding: 8px 13px;
            border-radius: 30px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 10px;
            font-weight: 700;
        }

        .table-scroll {
            overflow-x: auto;
            border: 1px solid #e7ecf3;
            border-radius: 15px;
        }

        .test-table {
            width: 100%;
            min-width: 1250px;
            margin: 0;
            border-collapse: separate;
            border-spacing: 0;
        }

        .test-table thead th {
            padding: 15px 13px !important;
            background: #f7f9fc !important;
            color: #5d6879 !important;
            border-top: 0 !important;
            border-bottom: 1px solid #e3e8ef !important;
            font-size: 10px !important;
            font-weight: 700 !important;
            text-transform: uppercase;
            letter-spacing: .4px;
            white-space: nowrap;
        }

        .test-table tbody td {
            padding: 16px 13px !important;
            background: #fff !important;
            color: #596579 !important;
            border-top: 0 !important;
            border-bottom: 1px solid #edf0f4 !important;
            font-size: 11px !important;
            font-weight: 500 !important;
            vertical-align: middle !important;
        }

        .test-table tbody tr:hover td {
            background: #f9fbff !important;
        }

        .test-name {
            max-width: 260px;
            color: #18263d;
            font-weight: 700;
            line-height: 1.55;
        }

        .subject-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 8px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 10px;
            font-weight: 700;
        }

        .type-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #f3f5f8;
            color: #596579;
            font-size: 10px;
            font-weight: 700;
        }

        .number-value {
            color: #18263d;
            font-weight: 700;
        }

        .date-value {
            color: #677386;
            font-size: 10px;
            font-weight: 600;
            white-space: nowrap;
        }

        .empty-state {
            padding: 65px 20px !important;
            text-align: center;
            color: #8993a3 !important;
        }

        .empty-title {
            display: block;
            margin-bottom: 5px;
            color: #475467;
            font-size: 14px;
            font-weight: 700;
        }

        .dataTables_wrapper {
            font-family: 'Montserrat', sans-serif !important;
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
            font-family: 'Montserrat', sans-serif;
            font-size: 10px;
        }

        .dataTables_wrapper .dataTables_info {
            padding-top: 16px !important;
            color: #8993a3;
            font-size: 10px;
        }

        .dataTables_wrapper .dataTables_paginate {
            padding-top: 11px !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 6px 10px !important;
            border: 0 !important;
            border-radius: 8px !important;
            color: #64748b !important;
            font-size: 10px !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: #0d6efd !important;
            color: #fff !important;
        }

        @media (max-width: 800px) {

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .report-page {
                padding: 20px 12px 40px;
            }

            .report-header {
                padding: 25px 21px;
            }

            .report-title {
                font-size: 25px;
            }

            .table-card {
                padding: 15px;
            }

            .card-heading {
                display: block;
            }

            .count-badge {
                display: inline-block;
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
            request.getContextPath() + "/adminLogin.jsp");
        return;
    }

    ExamDaoImpl examDaoImpl =
            new ExamDaoImpl();

    List<Test> listOfAllTest =
            (List<Test>) request.getAttribute("listOftest");

    if (listOfAllTest == null) {
        listOfAllTest =
                new ArrayList<Test>();
    }

    int totalTests =
            listOfAllTest.size();

    int totalQuestions = 0;
    int totalMarks = 0;
%>

<div class="report-page">

    <div class="report-wrapper">

        <div class="report-header">

            <div class="header-content">

                <div class="eyebrow">
                    ExamPortal Administration
                </div>

                <h1 class="report-title">
                    Test Report
                </h1>

                <p class="report-description">
                    Complete overview of configured tests,
                    subjects, duration, marks and schedules.
                </p>

            </div>

        </div>


        <%
            for (Test test : listOfAllTest) {
                totalQuestions += test.getMaxQuestion();
                totalMarks += test.getMaxMarks();
            }
        %>

        <div class="summary-grid">

            <div class="summary-card">
                <span class="summary-label">
                    Total Tests
                </span>

                <div class="summary-value">
                    <%=totalTests%>
                </div>
            </div>

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
                    Combined Max Marks
                </span>

                <div class="summary-value">
                    <%=totalMarks%>
                </div>
            </div>

        </div>


        <div class="table-card">

            <div class="card-heading">

                <div>
                    <h2>
                        Test Configuration Overview
                    </h2>

                    <p>
                        Details of all tests available in ExamPortal.
                    </p>
                </div>

                <div class="count-badge">
                    <%=totalTests%> Tests
                </div>

            </div>


            <div class="table-scroll">

                <table class="table test-table dataTable js-exportable">

                    <thead>

                        <tr>
                            <th>Test Name</th>
                            <th>Subject</th>
                            <th>Test Type</th>
                            <th>Max Questions</th>
                            <th>Max Marks</th>
                            <th>Duration</th>
                            <th>Test Opens</th>
                            <th>Test Closes</th>
                        </tr>

                    </thead>

                    <tbody>

                    <%
                        if (listOfAllTest.size() == 0) {
                    %>

                        <tr>
                            <td colspan="8"
                                class="empty-state">

                                <span class="empty-title">
                                    No Tests Available
                                </span>

                                No test has been created yet.

                            </td>
                        </tr>

                    <%
                        } else {

                            DateFormat dateFormat =
                                    new SimpleDateFormat("yyyy-MM-dd");

                            for (Test test :
                                    listOfAllTest) {

                                Exam exam =
                                        examDaoImpl.viewExam(
                                                test.getExamId());

                                String subject =
                                        exam != null
                                        ? exam.getExamName()
                                        : "-";

                                String openDate =
                                        test.getOpen() != null
                                        ? dateFormat.format(test.getOpen())
                                        : "-";

                                String closeDate =
                                        test.getclose() != null
                                        ? dateFormat.format(test.getclose())
                                        : "-";
                    %>

                        <tr>

                            <td>
                                <div class="test-name">
                                    <%=test.getTestName()%>
                                </div>
                            </td>

                            <td>
                                <span class="subject-badge">
                                    <%=subject%>
                                </span>
                            </td>

                            <td>
                                <span class="type-badge">
                                    <%=test.getTestType()%>
                                </span>
                            </td>

                            <td>
                                <span class="number-value">
                                    <%=test.getMaxQuestion()%>
                                </span>
                            </td>

                            <td>
                                <span class="number-value">
                                    <%=test.getMaxMarks()%>
                                </span>
                            </td>

                            <td>
                                <span class="number-value">
                                    <%=test.getDuration()%> min
                                </span>
                            </td>

                            <td>
                                <span class="date-value">
                                    <%=openDate%>
                                </span>
                            </td>

                            <td>
                                <span class="date-value">
                                    <%=closeDate.equals("0001-01-01")
                                            ? "No Close Date"
                                            : closeDate%>
                                </span>
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


<script src="assets/bundles/libscripts.bundle.js"></script>
<script src="assets/bundles/vendorscripts.bundle.js"></script>
<script src="assets/bundles/datatablescripts.bundle.js"></script>

<script src="assets/plugins/jquery-datatable/buttons/dataTables.buttons.min.js"></script>
<script src="assets/plugins/jquery-datatable/buttons/buttons.bootstrap4.min.js"></script>
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