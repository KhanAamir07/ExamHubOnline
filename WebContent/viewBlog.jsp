<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.examhub.pojo.Blog"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Blog Article</title>

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

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f7f9fc;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .article-page {
            padding: 75px 18px 90px;
        }

        .article-wrapper {
            max-width: 900px;
            margin: auto;
        }

        .article-card {
            padding: 48px 55px;
            background: #fff;
            border: 1px solid #e4eaf2;
            border-radius: 23px;
            box-shadow: 0 18px 50px rgba(25,43,75,.07);
        }

        .article-label {
            display: inline-block;
            margin-bottom: 15px;
            padding: 7px 13px;
            border-radius: 30px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .article-title {
            margin: 0;
            color: #102448;
            font-size: 34px;
            line-height: 1.35;
            font-weight: 700;
        }

        .article-meta {
            margin: 14px 0 30px;
            padding-bottom: 22px;
            border-bottom: 1px solid #edf0f4;
            color: #98a1ae;
            font-size: 10px;
        }

        .article-content {
            color: #536174;
            font-size: 13px;
            line-height: 2;
            white-space: pre-line;
        }

        .article-link {
            display: inline-flex;
            align-items: center;
            min-height: 42px;
            margin-top: 30px;
            padding: 0 17px;
            border-radius: 10px;
            background: #eef5ff;
            color: #0d6efd;
            text-decoration: none;
            font-size: 10px;
            font-weight: 700;
        }

        .back {
            display: inline-flex;
            margin-top: 18px;
            color: #697586;
            text-decoration: none;
            font-size: 10px;
            font-weight: 600;
        }

        .not-found {
            padding: 70px 20px;
            text-align: center;
            background: #fff;
            border-radius: 20px;
        }

        @media(max-width:600px) {

            .article-page {
                padding: 45px 12px 60px;
            }

            .article-card {
                padding: 30px 22px;
                border-radius: 18px;
            }

            .article-title {
                font-size: 27px;
            }

            .article-content {
                font-size: 12px;
            }

        }

    </style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<%
    Blog blogToView =
        (Blog) request.getAttribute("blogToView");
%>

<div class="article-page">

    <div class="article-wrapper">

    <%
        if (blogToView == null) {
    %>

        <div class="not-found">

            <h2>
                Blog Not Found
            </h2>

            <p>
                The requested article is not available.
            </p>

            <a href="${pageContext.request.contextPath}/blogServlet?operation=viewAllBlog&type=student">
                Back to Blogs
            </a>

        </div>

    <%
        } else {
    %>

        <article class="article-card">

            <div class="article-label">
                ExamPortal Learning Article
            </div>

            <h1 class="article-title">
                <%=blogToView.getBlogTitle()%>
            </h1>

            <div class="article-meta">
                Last Updated:
                <%=blogToView.getLastEdited()%>
            </div>

            <div class="article-content">
                <%=blogToView.getBlogData()%>
            </div>

            <%
                if (blogToView.getLinkRelated() != null
                    && !blogToView.getLinkRelated().trim().isEmpty()) {
            %>

                <a class="article-link"
                   href="<%=blogToView.getLinkRelated()%>"
                   target="_blank"
                   rel="noopener noreferrer">
                    Explore Related Resource →
                </a>

            <%
                }
            %>

            <br>

            <a class="back"
               href="${pageContext.request.contextPath}/blogServlet?operation=viewAllBlog&type=student">
                ← Back to All Blogs
            </a>

        </article>

    <%
        }
    %>

    </div>

</div>

<jsp:include page="footer1.jsp" />

</body>

</html>