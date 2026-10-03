<%@ page language="java"
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="ISO-8859-1">
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <title>ExamPortal | Admin | Manage Section</title>

</head>

<body>

    <jsp:include page="menu.jsp" />

    <section class="content">

        <div class="body_scroll">

            <div class="block-header">

                <div class="row">

                    <div class="col-lg-7 col-md-6 col-sm-12">

                        <h2>Category</h2>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">
                                <a href="home.jsp">
                                    <i class="zmdi zmdi-home"></i>
                                    Home
                                </a>
                            </li>

                            <li class="breadcrumb-item active">
                                Section
                            </li>

                        </ul>

                        <button
                            class="btn btn-primary btn-icon mobile_menu"
                            type="button">

                            <i class="zmdi zmdi-sort-amount-desc"></i>

                        </button>

                    </div>

                    <div class="col-lg-5 col-md-6 col-sm-12">

                        <button
                            class="btn btn-primary btn-icon float-right right_icon_toggle_btn"
                            type="button">

                            <i class="zmdi zmdi-arrow-right"></i>

                        </button>

                    </div>

                </div>

            </div>

        </div>


        <div class="container-fluid">

            <div class="row clearfix">


                <!-- Message Card -->

                <div class="col-lg-12">

                    <div class="card">

                        <small>
                            Manage your Section in Section here.
                        </small>

                        <%
                            String sectionAddSucessMessage =
                                (String) request.getAttribute(
                                    "sectionAddSucessMessage"
                                );

                            String sectionAddFailedMessage =
                                (String) request.getAttribute(
                                    "sectionAddFailedMessage"
                                );

                            if (sectionAddSucessMessage != null) {
                        %>

                            <span style="align-content:center; color:green;">
                                <%=sectionAddSucessMessage%>
                            </span>

                        <%
                            }

                            if (sectionAddFailedMessage != null) {
                        %>

                            <span style="align-content:center; color:red;">
                                <%=sectionAddFailedMessage%>
                            </span>

                        <%
                            }
                        %>

                    </div>

                </div>


                <!-- Add Section -->

                <div class="col-lg-8 col-md-12">

                    <div class="card">

                        <%

                            String admin =
                                (String) session.getAttribute("adminLogin");

                            if (admin == null) {

                                response.sendRedirect("index.jsp");

                            } else {

                                ExamDaoImpl examDaoImpl =
                                    new ExamDaoImpl();

                                List<Exam> listOfExams =
                                    examDaoImpl.viewAllExam();

                        %>


                        <div class="row clearfix">

                            <div class="col-lg-12 col-md-12 col-sm-12">

                                <div class="card">


                                    <!-- Header -->

                                    <div class="header">

                                        <h2>
                                            <strong>Add</strong> New Section
                                        </h2>

                                    </div>


                                    <!-- Form Body -->

                                    <div class="body">

                                        <form
                                            class="form-horizontal"
                                            id="frm1"
                                            method="post">


                                            <!-- Operation -->

                                            <input
                                                type="hidden"
                                                name="operation"
                                                value="add">


                                            <!-- Section Name -->

                                            <div class="row clearfix">

                                                <div
                                                    class="col-lg-2 col-md-2 col-sm-4 form-control-label">

                                                    <label for="sectionName">
                                                        Section Name
                                                    </label>

                                                </div>


                                                <div
                                                    class="col-lg-10 col-md-10 col-sm-8">

                                                    <div class="form-group">

                                                        <input
                                                            name="sectionName"
                                                            id="sectionName"
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Section Name">

                                                    </div>

                                                </div>

                                            </div>


                                            <!-- Max Questions -->

                                            <div class="row clearfix">

                                                <div
                                                    class="col-lg-2 col-md-2 col-sm-4 form-control-label">

                                                    <label for="maxQuestion">
                                                        Max Questions
                                                    </label>

                                                </div>


                                                <div
                                                    class="col-lg-10 col-md-10 col-sm-8">

                                                    <div class="form-group">

                                                        <input
                                                            name="maxQuestion"
                                                            id="maxQuestion"
                                                            type="number"
                                                            class="form-control"
                                                            placeholder="eg. 10 / 25 / 50">

                                                    </div>

                                                </div>

                                            </div>


                                            <!-- Duration -->

                                            <div class="row clearfix">

                                                <div
                                                    class="col-lg-2 col-md-2 col-sm-4 form-control-label">

                                                    <label for="duration">
                                                        Duration
                                                    </label>

                                                </div>


                                                <div
                                                    class="col-lg-10 col-md-10 col-sm-8">

                                                    <div class="form-group">

                                                        <input
                                                            name="duration"
                                                            id="duration"
                                                            type="number"
                                                            class="form-control"
                                                            placeholder="eg. 10 / 25 / 50">

                                                    </div>

                                                </div>

                                            </div>


                                            <!-- Select Exam -->

                                            <div class="row clearfix">

                                                <div
                                                    class="col-lg-2 col-md-2 col-sm-4 form-control-label">

                                                    <label for="examId">
                                                        Select Exam
                                                    </label>

                                                </div>


                                                <div
                                                    class="col-lg-10 col-md-10 col-sm-8">

                                                    <div class="form-group">


                                                        <select
                                                            name="examId"
                                                            id="examId"
                                                            class="form-control"
                                                            style="
                                                                display:block !important;
                                                                width:100% !important;
                                                                height:45px !important;
                                                                padding:8px 12px !important;
                                                                border:1px solid #ced4da !important;
                                                                border-radius:4px !important;
                                                                background:#ffffff !important;
                                                                color:#333333 !important;
                                                                font-size:14px !important;
                                                                appearance:auto !important;
                                                                -webkit-appearance:auto !important;
                                                                -moz-appearance:auto !important;
                                                            ">


                                                            <!-- Default Option -->

                                                            <option value="">
                                                                Select Exam
                                                            </option>


                                                            <%

                                                                if (listOfExams != null
                                                                    && !listOfExams.isEmpty()) {

                                                                    for (Exam ex : listOfExams) {

                                                            %>


                                                            <option
                                                                value="<%=ex.getExamId()%>">

                                                                <%=ex.getExamName()%>

                                                            </option>


                                                            <%

                                                                    }

                                                                }

                                                            %>


                                                        </select>


                                                    </div>

                                                </div>

                                            </div>


                                            <!-- Add Button -->

                                            <div
                                                class="col-sm-8 offset-sm-2">

                                                <button
                                                    onclick="callAdd()"
                                                    type="button"
                                                    class="btn btn-raised btn-primary btn-round waves-effect">

                                                    Add New Section

                                                </button>

                                            </div>


                                        </form>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <%

                            }

                        %>

                    </div>

                </div>


                <!-- Operations -->

                <div class="col-lg-4 col-md-12">

                    <div class="card">


                        <div class="header">

                            <h2>
                                <strong>Operations</strong>
                            </h2>

                        </div>


                        <div class="body">

                            <ul
                                class="list-unstyled mb-0 widget-categories">


                                <li>

                                    <a href="addCategory.jsp">
                                        Add Section
                                    </a>

                                </li>


                                <li>

                                    <a href="sectionServlet?operation=view">
                                        View
                                    </a>

                                </li>


                            </ul>

                        </div>

                    </div>

                </div>


            </div>

        </div>

    </section>


    <!-- Add Section JavaScript -->

    <script>

        function callAdd() {

            var ff = document.getElementById("frm1");

            ff.action = "./sectionServlet";

            ff.submit();

        }

    </script>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />


</body>

</html>