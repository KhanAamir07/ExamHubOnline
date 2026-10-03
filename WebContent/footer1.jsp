<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- =========================================================
     EXAMPORTAL PREMIUM FOOTER
     ========================================================= -->

<style>

    /* =====================================================
       FOOTER MAIN
       ===================================================== */

    .examportal-footer {
        position: relative;
        background: #111827;
        color: #ffffff;
        margin-top: 70px;
        overflow: hidden;
        font-family: 'Montserrat', sans-serif;
    }


    /* Decorative Background */

    .examportal-footer::before {
        content: "";
        position: absolute;

        width: 400px;
        height: 400px;

        border-radius: 50%;

        background: rgba(49, 87, 213, 0.12);

        top: -200px;
        left: -150px;

        pointer-events: none;
    }

    .examportal-footer::after {
        content: "";
        position: absolute;

        width: 350px;
        height: 350px;

        border-radius: 50%;

        background: rgba(91, 118, 232, 0.08);

        bottom: -180px;
        right: -100px;

        pointer-events: none;
    }


    /* =====================================================
       FOOTER CONTAINER
       ===================================================== */

    .examportal-footer-container {
        position: relative;
        z-index: 2;

        width: 90%;
        max-width: 1200px;

        margin: 0 auto;

        padding: 65px 0 30px;
    }


    /* =====================================================
       TOP FOOTER
       ===================================================== */

    .examportal-footer-grid {

        display: grid;

        grid-template-columns:
            1.5fr 1fr 1fr 1.2fr;

        gap: 45px;

        padding-bottom: 45px;

        border-bottom: 1px solid #2c3547;
    }


    /* =====================================================
       BRAND
       ===================================================== */

    .footer-brand {
        padding-right: 20px;
    }

    .footer-logo {
        display: flex;

        align-items: center;

        gap: 12px;

        margin-bottom: 18px;
    }


    /* Logo Icon */

    .footer-logo-icon {

        width: 48px;
        height: 48px;

        border-radius: 13px;

        display: flex;

        align-items: center;
        justify-content: center;

        background:
            linear-gradient(
                135deg,
                #3157d5,
                #6280ed
            );

        color: #ffffff;

        font-size: 20px;

        font-weight: 700;

        box-shadow:
            0 8px 20px rgba(49, 87, 213, 0.30);
    }


    .footer-logo-text {
        font-size: 25px;

        font-weight: 700;

        letter-spacing: -0.5px;
    }

    .footer-logo-text span {
        color: #5f7ff0;
    }


    .footer-brand-description {

        color: #9ca7b8;

        font-size: 14px;

        line-height: 1.8;

        max-width: 390px;

        margin: 0 0 22px;
    }


    /* =====================================================
       SOCIAL ICONS
       ===================================================== */

    .footer-social {

        display: flex;

        align-items: center;

        gap: 10px;
    }

    .footer-social a {

        width: 38px;
        height: 38px;

        border-radius: 9px;

        display: flex;

        align-items: center;
        justify-content: center;

        background: #1c2535;

        border: 1px solid #303a4d;

        color: #b9c3d3;

        text-decoration: none;

        font-size: 14px;

        font-weight: 600;

        transition: all 0.3s ease;
    }

    .footer-social a:hover {

        background: #3157d5;

        border-color: #3157d5;

        color: #ffffff;

        transform: translateY(-3px);

        box-shadow:
            0 7px 18px rgba(49, 87, 213, 0.25);
    }


    /* =====================================================
       FOOTER HEADINGS
       ===================================================== */

    .footer-column h3 {

        margin: 0 0 20px;

        color: #ffffff;

        font-size: 16px;

        font-weight: 600;

        position: relative;

        padding-bottom: 10px;
    }

    .footer-column h3::after {

        content: "";

        position: absolute;

        left: 0;
        bottom: 0;

        width: 32px;
        height: 2px;

        background: #4e6fe3;

        border-radius: 5px;
    }


    /* =====================================================
       FOOTER LINKS
       ===================================================== */

    .footer-links {

        list-style: none;

        padding: 0;
        margin: 0;
    }

    .footer-links li {

        margin-bottom: 11px;
    }

    .footer-links a {

        color: #9ca7b8;

        text-decoration: none;

        font-size: 14px;

        display: inline-flex;

        align-items: center;

        gap: 7px;

        transition: all 0.25s ease;
    }

    .footer-links a::before {

        content: "›";

        color: #4e6fe3;

        font-size: 17px;

        transition: transform 0.25s ease;
    }

    .footer-links a:hover {

        color: #ffffff;

        transform: translateX(4px);
    }

    .footer-links a:hover::before {

        transform: translateX(3px);
    }


    /* =====================================================
       CONTACT
       ===================================================== */

    .footer-contact-item {

        display: flex;

        align-items: flex-start;

        gap: 12px;

        margin-bottom: 17px;
    }

    .footer-contact-icon {

        width: 35px;
        height: 35px;

        min-width: 35px;

        border-radius: 8px;

        background: #1c2535;

        border: 1px solid #303a4d;

        display: flex;

        align-items: center;
        justify-content: center;

        color: #5f7ff0;

        font-size: 14px;
    }

    .footer-contact-text {

        color: #9ca7b8;

        font-size: 13px;

        line-height: 1.6;
    }

    .footer-contact-text strong {

        display: block;

        color: #dce2ec;

        font-size: 13px;

        font-weight: 500;

        margin-bottom: 2px;
    }

    .footer-contact-text a {

        color: #9ca7b8;

        text-decoration: none;

        word-break: break-word;
    }

    .footer-contact-text a:hover {

        color: #ffffff;
    }


    /* =====================================================
       TECHNOLOGY STRIP
       ===================================================== */

    .footer-tech-section {

        padding: 30px 0;

        border-bottom: 1px solid #2c3547;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 25px;
    }

    .footer-tech-title {

        color: #ffffff;

        font-size: 14px;

        font-weight: 600;

        white-space: nowrap;
    }

    .footer-tech-list {

        display: flex;

        flex-wrap: wrap;

        justify-content: flex-end;

        gap: 8px;
    }

    .footer-tech {

        padding: 7px 12px;

        border-radius: 20px;

        border: 1px solid #303a4d;

        background: #182131;

        color: #9ca7b8;

        font-size: 11px;

        font-weight: 500;
    }


    /* =====================================================
       BOTTOM FOOTER
       ===================================================== */

    .footer-bottom {

        padding-top: 25px;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 20px;
    }

    .footer-copyright {

        color: #7f8a9c;

        font-size: 12px;

        line-height: 1.7;
    }

    .footer-copyright strong {

        color: #dce2ec;

        font-weight: 500;
    }


    .footer-developer {

        color: #7f8a9c;

        font-size: 12px;

        text-align: right;
    }

    .footer-developer a {

        color: #5f7ff0;

        text-decoration: none;

        font-weight: 600;
    }

    .footer-developer a:hover {

        color: #8da4ff;
    }


    /* =====================================================
       BACK TO TOP
       ===================================================== */

    .footer-top-button {

        position: absolute;

        right: 0;

        bottom: 72px;

        width: 40px;
        height: 40px;

        border-radius: 10px;

        display: flex;

        align-items: center;
        justify-content: center;

        background: #3157d5;

        color: #ffffff;

        text-decoration: none;

        font-size: 18px;

        transition: all 0.3s ease;
    }

    .footer-top-button:hover {

        background: #4566d5;

        color: #ffffff;

        transform: translateY(-3px);

        box-shadow:
            0 8px 20px rgba(49, 87, 213, 0.30);
    }


    /* =====================================================
       RESPONSIVE
       ===================================================== */

    @media (max-width: 1000px) {

        .examportal-footer-grid {

            grid-template-columns:
                repeat(2, 1fr);

            gap: 35px;
        }

        .footer-tech-section {

            flex-direction: column;

            align-items: flex-start;
        }

        .footer-tech-list {

            justify-content: flex-start;
        }

    }


    @media (max-width: 650px) {

        .examportal-footer-container {

            padding: 50px 0 25px;
        }

        .examportal-footer-grid {

            grid-template-columns: 1fr;

            gap: 32px;
        }

        .footer-brand {

            padding-right: 0;
        }

        .footer-bottom {

            flex-direction: column;

            align-items: flex-start;
        }

        .footer-developer {

            text-align: left;
        }

        .footer-top-button {

            right: 0;

            bottom: 105px;
        }

        .footer-tech-list {

            gap: 7px;
        }

    }

</style>


<!-- =========================================================
     FOOTER
     ========================================================= -->

<footer class="examportal-footer">

    <div class="examportal-footer-container">


        <!-- =================================================
             FOOTER MAIN GRID
             ================================================= -->

        <div class="examportal-footer-grid">


            <!-- =============================================
                 BRAND
                 ============================================= -->

            <div class="footer-brand">

                <div class="footer-logo">

                    <div class="footer-logo-icon">
                        EP
                    </div>

                    <div class="footer-logo-text">
                        Exam<span>Portal</span>
                    </div>

                </div>


                <p class="footer-brand-description">

                    ExamPortal is an online examination and learning
                    platform designed to help students prepare,
                    practice, participate in examinations and
                    evaluate their performance.

                </p>


                <!-- Social / Professional Links -->

                <div class="footer-social">

                    <a
                        href="#"
                        title="LinkedIn">
                        in
                    </a>

                    <a
                        href="#"
                        title="GitHub">
                        Git
                    </a>

                    <a
                        href="mailto:aamirkhan91613216@gmail.com"
                        title="Email">
                        @
                    </a>

                </div>

            </div>


            <!-- =============================================
                 QUICK LINKS
                 ============================================= -->

<div class="footer-column">

    <h3>
        Quick Links
    </h3>

    <ul class="footer-links">

        <li>
            <a href="home.jsp">
                Home
            </a>
        </li>

        <li>
            <a href="aboutus.jsp">
                About Us
            </a>
        </li>

        <li>
            <a href="blog.jsp">
                Blogs
            </a>
        </li>

        <li>
            <a href="onlineTest.jsp">
                Online Test
            </a>
        </li>

        <li>
            <a href="sucessStories.jsp">
                Success Stories
            </a>
        </li>

    </ul>

</div>


<!-- =============================================
     STUDENT LINKS
     ============================================= -->

<div class="footer-column">

    <h3>
        Student Area
    </h3>

    <ul class="footer-links">

        <li>
            <a href="studentHome.jsp">
                Student Dashboard
            </a>
        </li>

        <li>
            <a href="studyMaterial.jsp">
                Study Material
            </a>
        </li>

        <li>
            <a href="onlineTest.jsp">
                Online Test
            </a>
        </li>

        <li>
            <a href="studentResult.jsp">
                Student Result
            </a>
        </li>

        <li>
            <a href="studentReport.jsp">
                Student Report
            </a>
        </li>

    </ul>

</div>

            <!-- =============================================
                 CONTACT
                 ============================================= -->

            <div class="footer-column">

                <h3>
                    Developer
                </h3>


                <div class="footer-contact-item">

                    <div class="footer-contact-icon">
                        👤
                    </div>

                    <div class="footer-contact-text">

                        <strong>
                            Developed By
                        </strong>

                        Mohammad Aamir Khan

                    </div>

                </div>


                <div class="footer-contact-item">

                    <div class="footer-contact-icon">
                        @
                    </div>

                    <div class="footer-contact-text">

                        <strong>
                            Email
                        </strong>

                        <a href="mailto:aamirkhan91613216@gmail.com">
                            aamirkhan91613216@gmail.com
                        </a>

                    </div>

                </div>


                <div class="footer-contact-item">

                    <div class="footer-contact-icon">
                        ✓
                    </div>

                    <div class="footer-contact-text">

                        <strong>
                            Project
                        </strong>

                        ExamPortal

                    </div>

                </div>

            </div>


        </div>


        <!-- =================================================
             TECHNOLOGY SECTION
             ================================================= -->

        <div class="footer-tech-section">

            <div class="footer-tech-title">

                Built With

            </div>


            <div class="footer-tech-list">

                <span class="footer-tech">
                    Java
                </span>

                <span class="footer-tech">
                    JSP
                </span>

                <span class="footer-tech">
                    Servlet
                </span>

                <span class="footer-tech">
                    JDBC
                </span>

                <span class="footer-tech">
                    MySQL
                </span>

                <span class="footer-tech">
                    Bootstrap
                </span>

                <span class="footer-tech">
                    JavaScript
                </span>

                <span class="footer-tech">
                    Apache Tomcat
                </span>

            </div>

        </div>


        <!-- =================================================
             BOTTOM
             ================================================= -->

        <div class="footer-bottom">


            <div class="footer-copyright">

               &copy; 2025 <strong>ExamPortal</strong>. All Rights Reserved.
                

            </div>


            <div class="footer-developer">

                Designed & Developed by

                <a href="mailto:aamirkhan91613216@gmail.com">

                    Mohammad Aamir Khan

                </a>

            </div>


        </div>


        <!-- =================================================
             BACK TO TOP
             ================================================= -->

        <a
            href="#"
            class="footer-top-button"
            title="Back to Top">

            ↑

        </a>


    </div>

</footer>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script>

    /*
     * Back To Top
     */

    document.addEventListener("DOMContentLoaded", function () {

        var topButton =
            document.querySelector(".footer-top-button");

        if (topButton) {

            topButton.addEventListener("click", function (event) {

                event.preventDefault();

                window.scrollTo({
                    top: 0,
                    behavior: "smooth"
                });

            });

        }

    });

</script>


<!-- =========================================================
     EXISTING PROJECT JAVASCRIPT
     ========================================================= -->

<!-- jQuery -->
<script src="assets1/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets1/js/popper.js"></script>
<script src="assets1/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets1/js/owl-carousel.js"></script>
<script src="assets1/js/scrollreveal.min.js"></script>
<script src="assets1/js/waypoints.min.js"></script>
<script src="assets1/js/jquery.counterup.min.js"></script>
<script src="assets1/js/imgfix.min.js"></script>
<script src="assets1/js/slick.js"></script>
<script src="assets1/js/lightbox.js"></script>
<script src="assets1/js/isotope.js"></script>

<!-- Global Init -->
<script src="assets1/js/custom.js"></script>