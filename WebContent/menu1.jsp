<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.examhub.pojo.*" %>
<%@ page import="com.examhub.impl.*" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="ExamPortal Online Examination System">

    <meta name="author"
          content="ExamPortal">


    <!-- =========================================================
         FAVICON
         ========================================================= -->
         
          <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="icon"
          href="${pageContext.request.contextPath}/assets1/test.png">


    <!-- =========================================================
         BOOTSTRAP
         ========================================================= -->

    <link rel="stylesheet"
          type="text/css"
          href="${pageContext.request.contextPath}/assets1/css/bootstrap.min.css">


    <!-- =========================================================
         FONT AWESOME & ICONS FIX (CDN FALLBACKS INCLUDED)
         ========================================================= -->

    <link rel="stylesheet"
          type="text/css"
          href="${pageContext.request.contextPath}/assets1/css/font-awesome.css">

    <!-- ONLINE CDN FALLBACKS FOR ICONS TO ALWAYS WORK -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">


    <!-- =========================================================
         ORIGINAL TEMPLATE CSS
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/templatemo-breezed.css">


    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/owl-carousel.css">


    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets1/css/lightbox.css">


    <!-- =========================================================
         GLOBAL APPLICATION CSS
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/global.css">


    <!-- =========================================================
         EXAMPORTAL NAVBAR CUSTOM CSS
         ========================================================= -->

    <style>

        /* =========================================================
           GLOBAL HEADER
           ========================================================= */

        .header-area {
            position: sticky !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;

            width: 100% !important;
            height: 80px !important;
            min-height: 80px !important;

            background: #ffffff !important;

            z-index: 99999 !important;

            box-shadow: 0 2px 18px rgba(0, 0, 0, 0.08) !important;

            transition: all 0.25s ease !important;
        }


        /* =========================================================
           HEADER CONTAINER
           ========================================================= */

        .header-area .container {
            max-width: 1200px !important;
            height: 80px !important;

            margin: 0 auto !important;
        }


        .header-area .row {
            height: 80px !important;
            margin: 0 !important;
        }


        .header-area .col-12 {
            height: 80px !important;
            padding: 0 !important;
        }


        /* =========================================================
           MAIN NAV
           ========================================================= */

        .header-area .main-nav {
            width: 100% !important;
            height: 80px !important;
            min-height: 80px !important;

            display: flex !important;

            align-items: center !important;
            justify-content: space-between !important;

            position: relative !important;

            margin: 0 !important;
            padding: 0 !important;

            background: transparent !important;

            overflow: visible !important;
        }


        /* =========================================================
           LOGO
           ========================================================= */

        .header-area .main-nav .logo {

            display: flex !important;

            align-items: center !important;

            height: 80px !important;

            margin: 0 !important;
            padding: 0 !important;

            float: none !important;

            font-family: 'Montserrat', sans-serif !important;

            font-size: 25px !important;

            font-weight: 700 !important;

            letter-spacing: 1.5px !important;

            color: #202020 !important;

            text-decoration: none !important;

            white-space: nowrap !important;

            line-height: normal !important;

            transition: color 0.25s ease !important;
        }


        .header-area .main-nav .logo:hover {

            color: #3f6df6 !important;

            text-decoration: none !important;
        }


        /* =========================================================
           NAVIGATION
           ========================================================= */

        .header-area .main-nav .nav {

            display: flex;

            align-items: center;

            justify-content: flex-end;

            height: 80px;

            margin: 0 !important;
            padding: 0 !important;

            float: none !important;

            position: relative;

            background: transparent;

            list-style: none !important;

            overflow: visible;
        }


        /* =========================================================
           MAIN NAV ITEMS
           ========================================================= */

        .header-area .main-nav .nav > li {

            position: relative;

            height: 80px;

            display: flex;

            align-items: center;

            margin: 0 !important;

            padding: 0 !important;

            list-style: none !important;
        }


        /* =========================================================
           MAIN NAV LINKS
           ========================================================= */

        .header-area .main-nav .nav > li > a {

            position: relative;

            display: flex;

            align-items: center;

            justify-content: center;

            height: 80px;

            margin: 0 !important;

            padding: 0 15px !important;

            font-family: 'Montserrat', sans-serif !important;

            font-size: 12px !important;

            font-weight: 500 !important;

            letter-spacing: 0.3px !important;

            color: #252525 !important;

            background: transparent !important;

            text-decoration: none !important;

            white-space: nowrap !important;

            line-height: normal !important;

            transition:
                color 0.25s ease,
                background 0.25s ease !important;
        }


        .header-area .main-nav .nav > li > a:hover {

            color: #3f6df6 !important;

            text-decoration: none !important;
        }


        /* =========================================================
           REMOVE ALL OLD LINK PSEUDO ELEMENTS
           ========================================================= */

        .header-area .main-nav .nav > li > a::before {

            content: none !important;

            display: none !important;
        }


        /* =========================================================
           DROPDOWN ARROW
           ========================================================= */

        .header-area .main-nav .nav > li.submenu {

            padding-right: 0 !important;

            position: relative !important;
        }


        .header-area .main-nav .nav > li.submenu::after {

            content: "\f107" !important;

            font-family: "FontAwesome" !important;

            font-size: 11px !important;

            font-weight: normal !important;

            color: #555555 !important;

            position: absolute !important;

            right: 7px !important;

            top: 50% !important;

            margin-top: -6px !important;

            pointer-events: none !important;

            display: block !important;

            transition:
                color 0.2s ease,
                transform 0.2s ease !important;
        }


        .header-area .main-nav .nav > li.submenu:hover::after {

            color: #3f6df6 !important;

            transform: translateY(1px) !important;
        }


        /* =========================================================
           EXTRA RIGHT PADDING FOR DROPDOWN LINKS
           ========================================================= */

        .header-area .main-nav .nav > li.submenu > a {

            padding-right: 27px !important;
        }


        /* =========================================================
           DROPDOWN MAIN BOX (DESKTOP)
           ========================================================= */

        @media (min-width: 992px) {

            .header-area .main-nav .nav li.submenu > ul {

                position: absolute !important;

                top: 80px !important;

                left: 0 !important;

                width: 225px !important;

                min-width: 225px !important;

                max-width: 280px !important;

                margin: 0 !important;

                padding: 8px 0 !important;

                background: #ffffff !important;

                border: 1px solid #eeeeee !important;

                border-top: 2px solid #3f6df6 !important;

                border-radius: 0 0 10px 10px !important;

                box-shadow:
                    0 14px 35px rgba(0, 0, 0, 0.12) !important;

                display: block !important;

                opacity: 0 !important;

                visibility: hidden !important;

                transform: translateY(12px) !important;

                z-index: 999999 !important;

                overflow: hidden !important;

                list-style: none !important;

                transition:
                    opacity 0.22s ease,
                    visibility 0.22s ease,
                    transform 0.22s ease !important;
            }


            .header-area .main-nav .nav li.submenu:hover > ul {

                display: block !important;

                opacity: 1 !important;

                visibility: visible !important;

                transform: translateY(0) !important;

                z-index: 999999 !important;
            }

        }


        /* =========================================================
           DROPDOWN LIST ITEM
           ========================================================= */

        .header-area .main-nav .nav li.submenu > ul > li {

            display: block !important;

            width: 100% !important;

            height: auto !important;

            margin: 0 !important;

            padding: 0 !important;

            position: relative !important;

            list-style: none !important;

            background: #ffffff !important;
        }


        /* =========================================================
           DROPDOWN LINK
           ========================================================= */

        .header-area .main-nav .nav li.submenu > ul > li > a {

            display: flex !important;

            align-items: center !important;

            width: 100% !important;

            min-height: 43px !important;

            height: auto !important;

            margin: 0 !important;

            padding: 11px 20px !important;

            font-family: 'Montserrat', sans-serif !important;

            font-size: 12px !important;

            font-weight: 500 !important;

            line-height: 20px !important;

            letter-spacing: 0.1px !important;

            color: #333333 !important;

            background: #ffffff !important;

            text-decoration: none !important;

            white-space: nowrap !important;

            border: 0 !important;

            border-bottom: 1px solid #f3f3f3 !important;

            position: relative !important;

            transition:
                color 0.2s ease,
                background 0.2s ease,
                padding-left 0.2s ease !important;
        }


        .header-area .main-nav .nav li.submenu > ul > li:last-child > a {

            border-bottom: none !important;
        }


        .header-area .main-nav .nav li.submenu > ul > li > a::before,
        .header-area .main-nav .nav li.submenu > ul > li > a::after {

            content: none !important;

            display: none !important;
        }


        .header-area .main-nav .nav li.submenu > ul > li > a:hover {

            color: #3f6df6 !important;

            background: #f6f8ff !important;

            padding-left: 25px !important;

            text-decoration: none !important;

            box-shadow: inset 3px 0 0 #3f6df6 !important;
        }


        /* =========================================================
           ACTIVE LINK
           ========================================================= */

        .header-area .main-nav .nav > li > a.active {

            color: #3f6df6 !important;
        }


        .header-area.header-sticky .nav {

            margin-top: 0 !important;
        }


        .header-area .main-nav .nav li {

            padding-left: 0 !important;

            padding-right: 0 !important;
        }


        /* =========================================================
           MOBILE NAVIGATION OVERRIDES (FIXES CLICK & TOGGLE)
           ========================================================= */

        @media (max-width: 991px) {

           .header-area {
    height: 75px !important;
    min-height: 75px !important;

    position: fixed !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;

    width: 100% !important;

    z-index: 99999 !important;
}


            .header-area .container,
            .header-area .row,
            .header-area .col-12,
            .header-area .main-nav {

                height: 75px !important;

                min-height: 75px !important;
            }


            .header-area .main-nav .logo {

                height: 75px !important;

                font-size: 21px !important;

                letter-spacing: 1px !important;
            }


            /* Fixed: Removed display:none !important so jQuery slideToggle can reveal it */
            .header-area .main-nav .nav {
    display: none;

    position: fixed !important;

    top: 75px !important;
    left: 0 !important;
    right: 0 !important;

    width: 100vw !important;
    max-width: 100vw !important;

    height: calc(100vh - 75px) !important;
    max-height: calc(100vh - 75px) !important;

    margin: 0 !important;

    background: #ffffff !important;

    box-shadow: 0 10px 25px rgba(0,0,0,0.12) !important;

    padding: 0 !important;

    flex-direction: column !important;
    align-items: stretch !important;

    overflow-x: hidden !important;
    overflow-y: auto !important;

    -webkit-overflow-scrolling: touch !important;

    z-index: 99998 !important;
}

            .header-area .main-nav .nav > li {

                height: auto !important;

                width: 100% !important;

                display: block !important;

                border-bottom: 1px solid #f0f0f0 !important;
            }


            .header-area .main-nav .nav > li > a {

                height: 48px !important;

                display: flex !important;

                align-items: center !important;

                justify-content: space-between !important;

                padding: 0 20px !important;

                font-size: 13px !important;

                color: #222222 !important;

                border: none !important;

                background: transparent !important;
            }


            .header-area .main-nav .nav > li.submenu::after {

                display: none !important;
            }


            .header-area .main-nav .nav > li.submenu > a::after {

                content: "\f107" !important;

                font-family: "FontAwesome" !important;

                font-size: 13px !important;

                float: right !important;

                transition: transform 0.25s ease !important;
            }


            .header-area .main-nav .nav > li.submenu.open > a::after {

                transform: rotate(180deg) !important;
            }


.header-area .main-nav .nav li.submenu > ul {
    display: none !important;
    position: static !important;

    width: 100% !important;

    height: auto !important;
    max-height: none !important;

    background: #f8fafc !important;

    border: none !important;
    border-left: 4px solid #3f6df6 !important;

    box-shadow: none !important;

    padding: 5px 0 !important;
    margin: 0 !important;

    opacity: 1 !important;
    visibility: visible !important;
    transform: none !important;

    overflow: hidden !important;
}

.header-area .main-nav .nav li.submenu.open > ul {
    display: block !important;
}


            .header-area .main-nav .nav li.submenu > ul > li > a {

                padding: 10px 25px !important;

                background: transparent !important;

                font-size: 12px !important;

                color: #4b5563 !important;

                border: none !important;
            }


          .header-area .main-nav .menu-trigger {
    display: flex !important;

    /* align-items: center !important; */
    justify-content: center !important;

    position: absolute !important;

    right: 15px !important;
    top: 17px !important;

    width: 42px !important;
    height: 40px !important;

    margin: 0 !important;
    padding: 0 !important;

    cursor: pointer !important;

    z-index: 100000 !important;

    background: #f4f6fa !important;

    border-radius: 8px !important;
    border: 1px solid #e2e8f0 !important;

    text-indent: 0 !important;

    box-sizing: border-box !important;
}


            .header-area .main-nav .menu-trigger span,
.header-area .main-nav .menu-trigger span::before,
.header-area .main-nav .menu-trigger span::after {
    box-sizing: border-box !important;
}

.header-area .main-nav .menu-trigger span {
    position: relative !important;
    display: block !important;

    width: 22px !important;
    height: 2px !important;

    margin: 0 !important;
    padding: 0 !important;

    background-color: #1e293b !important;
}

.header-area .main-nav .menu-trigger span::before,
.header-area .main-nav .menu-trigger span::after {
    position: absolute !important;

    left: 0 !important;

    width: 22px !important;
    height: 2px !important;

    background-color: #1e293b !important;

    content: "" !important;
}

.header-area .main-nav .menu-trigger span::before {
    top: -7px !important;
}

.header-area .main-nav .menu-trigger span::after {
    top: 7px !important;
}

.header-area .main-nav .menu-trigger.active span {
    background-color: transparent !important;
}

.header-area .main-nav .menu-trigger.active span::before {
    top: 0 !important;
    transform: rotate(45deg) !important;
}

.header-area .main-nav .menu-trigger.active span::after {
    top: 0 !important;
    transform: rotate(-45deg) !important;
}

            /* PERFECT CENTERED X */

.header-area .main-nav .menu-trigger.active span {
    background-color: transparent !important;
    width: 22px !important;
    height: 2px !important;
}

.header-area .main-nav .menu-trigger.active span::before,
.header-area .main-nav .menu-trigger.active span::after {
    left: 0 !important;
    top: 0 !important;

    width: 22px !important;
    height: 2px !important;

    margin: 0 !important;
    padding: 0 !important;

    background-color: #1e293b !important;

    transform-origin: center center !important;
}

.header-area .main-nav .menu-trigger.active span::before {
    transform: rotate(45deg) !important;
}

.header-area .main-nav .menu-trigger.active span::after {
    transform: rotate(-45deg) !important;
}


        /* =========================================================
           DESKTOP NAV SPACING
           ========================================================= */

        @media (min-width: 992px) {

            .header-area .main-nav .nav > li > a {

                padding-left: 14px !important;

                padding-right: 14px !important;
            }


            .header-area .main-nav .nav > li.submenu > a {

                padding-right: 28px !important;
            }

            .header-area .main-nav .menu-trigger {

                display: none !important;
            }

        }


        @media (min-width: 1200px) {

            .header-area .main-nav .nav > li > a {

                padding-left: 15px !important;

                padding-right: 15px !important;
            }


            .header-area .main-nav .nav > li.submenu > a {

                padding-right: 29px !important;
            }

        }


      .header-area,
.header-area .container,
.header-area .row,
.header-area .col-12,
.header-area .main-nav {
    overflow: visible !important;
}

        .scroll-down {

            display: none !important;
        }

    </style>

</head>


<body>


    <!-- =========================================================
         PRELOADER
         ========================================================= -->

    <div id="preloader">

        <div class="jumper">

            <div></div>

            <div></div>

            <div></div>

        </div>

    </div>


    <!-- =========================================================
         EXAMPORTAL HEADER
         ========================================================= -->

    <header class="header-area header-sticky background-header">

        <div class="container">

            <div class="row">

                <div class="col-12">

                    <nav class="main-nav">


                        <!-- =================================================
                             LOGO
                             ================================================= -->

                        <a href="studentHome.jsp"
                           class="logo">

                            EXAMPORTAL

                        </a>


                        <!-- =================================================
                             NAVIGATION
                             ================================================= -->

                        <ul class="nav">


                            <!-- =================================================
                                 EXAMHUB
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    EXAMHUB

                                </a>

                                <ul>

                                    <li>
                                        <a href="studentHome.jsp">
                                            Home
                                        </a>
                                    </li>


                                    <li>
                                        <a href="blogServlet?operation=viewAllBlog&type=student">
                                            Blogs
                                        </a>
                                    </li>


                                    <li>
                                        <a href="testServlet?operation=viewUpcomingTest">
                                            Upcoming Exam
                                        </a>
                                    </li>


                                    <li>
                                        <a href="scope.jsp">
                                            Scope &amp; Importance
                                        </a>
                                    </li>


                                    <li>
                                        <a href="sucessStories.jsp">
                                            Success Stories
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <!-- =================================================
                                 STUDENT SESSION
                                 ================================================= -->

                            <%

                                String studentLogin =
                                        (String) session.getAttribute("studentLogin");

                                if (studentLogin != null) {

                            %>


                            <!-- =================================================
                                 RESOURCES
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    RESOURCES

                                </a>

                                <ul>

                                    <li>
                                        <a href="jobListing?operation=view">
                                            Placement
                                        </a>
                                    </li>


                                    <li>
                                        <a href="nontecnical.jsp">
                                            Interview Preparation
                                        </a>
                                    </li>


                                    <li>
                                        <a href="interviewQuestion.jsp">
                                            Question Bank
                                        </a>
                                    </li>


                                    <li>
                                        <a href="rules.jsp">
                                            Rules &amp; Regulations
                                        </a>
                                    </li>


                                    <li>
                                        <a href="studyMaterial.jsp">
                                            Study Material
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <!-- =================================================
                                 PRACTICE TEST
                                 ================================================= -->

                            <li>

                                <a href="testServlet?operation=seachTestPapers&type=practice">

                                    PRACTICE TEST

                                </a>

                            </li>


                            <!-- =================================================
                                 EXAM
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    EXAM

                                </a>

                                <ul>

                                    <%

                                        List<Category> listOfCategories =
                                                new CategoryDaoImpl().viewAllCategories();

                                        if (listOfCategories != null) {

                                            for (Category cat : listOfCategories) {

                                    %>

                                    <li>

                                        <a href="testServlet?operation=seachTestPapers&type=Practice%20Test&categoryId=<%=cat.getCategoryId()%>">

                                            <%=cat.getCategoryName()%>

                                        </a>

                                    </li>

                                    <%

                                            }

                                        }

                                    %>

                                </ul>

                            </li>


                            <!-- =================================================
                                 MY ACCOUNT
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    MY ACCOUNT

                                </a>

                                <ul>

                                    <li>
                                        <a href="changepassword.jsp">
                                            Change Password
                                        </a>
                                    </li>


                                    <li>
                                        <a href="studentServlet?operation=viewProfile">
                                            Edit Profile
                                        </a>
                                    </li>


                                    <li>
                                        <a href="studentResult.jsp">
                                            Result
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <!-- =================================================
                                 ABOUT
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    ABOUT

                                </a>

                                <ul>

                                    <li>
                                        <a href="aboutus.jsp">
                                            ExamPortal
                                        </a>
                                    </li>


                                    <li>
                                        <a href="contactus.jsp">
                                            Contact Us
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <!-- =================================================
                                 LOGOUT
                                 ================================================= -->

                            <li>

                                <a href="studentLogin?operation=logout">

                                    LOGOUT

                                </a>

                            </li>


                            <%

                                } else {

                            %>


                            <!-- =================================================
                                 ABOUT - LOGGED OUT
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    ABOUT

                                </a>

                                <ul>

                                    <li>
                                        <a href="aboutus.jsp">
                                            ExamPortal
                                        </a>
                                    </li>


                                    <li>
                                        <a href="contactus.jsp">
                                            Contact Us
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <!-- =================================================
                                 LOGIN
                                 ================================================= -->

                            <li class="submenu">

                                <a href="javascript:void(0);">

                                    LOGIN

                                </a>

                                <ul>

                                    <li>
                                        <a href="studentLogin.jsp">
                                            Student
                                        </a>
                                    </li>


                                    <li>
                                        <a href="adminLogin.jsp">
                                            Admin
                                        </a>
                                    </li>

                                </ul>

                            </li>


                            <%

                                }

                            %>


                        </ul>


                        <!-- =================================================
                             MOBILE MENU TRIGGER
                             ================================================= -->

                        <a class="menu-trigger" id="mainMenuTrigger">

                            <span></span>

                        </a>


                    </nav>

                </div>

            </div>

        </div>

    </header>


    <!-- =========================================================
         SCRIPT INITIALIZATION FOR MENU CLICK & TOGGLE
         ========================================================= -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {

            // Hamburger click on mobile
          $('#mainMenuTrigger').off('click').on('click', function(e) {

    e.preventDefault();

    $(this).toggleClass('active');

    $('.header-area .main-nav .nav').stop(true, true).slideToggle(250);

    $('body').toggleClass('mobile-menu-open');
    $('html').toggleClass('mobile-menu-open');

});

            // Submenu click on mobile screens
            $('.header-area .main-nav .nav > li.submenu > a').off('click').on('click', function(e) {
                if ($(window).width() <= 991) {
                    e.preventDefault();
                    var $parent = $(this).parent('li.submenu');
                    $parent.toggleClass('open');
                    $parent.children('ul').stop(true, true).slideToggle(200);
                    $parent.siblings('li.submenu').removeClass('open').children('ul').slideUp(200);
                }
            });

            // Clean inline styles on resize
            $(window).on('resize', function() {
                if ($(window).width() > 991) {
                    $('.header-area .main-nav .nav').removeAttr('style');
                    $('.header-area .main-nav .nav li.submenu ul').removeAttr('style');
                    $('#mainMenuTrigger').removeClass('active');
                    $('.header-area .main-nav .nav li.submenu').removeClass('open');
                }
            });

        });
    </script>

</body>

</html>