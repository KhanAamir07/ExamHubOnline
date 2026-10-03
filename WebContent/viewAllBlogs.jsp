<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.examhub.pojo.Blog"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Admin | Blogs</title>

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
            background: #f5f7fb;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
        }

        .page {
            padding: 35px 25px 60px;
        }

        .wrapper {
            max-width: 1250px;
            margin: auto;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 22px;
            padding: 32px 35px;
            background: linear-gradient(135deg,#fff,#f6faff);
            border: 1px solid #e6ecf4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .eyebrow {
            display: inline-block;
            margin-bottom: 9px;
            padding: 7px 13px;
            border-radius: 30px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
            font-weight: 700;
        }

        .header p {
            margin: 8px 0 0;
            color: #8993a3;
            font-size: 12px;
        }

        .add-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 44px;
            padding: 0 20px;
            border-radius: 11px;
            background: #0d6efd;
            color: #fff;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .message {
            margin-bottom: 20px;
            padding: 13px 15px;
            border-radius: 11px;
            font-size: 11px;
            font-weight: 600;
        }

        .success {
            background: #ecfdf3;
            color: #16834d;
            border: 1px solid #c9efd9;
        }

        .error {
            background: #fff1f2;
            color: #c53030;
            border: 1px solid #ffd2d5;
        }

        .card {
            padding: 25px;
            background: #fff;
            border: 1px solid #e6ecf3;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-top h2 {
            margin: 0;
            font-size: 19px;
            font-weight: 700;
        }

        .count {
            padding: 8px 13px;
            border-radius: 30px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 10px;
            font-weight: 700;
        }

        .blog-list {
            display: grid;
            gap: 13px;
        }

        .blog-row {
            display: grid;
            grid-template-columns: 70px 1fr auto;
            align-items: center;
            gap: 18px;
            padding: 18px;
            border: 1px solid #e9edf3;
            border-radius: 15px;
            transition: .2s;
        }

        .blog-row:hover {
            background: #f9fbff;
            border-color: #d9e7fb;
            transform: translateY(-1px);
        }

        .blog-id {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            border-radius: 11px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 11px;
            font-weight: 700;
        }

        .blog-title {
            color: #18263d;
            font-size: 13px;
            font-weight: 700;
            line-height: 1.5;
        }

        .blog-meta {
            margin-top: 5px;
            color: #8993a3;
            font-size: 9px;
        }

        .actions {
            display: flex;
            gap: 8px;
        }

        .action {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 34px;
            padding: 0 12px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 9px;
            font-weight: 700;
        }

        .view {
            background: #eef5ff;
            color: #0d6efd;
        }

        .edit {
            background: #f4f1ff;
            color: #6657c7;
        }

        .delete {
            background: #fff1f2;
            color: #d33;
        }

        .empty {
            padding: 65px 20px;
            text-align: center;
        }

        .empty-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 60px;
            height: 60px;
            margin: 0 auto 15px;
            border-radius: 17px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 25px;
        }

        .empty h3 {
            margin: 0 0 6px;
            font-size: 15px;
        }

        .empty p {
            margin: 0;
            color: #8993a3;
            font-size: 11px;
        }

        @media(max-width:700px) {

            .page {
                padding: 20px 12px 40px;
            }

            .header {
                display: block;
                padding: 25px 21px;
            }

            .add-btn {
                margin-top: 17px;
            }

            .blog-row {
                grid-template-columns: 50px 1fr;
            }

            .actions {
                grid-column: 2;
            }

        }

    </style>

</head>

<body>

<jsp:include page="menu.jsp" />

<%
    String admin =
        (String) session.getAttribute("adminLogin");

    if (admin == null) {
        response.sendRedirect(
            request.getContextPath() + "/adminLogin.jsp");
        return;
    }

    List<Blog> listOfAllBlog =
        (List<Blog>) request.getAttribute("listOfAllBlog");

    if (listOfAllBlog == null) {
        listOfAllBlog =
            new ArrayList<Blog>();
    }

    String success =
        (String) request.getAttribute("blogEditSucessMessage");

    String error =
        (String) request.getAttribute("blogEditFailedMessage");

    String deleteSuccess =
        (String) request.getAttribute("blogDeleteSucessMessage");

    String deleteError =
        (String) request.getAttribute("blogDeleteFailedMessage");
%>

<div class="page">

    <div class="wrapper">

        <div class="header">

            <div>

                <div class="eyebrow">
                    ExamPortal Content Management
                </div>

                <h1>
                    Blog Management
                </h1>

                <p>
                    Create, review, edit and manage learning articles.
                </p>

            </div>

            <a href="${pageContext.request.contextPath}/addBlog.jsp"
               class="add-btn">
                + Add New Blog
            </a>

        </div>


        <% if (success != null) { %>

            <div class="message success">
                <%=success%>
            </div>

        <% } %>

        <% if (error != null) { %>

            <div class="message error">
                <%=error%>
            </div>

        <% } %>

        <% if (deleteSuccess != null) { %>

            <div class="message success">
                <%=deleteSuccess%>
            </div>

        <% } %>

        <% if (deleteError != null) { %>

            <div class="message error">
                <%=deleteError%>
            </div>

        <% } %>


        <div class="card">

            <div class="card-top">

                <h2>
                    Published Articles
                </h2>

                <div class="count">
                    <%=listOfAllBlog.size()%> Blogs
                </div>

            </div>


            <%
                if (listOfAllBlog.isEmpty()) {
            %>

                <div class="empty">

                    <div class="empty-icon">
                        ✎
                    </div>

                    <h3>
                        No Blogs Yet
                    </h3>

                    <p>
                        Start by publishing your first learning article.
                    </p>

                </div>

            <%
                } else {
            %>

                <div class="blog-list">

                <%
                    for (Blog blog : listOfAllBlog) {
                %>

                    <div class="blog-row">

                        <div class="blog-id">
                            #<%=blog.getBlogId()%>
                        </div>

                        <div>

                            <div class="blog-title">
                                <%=blog.getBlogTitle()%>
                            </div>

                            <div class="blog-meta">
                                Last edited:
                                <%=blog.getLastEdited()%>
                            </div>

                        </div>

                        <div class="actions">

                            <a class="action view"
                               href="${pageContext.request.contextPath}/blogServlet?operation=viewBlog&blogId=<%=blog.getBlogId()%>">
                                View
                            </a>

                            <a class="action edit"
                               href="${pageContext.request.contextPath}/blogServlet?operation=edit&blogId=<%=blog.getBlogId()%>">
                                Edit
                            </a>

                            <a class="action delete"
                               onclick="return confirm('Do you really want to delete this blog?');"
                               href="${pageContext.request.contextPath}/blogServlet?operation=delete&blogId=<%=blog.getBlogId()%>">
                                Delete
                            </a>

                        </div>

                    </div>

                <%
                    }
                %>

                </div>

            <%
                }
            %>

        </div>

    </div>

</div>

<jsp:include page="footer1.jsp" />

</body>

</html>