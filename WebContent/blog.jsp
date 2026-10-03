<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.Blog"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Learning Hub</title>

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
            background: #fff;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .blog-page {
            min-height: 100vh;
            padding: 75px 20px 90px;
        }

        .blog-wrapper {
            max-width: 1180px;
            margin: auto;
        }

        .hero {
            text-align: center;
            margin-bottom: 50px;
        }

        .hero-label {
            display: inline-block;
            margin-bottom: 13px;
            color: #0aa85f;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }

        .hero h1 {
            margin: 0;
            color: #102448;
            font-size: 42px;
            font-weight: 700;
            letter-spacing: -.8px;
        }

        .hero p {
            max-width: 700px;
            margin: 14px auto 0;
            color: #7c8798;
            font-size: 13px;
            line-height: 1.8;
        }

        .blog-grid {
            display: grid;
            grid-template-columns:
                repeat(3, minmax(0, 1fr));
            gap: 23px;
        }

        .blog-card {
            display: flex;
            flex-direction: column;
            min-height: 330px;
            padding: 27px;
            background: #fff;
            border: 1px solid #e5eaf1;
            border-radius: 19px;
            box-shadow: 0 12px 35px rgba(25,43,75,.06);
            transition: .25s ease;
        }

        .blog-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 22px 45px rgba(25,43,75,.10);
            border-color: #d5e4f8;
        }

        .blog-number {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 43px;
            height: 43px;
            margin-bottom: 22px;
            border-radius: 12px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 11px;
            font-weight: 700;
        }

        .blog-card h2 {
            margin: 0 0 13px;
            color: #172a4a;
            font-size: 17px;
            line-height: 1.5;
            font-weight: 700;
        }

        .blog-excerpt {
            display: -webkit-box;
            overflow: hidden;
            margin: 0;
            color: #788496;
            font-size: 11px;
            line-height: 1.8;
            -webkit-line-clamp: 5;
            -webkit-box-orient: vertical;
        }

        .blog-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-top: auto;
            padding-top: 25px;
        }

        .date {
            color: #a0a8b4;
            font-size: 9px;
        }

        .read-more {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 37px;
            padding: 0 15px;
            border-radius: 9px;
            background: #0d6efd;
            color: #fff;
            text-decoration: none;
            font-size: 9px;
            font-weight: 700;
            transition: .2s;
        }

        .read-more:hover {
            background: #0959cf;
            color: #fff;
        }

        .empty {
            padding: 70px 20px;
            text-align: center;
            background: #fff;
            border: 1px solid #e5eaf1;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(25,43,75,.05);
        }

        .empty-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 65px;
            height: 65px;
            margin: 0 auto 17px;
            border-radius: 17px;
            background: #eef5ff;
            font-size: 26px;
        }

        .empty h2 {
            margin: 0 0 7px;
            color: #102448;
            font-size: 19px;
        }

        .empty p {
            margin: 0;
            color: #8b95a5;
            font-size: 11px;
        }

        @media(max-width:900px) {

            .blog-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

        }

        @media(max-width:600px) {

            .blog-page {
                padding: 50px 14px 70px;
            }

            .hero h1 {
                font-size: 32px;
            }

            .blog-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>

<jsp:include page="menu1.jsp" />

<%
    List<Blog> listOfAllBlog =
        (List<Blog>) request.getAttribute("listOfAllBlog");

    if (listOfAllBlog == null) {
        listOfAllBlog =
            new ArrayList<Blog>();
    }
%>

<div class="blog-page">

    <div class="blog-wrapper">


        <div class="hero">

            <div class="hero-label">
                EXAMPORTAL LEARNING HUB
            </div>

            <h1>
                ExamPortal Blogs
            </h1>

            <p>
                Read useful articles, preparation tips,
                programming concepts and learning resources
                to improve your exam preparation.
            </p>

        </div>


        <%
            if (listOfAllBlog.isEmpty()) {
        %>

            <div class="empty">

                <div class="empty-icon">
                    ✎
                </div>

                <h2>
                    No Blogs Available
                </h2>

                <p>
                    New learning articles will appear here.
                </p>

            </div>

        <%
            } else {
        %>

            <div class="blog-grid">

            <%
                int number = 1;

                for (Blog blog :
                        listOfAllBlog) {

                    String content =
                        blog.getBlogData() == null
                        ? ""
                        : blog.getBlogData();

                    String excerpt =
                        content.length() > 250
                        ? content.substring(0, 250) + "..."
                        : content;
            %>

                <article class="blog-card">

                    <div class="blog-number">
                        <%=String.format("%02d", number++)%>
                    </div>

                    <h2>
                        <%=blog.getBlogTitle()%>
                    </h2>

                    <p class="blog-excerpt">
                        <%=excerpt%>
                    </p>

                    <div class="blog-footer">

                        <span class="date">
                            <%=blog.getLastEdited()%>
                        </span>

                        <a class="read-more"
                           href="${pageContext.request.contextPath}/blogServlet?operation=viewBlog&blogId=<%=blog.getBlogId()%>">
                            Read More →
                        </a>

                    </div>

                </article>

            <%
                }
            %>

            </div>

        <%
            }
        %>

    </div>

</div>

<jsp:include page="footer1.jsp" />

</body>

</html>