<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Result Report</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="ExamPortal Result Report">

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

    <!-- Theme -->
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
            font-family: 'Montserrat', sans-serif !important;
            background: #f5f7fb;
            color: #172033;
        }

        /* =====================================================
           PAGE WRAPPER
           ===================================================== */

        .report-page {
            min-height: 100vh;
            padding: 42px 26px 60px;
        }

        .report-wrapper {
            max-width: 1450px;
            margin: 0 auto;
        }

        /* =====================================================
           HEADER
           ===================================================== */

        .report-header {
            position: relative;
            overflow: hidden;
            padding: 34px 38px;
            margin-bottom: 24px;

            background:
                linear-gradient(
                    135deg,
                    #ffffff 0%,
                    #f8fbff 100%
                );

            border: 1px solid #e8edf5;
            border-radius: 22px;

            box-shadow:
                0 15px 45px rgba(24, 39, 75, 0.08);
        }

        .report-header::before {
            content: "";
            position: absolute;

            width: 180px;
            height: 180px;

            right: -70px;
            top: -90px;

            border-radius: 50%;

            background: rgba(13, 110, 253, 0.08);
        }

        .report-header::after {
            content: "";
            position: absolute;

            width: 120px;
            height: 120px;

            right: 80px;
            bottom: -85px;

            border-radius: 50%;

            background: rgba(13, 110, 253, 0.05);
        }

        .header-content {
            position: relative;
            z-index: 2;
        }

        .eyebrow {
            display: inline-flex;
            align-items: center;

            padding: 7px 13px;

            margin-bottom: 12px;

            border-radius: 30px;

            background: #eef5ff;
            color: #0d6efd;

            font-size: 11px;
            font-weight: 700;

            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .report-title {
            margin: 0;

            font-size: 32px;
            line-height: 1.2;

            font-weight: 700;
            letter-spacing: -0.6px;

            color: #152238;
        }

        .report-subtitle {
            margin: 10px 0 0;

            font-size: 14px;
            line-height: 1.7;

            color: #718096;
            font-weight: 500;
        }

        /* =====================================================
           SUMMARY CARDS
           ===================================================== */

        .summary-grid {
            display: grid;

            grid-template-columns:
                repeat(4, minmax(0, 1fr));

            gap: 18px;

            margin-bottom: 24px;
        }

        .summary-card {
            position: relative;
            overflow: hidden;

            padding: 22px;

            background: #ffffff;

            border: 1px solid #e9eef5;
            border-radius: 18px;

            box-shadow:
                0 10px 30px rgba(24, 39, 75, 0.055);

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease;
        }

        .summary-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 16px 35px rgba(24, 39, 75, 0.10);
        }

        .summary-card::after {
            content: "";

            position: absolute;

            width: 90px;
            height: 90px;

            right: -35px;
            bottom: -35px;

            border-radius: 50%;

            background: #f3f7ff;
        }

        .summary-label {
            position: relative;
            z-index: 2;

            display: block;

            margin-bottom: 7px;

            font-size: 11px;
            font-weight: 600;

            color: #7b8798;

            text-transform: uppercase;
            letter-spacing: 0.7px;
        }

        .summary-value {
            position: relative;
            z-index: 2;

            font-size: 28px;
            line-height: 1;

            font-weight: 700;

            color: #172033;
        }

        /* =====================================================
           TABLE CARD
           ===================================================== */

        .table-card {
            background: #ffffff;

            border: 1px solid #e7ecf3;
            border-radius: 22px;

            padding: 25px;

            box-shadow:
                0 15px 45px rgba(24, 39, 75, 0.07);
        }

        .table-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;

            gap: 20px;

            margin-bottom: 20px;
        }

        .table-heading h2 {
            margin: 0;

            font-size: 19px;
            font-weight: 700;

            color: #172033;
        }

        .table-heading p {
            margin: 5px 0 0;

            font-size: 12px;

            color: #8a95a6;
        }

        .report-badge {
            display: inline-flex;
            align-items: center;

            padding: 8px 13px;

            border-radius: 30px;

            background: #f0f6ff;
            color: #0d6efd;

            font-size: 11px;
            font-weight: 700;
        }

        /* =====================================================
           DATATABLE
           ===================================================== */

        .table-responsive {
            overflow-x: auto;

            border: 1px solid #e8edf3;
            border-radius: 15px;
        }

        table.result-table {
            width: 100% !important;
            min-width: 1050px;

            margin: 0 !important;

            border-collapse: separate;
            border-spacing: 0;

            font-family: 'Montserrat', sans-serif !important;
        }

        table.result-table thead th {
            padding: 16px 14px !important;

            background: #f7f9fc !important;

            color: #566276 !important;

            border-top: 0 !important;
            border-bottom: 1px solid #e4e9f0 !important;

            font-size: 11px !important;
            font-weight: 700 !important;

            text-transform: uppercase;
            letter-spacing: 0.4px;

            white-space: nowrap;
        }

        table.result-table thead th:first-child {
            border-top-left-radius: 14px;
        }

        table.result-table thead th:last-child {
            border-top-right-radius: 14px;
        }

        table.result-table tbody td {
            padding: 17px 14px !important;

            vertical-align: middle !important;

            border-top: 0 !important;
            border-bottom: 1px solid #edf0f4 !important;

            color: #4b586b !important;

            font-size: 12px !important;
            font-weight: 500 !important;

            background: #ffffff !important;
        }

        table.result-table tbody tr {
            transition: background 0.2s ease;
        }

        table.result-table tbody tr:hover td {
            background: #f9fbff !important;
        }

        table.result-table tbody tr:last-child td {
            border-bottom: 0 !important;
        }

        .test-name {
            color: #18263d;

            font-weight: 700;

            line-height: 1.55;
        }

        .test-type {
            display: inline-flex;

            padding: 6px 10px;

            border-radius: 20px;

            background: #eef5ff;
            color: #0d6efd;

            font-size: 10px;
            font-weight: 700;

            white-space: nowrap;
        }

        .marks {
            font-weight: 700;

            color: #18263d;
        }

        .date-text {
            white-space: nowrap;

            font-size: 11px;

            color: #677386;

            font-weight: 600;
        }

        .count-pill {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            min-width: 34px;
            height: 30px;

            padding: 0 9px;

            border-radius: 9px;

            background: #f4f6f9;

            color: #344054;

            font-size: 11px;
            font-weight: 700;
        }

        .pass-pill {
            background: #eafaf1;
            color: #159957;
        }

        .fail-pill {
            background: #fff0f0;
            color: #dc3545;
        }

        .certificate-pill {
            background: #fff8df;
            color: #b77900;
        }

        .no-data {
            padding: 55px 20px !important;

            text-align: center;

            color: #8a95a6 !important;

            font-size: 13px !important;
        }

        .no-data strong {
            display: block;

            margin-bottom: 5px;

            color: #475467;

            font-size: 14px;
        }

        /* =====================================================
           DATATABLE CONTROLS
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

            font-size: 12px;
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
            font-size: 11px;

            background: #ffffff;
        }

        .dataTables_wrapper .dataTables_filter input:focus {
            border-color: #86b7fe !important;

            box-shadow:
                0 0 0 3px rgba(13, 110, 253, 0.08);
        }

        .dataTables_wrapper .dataTables_info {
            padding-top: 17px !important;

            color: #8993a3;

            font-size: 11px;
            font-weight: 500;
        }

        .dataTables_wrapper .dataTables_paginate {
            padding-top: 12px !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 6px 10px !important;

            border: 0 !important;
            border-radius: 8px !important;

            color: #64748b !important;

            font-size: 11px !important;
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

        @media (max-width: 1100px) {

            .summary-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

        }

        @media (max-width: 700px) {

            .report-page {
                padding: 20px 12px 40px;
            }

            .report-header {
                padding: 25px 22px;

                border-radius: 17px;
            }

            .report-title {
                font-size: 25px;
            }

            .summary-grid {
                grid-template-columns: 1fr;

                gap: 12px;
            }

            .table-card {
                padding: 15px;

                border-radius: 17px;
            }

            .table-heading {
                display: block;
            }

            .report-badge {
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

    List<List> resultReportList =
            (List<List>) request.getAttribute(
                    "resultReportList");

    if (resultReportList == null) {
        resultReportList =
                new ArrayList<List>();
    }

    int totalTests = resultReportList.size();

    int totalAttempts = 0;
    int totalPassed = 0;
    int totalFailed = 0;
    int totalCertificates = 0;

    for (List record : resultReportList) {

        if (record.size() >= 10) {

            totalAttempts +=
                    ((Number) record.get(6)).intValue();

            totalPassed +=
                    ((Number) record.get(7)).intValue();

            totalFailed +=
                    ((Number) record.get(8)).intValue();

            totalCertificates +=
                    ((Number) record.get(9)).intValue();
        }
    }

    DateFormat dateFormat =
            new SimpleDateFormat("yyyy-MM-dd");
%>

<div class="report-page">

    <div class="report-wrapper">

        <!-- =================================================
             HEADER
             ================================================= -->

        <div class="report-header">

            <div class="header-content">

                <div class="eyebrow">
                    ExamPortal Analytics
                </div>

                <h1 class="report-title">
                    Result Report
                </h1>

                <p class="report-subtitle">
                    Comprehensive performance summary of tests,
                    attempts, pass/fail statistics and certificates.
                </p>

            </div>

        </div>


        <!-- =================================================
             SUMMARY
             ================================================= -->

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
                    Total Attempts
                </span>

                <div class="summary-value">
                    <%=totalAttempts%>
                </div>

            </div>


            <div class="summary-card">

                <span class="summary-label">
                    Passed
                </span>

                <div class="summary-value">
                    <%=totalPassed%>
                </div>

            </div>


            <div class="summary-card">

                <span class="summary-label">
                    Certificates
                </span>

                <div class="summary-value">
                    <%=totalCertificates%>
                </div>

            </div>

        </div>


        <!-- =================================================
             RESULT TABLE
             ================================================= -->

        <div class="table-card">

            <div class="table-heading">

                <div>

                    <h2>
                        Test Performance Overview
                    </h2>

                    <p>
                        Overall result statistics for every
                        ExamPortal test.
                    </p>

                </div>

                <div class="report-badge">
                    <%=totalTests%> Tests
                </div>

            </div>


            <div class="table-responsive">

                <table
                    class="table result-table table-bordered table-striped table-hover dataTable js-exportable">

                    <thead>

                        <tr>

                            <th>
                                Test Name
                            </th>

                            <th>
                                Test Type
                            </th>

                            <th>
                                Max Marks
                            </th>

                            <th>
                                Test Opens
                            </th>

                            <th>
                                Test Closes
                            </th>

                            <th>
                                Total Attempt
                            </th>

                            <th>
                                Passed Count
                            </th>

                            <th>
                                Failed Count
                            </th>

                            <th>
                                Certificate Count
                            </th>

                        </tr>

                    </thead>


                    <tbody>

                    <%
                        if (resultReportList.size() == 0) {
                    %>

                        <tr>

                            <td
                                colspan="9"
                                class="no-data">

                                <strong>
                                    No Result Data Available
                                </strong>

                                No student has attempted any test yet.

                            </td>

                        </tr>

                    <%
                        } else {

                            for (List record :
                                    resultReportList) {

                                String openDate = "";

                                String closeDate = "";

                                if (record.get(3) != null) {
                                    openDate =
                                            dateFormat.format(
                                                    record.get(3));
                                }

                                if (record.get(4) != null) {
                                    closeDate =
                                            dateFormat.format(
                                                    record.get(4));
                                }

                                int totalAttempt =
                                        ((Number) record.get(6))
                                                .intValue();

                                int passedCount =
                                        ((Number) record.get(7))
                                                .intValue();

                                int failedCount =
                                        ((Number) record.get(8))
                                                .intValue();

                                int certificateCount =
                                        ((Number) record.get(9))
                                                .intValue();
                    %>

                        <tr>

                            <!-- TEST NAME -->

                            <td>

                                <div class="test-name">
                                    <%=record.get(1)%>
                                </div>

                            </td>


                            <!-- TEST TYPE -->

                            <td>

                                <span class="test-type">
                                    <%=record.get(2)%>
                                </span>

                            </td>


                            <!-- MAX MARKS -->

                            <td>

                                <span class="marks">
                                    <%=record.get(5)%>
                                </span>

                            </td>


                            <!-- OPEN DATE -->

                            <td>

                                <span class="date-text">
                                    <%=openDate%>
                                </span>

                            </td>


                            <!-- CLOSE DATE -->

                            <td>

                                <%
                                    if ("0001-01-01"
                                            .equals(closeDate)) {
                                %>

                                    <span class="date-text">
                                        No Close Date
                                    </span>

                                <%
                                    } else {
                                %>

                                    <span class="date-text">
                                        <%=closeDate%>
                                    </span>

                                <%
                                    }
                                %>

                            </td>


                            <!-- TOTAL ATTEMPT -->

                            <td>

                                <span class="count-pill">
                                    <%=totalAttempt%>
                                </span>

                            </td>


                            <!-- PASSED -->

                            <td>

                                <span class="count-pill pass-pill">
                                    <%=passedCount%>
                                </span>

                            </td>


                            <!-- FAILED -->

                            <td>

                                <span class="count-pill fail-pill">
                                    <%=failedCount%>
                                </span>

                            </td>


                            <!-- CERTIFICATE -->

                            <td>

                                <span class="count-pill certificate-pill">
                                    <%=certificateCount%>
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


<!-- =========================================================
     JQUERY
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