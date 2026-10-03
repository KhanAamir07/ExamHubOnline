<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.examhub.pojo.Blog"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Edit Blog</title>

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
            max-width: 1150px;
            margin: auto;
        }

        .header {
            margin-bottom: 22px;
            padding: 32px 35px;
            background: linear-gradient(135deg,#fff,#f6faff);
            border: 1px solid #e6ecf4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .eyebrow {
            display: inline-block;
            margin-bottom: 10px;
            padding: 7px 13px;
            border-radius: 30px;
            background: #eef5ff;
            color: #0d6efd;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
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

        .card {
            padding: 30px;
            background: #fff;
            border: 1px solid #e6ecf3;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .field {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #344054;
            font-size: 11px;
            font-weight: 700;
        }

        input,
        textarea {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #dce3eb;
            border-radius: 11px;
            outline: none;
            background: #fbfcfe;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
        }

        input:focus,
        textarea:focus {
            border-color: #0d6efd;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(13,110,253,.08);
        }

        textarea {
            min-height: 270px;
            resize: vertical;
            line-height: 1.7;
        }

        .readonly {
            background: #f3f5f8;
            color: #7b8798;
        }

        .buttons {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 25px;
        }

        .btn {
            min-height: 44px;
            padding: 0 22px;
            border: 0;
            border-radius: 11px;
            font-family: 'Montserrat', sans-serif;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .primary {
            background: #0d6efd;
            color: #fff;
        }

        .secondary {
            background: #eef2f7;
            color: #475467;
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

    Blog blogToEdit =
        (Blog) request.getAttribute("blogToEdit");

    if (blogToEdit == null) {
        response.sendRedirect(
            request.getContextPath()
            + "/blogServlet?operation=viewAllBlog");
        return;
    }
%>

<div class="page">

    <div class="wrapper">

        <div class="header">

            <div class="eyebrow">
                ExamPortal Content Management
            </div>

            <h1>
                Edit Blog
            </h1>

            <p>
                Update the selected learning article.
            </p>

        </div>


        <div class="card">

            <form method="post"
                  action="${pageContext.request.contextPath}/blogServlet">

                <input type="hidden"
                       name="operation"
                       value="edit">


                <div class="field">

                    <label>
                        Blog ID
                    </label>

                    <input type="text"
                           name="blogId"
                           value="<%=blogToEdit.getBlogId()%>"
                           class="readonly"
                           readonly>

                </div>


                <div class="field">

                    <label>
                        Blog Title
                    </label>

                    <input type="text"
                           name="blogTitle"
                           value="<%=blogToEdit.getBlogTitle()%>"
                           required>

                </div>


                <div class="field">

                    <label>
                        Blog Content
                    </label>

                    <textarea name="blogData"
                              required><%=blogToEdit.getBlogData()%></textarea>

                </div>


                <div class="field">

                    <label>
                        Related Link
                    </label>

                    <input type="url"
                           name="links"
                           value="<%=blogToEdit.getLinkRelated() == null ? "" : blogToEdit.getLinkRelated()%>"
                           placeholder="https://example.com">

                </div>


                <div class="buttons">

                    <button type="submit"
                            class="btn primary">
                        Update Blog
                    </button>

                    <a href="${pageContext.request.contextPath}/blogServlet?operation=viewAllBlog"
                       class="btn secondary">
                        Cancel
                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

<jsp:include page="footer1.jsp" />

</body>

</html>