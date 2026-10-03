<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ExamPortal | Interview Preparation</title>
    
     <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/global.css">

    <style>

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif !important;
            background: #f5f7fb;
            color: #172033;
        }

        .interview-page {
            padding: 120px 20px 80px;
        }

        .interview-container {
            width: min(1180px, 100%);
            margin: 0 auto;
        }

        /* HERO */

        .interview-hero {
            position: relative;
            overflow: hidden;
            border-radius: 28px;
            padding: 55px 55px;
            margin-bottom: 32px;
            background:
                radial-gradient(circle at 85% 20%, rgba(72, 177, 255, .22), transparent 28%),
                radial-gradient(circle at 10% 90%, rgba(104, 78, 255, .20), transparent 30%),
                linear-gradient(135deg, #101827, #17253c 55%, #111b2c);
            color: #fff;
            box-shadow: 0 20px 55px rgba(15, 23, 42, .18);
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 15px;
            border: 1px solid rgba(255,255,255,.18);
            border-radius: 50px;
            background: rgba(255,255,255,.08);
            font-size: 12px;
            font-weight: 700;
            letter-spacing: .7px;
            text-transform: uppercase;
        }

        .hero-badge span {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #62c8ff;
            display: inline-block;
        }

        .interview-hero h1 {
            margin: 20px 0 12px;
            font-size: clamp(32px, 5vw, 54px);
            line-height: 1.08;
            font-weight: 800;
            letter-spacing: -1.5px;
        }

        .interview-hero h1 span {
            color: #59c7ff;
        }

        .interview-hero p {
            max-width: 760px;
            margin: 0;
            color: rgba(255,255,255,.76);
            font-size: 16px;
            line-height: 1.8;
        }

        .hero-pills {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 28px;
        }

        .hero-pill {
            padding: 9px 14px;
            border-radius: 30px;
            background: rgba(255,255,255,.08);
            border: 1px solid rgba(255,255,255,.12);
            color: rgba(255,255,255,.9);
            font-size: 12px;
            font-weight: 600;
        }

        /* CONTENT */

        .content-card {
            background: #fff;
            border: 1px solid #e9edf5;
            border-radius: 24px;
            padding: 30px;
            margin-bottom: 22px;
            box-shadow: 0 12px 35px rgba(15,23,42,.06);
        }

        .question-card {
            position: relative;
            overflow: hidden;
            transition: .25s ease;
        }

        .question-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 42px rgba(15,23,42,.10);
        }

        .question-card::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(180deg, #1d8cff, #65c8ff);
        }

        .question-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 42px;
            height: 42px;
            padding: 0 12px;
            border-radius: 12px;
            background: #edf7ff;
            color: #1479d8;
            font-size: 14px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .question-title {
            margin: 0 0 15px;
            color: #172033;
            font-size: 20px;
            line-height: 1.55;
            font-weight: 700;
        }

        .question-description {
            color: #657086;
            font-size: 14px;
            line-height: 1.9;
            margin: 0 0 18px;
        }

        .answer-box {
            margin-top: 20px;
            padding: 20px;
            border-radius: 17px;
            background: #f8fafc;
            border: 1px solid #e8edf4;
        }

        .answer-label {
            display: inline-block;
            margin-bottom: 12px;
            color: #1479d8;
            font-size: 12px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: .8px;
        }

        .answer-box p {
            margin: 0;
            color: #4d596d;
            font-size: 14px;
            line-height: 1.85;
        }

        .tip-list {
            margin: 8px 0 0;
            padding-left: 20px;
        }

        .tip-list li {
            color: #586478;
            font-size: 14px;
            line-height: 1.9;
            margin-bottom: 7px;
        }

        .example {
            margin-top: 18px;
            padding: 18px 20px;
            border-radius: 16px;
            background: linear-gradient(135deg, #f6fbff, #f8f7ff);
            border: 1px solid #e4edf7;
        }

        .example-title {
            display: block;
            margin-bottom: 8px;
            color: #172033;
            font-size: 13px;
            font-weight: 800;
        }

        .example p {
            margin: 0;
            color: #586478;
            font-size: 14px;
            line-height: 1.85;
        }

        .section-heading {
            margin-bottom: 22px;
        }

        .section-heading h2 {
            margin: 0 0 8px;
            color: #172033;
            font-size: 28px;
            font-weight: 800;
        }

        .section-heading p {
            margin: 0;
            color: #69758a;
            font-size: 14px;
            line-height: 1.7;
        }

        .avoid-card {
            background: linear-gradient(135deg, #fff8f8, #ffffff);
            border: 1px solid #f2dede;
        }

        .avoid-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 18px;
        }

        .avoid-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff0f0;
            color: #d84d5b;
            font-weight: 800;
        }

        .avoid-title h2 {
            margin: 0;
            font-size: 25px;
            font-weight: 800;
        }

        .avoid-list {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 12px;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .avoid-list li {
            padding: 15px 17px;
            border-radius: 14px;
            background: #fff;
            border: 1px solid #f0e3e3;
            color: #5e687a;
            font-size: 14px;
            font-weight: 600;
        }

        .closing-card {
            text-align: center;
            padding: 40px 30px;
            background:
                radial-gradient(circle at 15% 20%, rgba(68,174,255,.18), transparent 30%),
                linear-gradient(135deg, #111b2c, #17253c);
            color: #fff;
            border: 0;
        }

        .closing-card h2 {
            margin: 0 0 12px;
            font-size: 30px;
            font-weight: 800;
        }

        .closing-card p {
            max-width: 720px;
            margin: auto;
            color: rgba(255,255,255,.72);
            font-size: 14px;
            line-height: 1.8;
        }

        .back-top {
            display: inline-flex;
            margin-top: 24px;
            padding: 12px 20px;
            border-radius: 30px;
            background: #1689eb;
            color: #fff !important;
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
            transition: .2s ease;
        }

        .back-top:hover {
            background: #0f73cb;
            transform: translateY(-2px);
        }

        /* RESPONSIVE */

        @media (max-width: 768px) {

            .interview-page {
                padding: 100px 14px 55px;
            }

            .interview-hero {
                padding: 35px 25px;
                border-radius: 22px;
            }

            .interview-hero h1 {
                font-size: 34px;
            }

            .content-card {
                padding: 22px 19px;
                border-radius: 19px;
            }

            .question-title {
                font-size: 17px;
            }

            .avoid-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {

            .interview-hero h1 {
                font-size: 29px;
            }

            .interview-hero p {
                font-size: 13px;
            }

            .question-title {
                font-size: 16px;
            }

            .question-description,
            .answer-box p,
            .tip-list li,
            .example p,
            .avoid-list li {
                font-size: 13px;
            }
        }

    </style>
</head>

<body>

<jsp:include page="menu1.jsp" />

<main class="interview-page">

    <div class="interview-container">

        <!-- HERO -->

        <section class="interview-hero">

            <div class="hero-badge">
                <span></span>
                Interview Preparation
            </div>

            <h1>
                Interview Questions
                <span>&amp; Answers</span>
            </h1>

            <p>
                Prepare for common HR interviews with clear guidance,
                practical answer strategies, and simple examples.
                Focus on confidence, clarity, honesty, flexibility and
                professional communication.
            </p>

            <div class="hero-pills">
                <div class="hero-pill">HR Interview</div>
                <div class="hero-pill">Communication</div>
                <div class="hero-pill">Career Preparation</div>
                <div class="hero-pill">Professional Skills</div>
            </div>

        </section>


        <!-- QUESTION 1 -->

        <article class="content-card question-card">

            <div class="question-number">01</div>

            <h2 class="question-title">
                Tell me about yourself.
            </h2>

            <p class="question-description">
                This is one of the most common HR interview questions.
                Your answer can set the direction and tone of the rest
                of the interview.
            </p>

            <ul class="tip-list">
                <li>Give a brief overview of your education, family, location and hobbies.</li>
                <li>Mention one important achievement if it fits naturally.</li>
                <li>Keep the answer around 3–4 sentences.</li>
                <li>Do not explain your strengths and weaknesses here unless asked.</li>
                <li>Avoid starting with phrases such as “I am basically from...”.</li>
                <li>Keep the answer simple and give the interviewer room to ask further questions.</li>
            </ul>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “First of all, many thanks for calling me and giving me this opportunity
                    to introduce myself. Hi, I am a graduate with a strong interest in
                    technology and professional development. I have worked on academic
                    projects and enjoy learning new technologies. I am looking forward
                    to starting my career in an environment where I can learn and contribute.”
                </p>
            </div>

        </article>


        <!-- QUESTION 2 -->

        <article class="content-card question-card">

            <div class="question-number">02</div>

            <h2 class="question-title">
                What are your key strengths?
            </h2>

            <p class="question-description">
                This question helps the interviewer understand how well
                you know yourself and how confidently you can explain
                your strengths.
            </p>

            <ul class="tip-list">
                <li>Keep your answer positive and realistic.</li>
                <li>Choose strengths that are useful for the role.</li>
                <li>Support your strength with a real experience whenever possible.</li>
            </ul>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “My greatest strength is my ability to learn quickly.
                    During my academic project, I had to understand a new
                    technology in a short period of time. I spent additional
                    time learning it and was able to contribute successfully
                    to the project.”
                </p>
            </div>

        </article>


        <!-- QUESTION 3 -->

        <article class="content-card question-card">

            <div class="question-number">03</div>

            <h2 class="question-title">
                What is one thing you want to improve about yourself?
                Or, what are your weaknesses?
            </h2>

            <p class="question-description">
                This can be a tricky question. A good answer should show
                self-awareness while explaining how you are working on
                improving the weakness.
            </p>

            <ul class="tip-list">
                <li>Choose a genuine but manageable weakness.</li>
                <li>Do not mention a weakness that directly makes you unsuitable for the job.</li>
                <li>Explain what you are doing to improve it.</li>
            </ul>

            <div class="example">
                <span class="example-title">Examples</span>
                <p>
                    “I sometimes spend too much time trying to make one task perfect,
                    so I am learning to manage priorities and deadlines better.”
                </p>
                <br>
                <p>
                    “I sometimes find it difficult to say no when someone asks for help.
                    I am learning to balance helping others with my own priorities.”
                </p>
            </div>

        </article>


        <!-- QUESTION 4 -->

        <article class="content-card question-card">

            <div class="question-number">04</div>

            <h2 class="question-title">
                Who is the most inspiring person in your life?
            </h2>

            <p class="question-description">
                The important part is not only the person's name.
                Explain why that person inspires you and connect the
                qualities with your own values.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “My greatest inspiration is my father. He has always taught me
                    to focus on my strengths instead of worrying about my weaknesses.
                    This has helped me develop confidence during difficult situations.”
                </p>
            </div>

        </article>


        <!-- QUESTION 5 -->

        <article class="content-card question-card">

            <div class="question-number">05</div>

            <h2 class="question-title">
                Where do you see yourself in 5 years from now?
            </h2>

            <p class="question-description">
                This question is intended to understand your career
                aspirations, commitment, learning goals and long-term
                professional direction.
            </p>

            <ul class="tip-list">
                <li>Show that you want to learn and grow.</li>
                <li>Connect your goals with the role and organization.</li>
                <li>Avoid giving unrealistic claims.</li>
            </ul>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “In the next five years, I would like to become a strong
                    technical professional with practical industry experience.
                    I want to continuously improve my technical and communication
                    skills and gradually take greater responsibility within the team.”
                </p>
            </div>

        </article>


        <!-- QUESTION 6 -->

        <article class="content-card question-card">

            <div class="question-number">06</div>

            <h2 class="question-title">
                Have you been in a challenging situation?
                Explain how you handled it.
            </h2>

            <p class="question-description">
                This question gives you an opportunity to demonstrate
                problem-solving ability, positive thinking, teamwork,
                patience and determination.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “During my final project, our team faced a technical problem
                    close to the delivery deadline. Instead of giving up, we
                    divided the problem into smaller parts, researched the issue,
                    tested different solutions and worked together until we found
                    the cause. We were finally able to complete the project on time.”
                </p>
            </div>

        </article>


        <!-- QUESTION 7 -->

        <article class="content-card question-card">

            <div class="question-number">07</div>

            <h2 class="question-title">
                Why should we hire you?
            </h2>

            <p class="question-description">
                The interviewer wants to understand what qualities,
                skills or attitude you can bring to the organization.
            </p>

            <ul class="tip-list">
                <li>Highlight your willingness to learn.</li>
                <li>Talk about adaptability and teamwork.</li>
                <li>Connect your skills with the requirements of the role.</li>
            </ul>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “I believe my willingness to learn, adaptability and
                    commitment to completing responsibilities make me a good
                    fit for this opportunity. I am comfortable learning new
                    technologies and working as part of a team. I would like
                    to contribute while continuously improving myself.”
                </p>
            </div>

        </article>


        <!-- QUESTION 8 -->

        <article class="content-card question-card">

            <div class="question-number">08</div>

            <h2 class="question-title">
                Are you willing to change your role and profile when required for a project?
            </h2>

            <p class="question-description">
                This question mainly checks your flexibility and willingness
                to learn. Being flexible does not mean accepting everything;
                it means showing a positive attitude toward learning new things.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “Yes. I believe taking different responsibilities can help
                    me understand the industry better. I am willing to learn
                    new skills and contribute wherever my role requires me to.”
                </p>
            </div>

        </article>


        <!-- QUESTION 9 -->

        <article class="content-card question-card">

            <div class="question-number">09</div>

            <h2 class="question-title">
                Are you ready to relocate?
            </h2>

            <p class="question-description">
                Companies may operate from multiple locations, so flexibility
                regarding location can be useful. Give an honest answer while
                clearly explaining any genuine limitations.
            </p>

            <div class="example">
                <span class="example-title">Examples</span>
                <p>
                    “Yes, I am comfortable with relocation. I believe working
                    in different locations can provide new experiences and
                    opportunities to learn.”
                </p>
                <br>
                <p>
                    “I am open to relocation depending on the project and
                    business requirements.”
                </p>
            </div>

        </article>


        <!-- QUESTION 10 -->

        <article class="content-card question-card">

            <div class="question-number">10</div>

            <h2 class="question-title">
                Are you flexible with timings if you have to work in shifts?
            </h2>

            <p class="question-description">
                This question checks your flexibility with working schedules.
                If you have a genuine limitation, communicate it honestly
                and professionally.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “Yes, I understand that project requirements can sometimes
                    require flexible working hours. I am comfortable adapting
                    to the schedule required for my role, subject to reasonable
                    circumstances.”
                </p>
            </div>

        </article>


        <!-- QUESTION 11 -->

        <article class="content-card question-card">

            <div class="question-number">11</div>

            <h2 class="question-title">
                Do you wish to pursue higher education?
            </h2>

            <p class="question-description">
                If you are seriously considering higher education, answer
                honestly. If your plan is not immediate, explain that you
                want to gain practical experience first.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “I am interested in higher studies, but not immediately.
                    I would like to start working, gain practical experience
                    and then decide on higher education based on my career
                    progression.”
                </p>
            </div>

        </article>


        <!-- QUESTION 12 -->

        <article class="content-card question-card">

            <div class="question-number">12</div>

            <h2 class="question-title">
                What do you know about our company?
            </h2>

            <p class="question-description">
                Research the organization before the interview. Good
                preparation demonstrates genuine interest in the opportunity.
            </p>

            <ul class="tip-list">
                <li>Understand the company's domain.</li>
                <li>Know the industries and products or services it works with.</li>
                <li>Learn about its major locations.</li>
                <li>Understand basic company history and leadership.</li>
                <li>Know its general working culture.</li>
                <li>Be aware of major subsidiaries or affiliated companies where relevant.</li>
            </ul>

        </article>


        <!-- QUESTION 13 -->

        <article class="content-card question-card">

            <div class="question-number">13</div>

            <h2 class="question-title">
                Why do you want to work for us?
            </h2>

            <p class="question-description">
                Mention something meaningful about the organization and
                connect it with your own interests, strengths or career goals.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “I would like to work here because the organization provides
                    an environment where I can learn, work with experienced people
                    and contribute to meaningful projects. I believe the role
                    matches my interests and long-term career goals.”
                </p>
            </div>

        </article>


        <!-- QUESTION 14 -->

        <article class="content-card question-card">

            <div class="question-number">14</div>

            <h2 class="question-title">
                What is one thing that you like about our company?
            </h2>

            <p class="question-description">
                Always research the company before answering. Choose something
                relevant to the organization and avoid giving an answer that
                conflicts with its work culture or role.
            </p>

            <div class="example">
                <span class="example-title">Tip</span>
                <p>
                    Choose a genuine point such as the company's technology,
                    learning environment, products, professional culture,
                    innovation or opportunities for employee development.
                </p>
            </div>

        </article>


        <!-- QUESTION 15 -->

        <article class="content-card question-card">

            <div class="question-number">15</div>

            <h2 class="question-title">
                What are your expectations from your first job?
            </h2>

            <p class="question-description">
                For a fresher, learning and practical exposure are strong
                expectations. You can also mention teamwork, professional
                development and opportunities to work with new technologies.
            </p>

            <div class="example">
                <span class="example-title">Example</span>
                <p>
                    “My first expectation is to learn how things are applied
                    in a practical and industrial environment. I also want to
                    understand how professional teams work, improve my technical
                    skills and contribute to real projects.”
                </p>
            </div>

        </article>


        <!-- QUESTION 16 -->

        <article class="content-card question-card">

            <div class="question-number">16</div>

            <h2 class="question-title">
                Do you want to ask us anything?
            </h2>

            <p class="question-description">
                This is an important question. Avoid going into an interview
                without preparing at least one thoughtful question.
            </p>

            <ul class="tip-list">
                <li>Ask about the role and responsibilities.</li>
                <li>Ask about learning and growth opportunities.</li>
                <li>Ask about the team or project environment.</li>
                <li>Ask about training or professional development.</li>
            </ul>

            <div class="example">
                <span class="example-title">Example Questions</span>
                <p>
                    “What would be the key responsibilities during the first
                    few months in this role?”
                </p>
                <br>
                <p>
                    “What kind of learning or training opportunities are available
                    for someone joining this role?”
                </p>
            </div>

        </article>


        <!-- AVOID SECTION -->

        <section class="content-card avoid-card">

            <div class="avoid-title">

                <div class="avoid-icon">!</div>

                <h2>Things to Avoid</h2>

            </div>

            <ul class="avoid-list">

                <li>Shabby or overly casual dressing</li>

                <li>Arriving late for the interview</li>

                <li>Lies and false information</li>

                <li>Stretching answers beyond the required time</li>

                <li>Unnecessary arguments or debates</li>

                <li>Negative answers or criticism</li>

            </ul>

        </section>


        <!-- CLOSING -->

        <section class="content-card closing-card">

            <h2>Prepare Smart. Speak Clearly.</h2>

            <p>
                Good interview preparation is not about memorizing every answer.
                Understand the question, stay honest, communicate clearly and
                support your answers with real experiences whenever possible.
            </p>

            <a href="#top" class="back-top">
                Back to Top ↑
            </a>

        </section>

    </div>

</main>

<jsp:include page="footer1.jsp" />

</body>
</html>