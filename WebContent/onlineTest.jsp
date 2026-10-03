<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.*"%>
<%@ page import="com.examhub.impl.*"%>
<%@ page autoFlush="true" buffer="20kb"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Online Test</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/global.css">

    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .exam-page {
            min-height: 100vh;
            padding: 115px 18px 80px;
        }

        .exam-container {
            max-width: 1050px;
            margin: 0 auto;
        }

        /* TOP HEADER */

        .exam-header {
            position: relative;
            overflow: hidden;
            margin-bottom: 25px;
            padding: 30px 35px;
            border-radius: 22px;
            background: linear-gradient(
                135deg,
                #0f172a 0%,
                #172554 55%,
                #2563eb 100%
            );
            box-shadow: 0 16px 40px rgba(15, 23, 42, .14);
        }

        .exam-header::before {
            content: "";
            position: absolute;
            width: 260px;
            height: 260px;
            right: -100px;
            top: -140px;
            border-radius: 50%;
            background: rgba(255,255,255,.06);
        }

        .exam-header-content {
            position: relative;
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 25px;
        }

        .exam-label {
            display: inline-block;
            margin-bottom: 10px;
            padding: 6px 12px;
            border: 1px solid rgba(255,255,255,.18);
            border-radius: 50px;
            color: #dbeafe;
            background: rgba(255,255,255,.07);
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .exam-title {
            margin: 0;
            color: #ffffff;
            font-size: 25px;
            font-weight: 800;
        }

        .exam-type {
            margin-top: 8px;
            color: #cbd5e1;
            font-size: 11px;
        }

        /* TIMER */

        .timer-box {
            min-width: 145px;
            padding: 15px 18px;
            border: 1px solid rgba(255,255,255,.15);
            border-radius: 14px;
            background: rgba(255,255,255,.08);
            text-align: center;
        }

        .timer-label {
            display: block;
            margin-bottom: 5px;
            color: #cbd5e1;
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        #mins,
        #secs {
            color: #ffffff;
            font-size: 19px;
            font-weight: 800;
        }

        #end {
            color: #fca5a5;
            font-size: 10px;
        }

        /* QUESTION CARD */

        .questions-card {
            overflow: hidden;
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            background: #ffffff;
            box-shadow: 0 10px 35px rgba(15,23,42,.06);
        }

        .questions-header {
            padding: 23px 28px;
            border-bottom: 1px solid #edf1f5;
            background: #ffffff;
        }

        .questions-header h2 {
            margin: 0;
            color: #0f172a;
            font-size: 17px;
            font-weight: 800;
        }

        .questions-header p {
            margin: 7px 0 0;
            color: #64748b;
            font-size: 10px;
        }

        .questions-body {
            padding: 25px;
        }

        /* QUESTION */

        .question-card {
            margin-bottom: 22px;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            background: #ffffff;
            overflow: hidden;
            transition: border-color .2s ease,
                        box-shadow .2s ease;
        }

        .question-card:hover {
            border-color: #cbd5e1;
            box-shadow: 0 7px 22px rgba(15,23,42,.05);
        }

        .question-heading {
            padding: 18px 20px;
            background: #f8fafc;
            border-bottom: 1px solid #edf1f5;
        }

        .question-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 38px;
            height: 25px;
            margin-right: 9px;
            border-radius: 7px;
            background: #2563eb;
            color: #ffffff;
            font-size: 9px;
            font-weight: 800;
        }

        .question-text {
            color: #172033;
            font-size: 12px;
            font-weight: 700;
            line-height: 1.7;
        }

        .options {
            padding: 12px 15px;
        }

        .option {
            position: relative;
            display: flex;
            align-items: center;
            min-height: 48px;
            margin: 7px 0;
            padding: 0 15px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            background: #ffffff;
            cursor: pointer;
            transition: all .2s ease;
        }

        .option:hover {
            border-color: #93c5fd;
            background: #eff6ff;
        }

        .option input[type="radio"] {
            position: static !important;
            width: 16px !important;
            height: 16px !important;
            min-width: 16px !important;
            margin: 0 12px 0 0 !important;
            padding: 0 !important;
            opacity: 1 !important;
            appearance: auto !important;
            cursor: pointer;
        }

        .option-text {
            color: #475569;
            font-size: 11px;
            line-height: 1.5;
        }

        /* SUBMIT AREA */

        .submit-area {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-top: 10px;
            padding: 22px 25px;
            border-top: 1px solid #edf1f5;
            background: #f8fafc;
        }

        .submit-note {
            color: #64748b;
            font-size: 10px;
            line-height: 1.6;
        }

        .submit-note strong {
            color: #334155;
        }

        .submit-btn {
            min-width: 155px;
            height: 48px;
            padding: 0 25px;
            border: 0;
            border-radius: 11px;
            background: #2563eb;
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(37,99,235,.20);
            transition: all .2s ease;
        }

        .submit-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 11px 25px rgba(37,99,235,.26);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        @media (max-width: 700px) {

            .exam-page {
                padding: 95px 12px 60px;
            }

            .exam-header {
                padding: 25px 22px;
            }

            .exam-header-content {
                align-items: flex-start;
                flex-direction: column;
            }

            .timer-box {
                width: 100%;
            }

            .questions-body {
                padding: 15px;
            }

            .questions-header {
                padding: 20px;
            }

            .submit-area {
                align-items: stretch;
                flex-direction: column;
            }

            .submit-btn {
                width: 100%;
            }

        }

        @media (max-width: 480px) {

            .exam-title {
                font-size: 21px;
            }

            .question-heading {
                padding: 15px;
            }

            .option {
                min-height: 45px;
                padding: 0 12px;
            }

        }

    </style>

</head>


<%

    OnlineTest onlineTestObject =
        (OnlineTest) request.getAttribute("onlineTestObject");

    String studentLogin =
        (String) session.getAttribute("studentLogin");

    if (studentLogin != null && onlineTestObject != null) {

%>


<body>

    <jsp:include page="menu1.jsp" />


    <main class="exam-page">

        <div class="exam-container">


            <!-- EXAM HEADER -->

            <section class="exam-header">

                <div class="exam-header-content">

                    <div>

                        <span class="exam-label">
                            Online Examination
                        </span>

                        <h1 class="exam-title">
                            <%=onlineTestObject.getTestName()%>
                        </h1>

                        <div class="exam-type">
                            <%=onlineTestObject.getType()%>
                            &nbsp; • &nbsp;
                            <%=onlineTestObject.getMaxQuestion()%> Questions
                            &nbsp; • &nbsp;
                            <%=onlineTestObject.getMaxMarks()%> Marks
                        </div>

                    </div>


                    <div class="timer-box">

                        <span class="timer-label">
                            Time Remaining
                        </span>

                        <span id="mins">--</span>
                        <span id="secs">--</span>

                        <div id="end"></div>

                    </div>

                </div>

            </section>


            <!-- QUESTIONS -->

            <section class="questions-card">


                <div class="questions-header">

                    <h2>
                        Answer All Questions
                    </h2>

                    <p>
                        Select one option for each question. Review your answers before submitting.
                    </p>

                </div>


                <form
                    action="${pageContext.request.contextPath}/attemptTestServlet"
                    method="post"
                    id="frm">


                    <!-- REQUIRED BACKEND PARAMETERS -->

                    <input
                        type="hidden"
                        name="operation"
                        value="submitTest">

                    <input
                        type="hidden"
                        name="testId"
                        value="<%=onlineTestObject.getTestId()%>">

                    <input
                        type="hidden"
                        name="testType"
                        value="<%=onlineTestObject.getType()%>">

                    <input
                        type="hidden"
                        name="testMaxQuestions"
                        value="<%=onlineTestObject.getMaxQuestion()%>">

                    <input
                        type="hidden"
                        name="testMaxMarks"
                        value="<%=onlineTestObject.getMaxMarks()%>">

                    <input
                        type="hidden"
                        name="examId"
                        value="<%=onlineTestObject.getExamId()%>">


                    <div class="questions-body">


                        <%

                            for (int i = 0;
                                 i < onlineTestObject.getQuestionSet().size();
                                 i++) {

                                Question q =
                                    onlineTestObject.getQuestionSet().get(i);

                                List<String> options =
                                    new ArrayList<>();

                                options.add(q.getOption1());
                                options.add(q.getOption2());
                                options.add(q.getOption3());
                                options.add(q.getOption4());

                                Collections.shuffle(options);

                        %>


                        <div class="question-card">


                            <!-- QUESTION -->

                            <div class="question-heading">

                                <span class="question-number">
                                    Q <%=i + 1%>
                                </span>

                                <span class="question-text">

                                    <%=q.getQuestion()
                                        .replace("\n", "<br>")
                                        .replace(" ", "&nbsp;")%>

                                </span>

                            </div>


                            <!-- HIDDEN QUESTION ID -->

                            <input
                                type="hidden"
                                name="question<%=i%>"
                                value="<%=q.getQuestionId()%>">


                            <!-- OPTIONS -->

                            <div class="options">


                                <label class="option">

                                    <input
                                        name="option<%=i%>"
                                        type="radio"
                                        value="<%=options.get(0)%>">

                                    <span class="option-text">
                                        <%=options.get(0)%>
                                    </span>

                                </label>


                                <label class="option">

                                    <input
                                        name="option<%=i%>"
                                        type="radio"
                                        value="<%=options.get(1)%>">

                                    <span class="option-text">
                                        <%=options.get(1)%>
                                    </span>

                                </label>


                                <label class="option">

                                    <input
                                        name="option<%=i%>"
                                        type="radio"
                                        value="<%=options.get(2)%>">

                                    <span class="option-text">
                                        <%=options.get(2)%>
                                    </span>

                                </label>


                                <label class="option">

                                    <input
                                        name="option<%=i%>"
                                        type="radio"
                                        value="<%=options.get(3)%>">

                                    <span class="option-text">
                                        <%=options.get(3)%>
                                    </span>

                                </label>


                            </div>

                        </div>


                        <%

                            }

                        %>


                    </div>


                    <!-- SUBMIT -->

                    <div class="submit-area">

                        <div class="submit-note">

                            <strong>Ready to submit?</strong><br>

                            Your answers will be evaluated after submission.

                        </div>


                        <button
                            type="submit"
                            class="submit-btn"
                            id="submitTestBtn">

                            Submit Test

                        </button>

                    </div>


                </form>


            </section>


        </div>

    </main>


    <jsp:include page="footer1.jsp" />


    <script>

        /* =========================
           EXAM TIMER
           ========================= */

        var countDownDate =
            new Date().getTime()
            + (60000 * <%=onlineTestObject.getDuration()%>);


        var myfunc = setInterval(function () {

            var now =
                new Date().getTime();

            var timeleft =
                countDownDate - now;


            var minutes =
                Math.floor(
                    (timeleft % (1000 * 60 * 60))
                    / (1000 * 60)
                );


            var seconds =
                Math.floor(
                    (timeleft % (1000 * 60))
                    / 1000
                );


            if (timeleft >= 0) {

                document.getElementById("mins").innerHTML =
                    minutes + "m";

                document.getElementById("secs").innerHTML =
                    " " + seconds + "s";

            }


            if (timeleft < 0) {

                clearInterval(myfunc);

                document.getElementById("mins").innerHTML = "";
                document.getElementById("secs").innerHTML = "";

                document.getElementById("end").innerHTML =
                    "Time Over";

                alert(
                    "Time's up. Your test will automatically be submitted."
                );

                document.getElementById("frm").submit();

            }

        }, 1000);


        /* =========================
           PREVENT DOUBLE SUBMIT
           ========================= */

        document.getElementById("frm").addEventListener(
            "submit",
            function () {

                var button =
                    document.getElementById("submitTestBtn");

                button.disabled = true;
                button.innerHTML = "Submitting...";

            }
        );

    </script>


</body>


<%

    } else {

%>

    <jsp:forward page="index.jsp" />

<%

    }

%>

</html>