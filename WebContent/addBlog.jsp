<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>ExamPortal | Add Blog</title>

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
            font-family: 'Montserrat', sans-serif;
            color: #172033;
        }

        .blog-admin-page {
            padding: 35px 25px 60px;
        }

        .blog-wrapper {
            max-width: 1150px;
            margin: auto;
        }

        .page-header {
            position: relative;
            overflow: hidden;
            padding: 35px;
            margin-bottom: 22px;
            background: linear-gradient(135deg,#ffffff,#f5faff);
            border: 1px solid #e6ecf4;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .page-header:after {
            content: "";
            position: absolute;
            width: 200px;
            height: 200px;
            right: -75px;
            top: -110px;
            border-radius: 50%;
            background: rgba(13,110,253,.08);
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
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .page-header h1 {
            position: relative;
            z-index: 2;
            margin: 0;
            font-size: 30px;
            font-weight: 700;
        }

        .page-header p {
            position: relative;
            z-index: 2;
            margin: 8px 0 0;
            color: #7b8798;
            font-size: 13px;
        }

        .form-card {
            padding: 30px;
            background: #fff;
            border: 1px solid #e6ecf3;
            border-radius: 22px;
            box-shadow: 0 15px 45px rgba(24,39,75,.07);
        }

        .form-title {
            margin-bottom: 25px;
        }

        .form-title h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 700;
        }

        .form-title p {
            margin: 6px 0 0;
            color: #8993a3;
            font-size: 11px;
        }

        .field {
            margin-bottom: 20px;
        }

        .field label {
            display: block;
            margin-bottom: 8px;
            color: #344054;
            font-size: 11px;
            font-weight: 700;
        }

        .field input,
        .field textarea {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #dce3eb;
            border-radius: 11px;
            outline: none;
            background: #fbfcfe;
            color: #172033;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            transition: .2s;
        }

        .field textarea {
            min-height: 260px;
            resize: vertical;
            line-height: 1.7;
        }

        .field input:focus,
        .field textarea:focus {
            border-color: #0d6efd;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(13,110,253,.08);
        }

        .button-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 25px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 44px;
            padding: 0 22px;
            border: 0;
            border-radius: 11px;
            font-family: 'Montserrat', sans-serif;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-primary {
            background: #0d6efd;
            color: #fff;
        }

        .btn-secondary {
            background: #eef2f7;
            color: #475467;
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

        @media(max-width:600px) {

            .blog-admin-page {
                padding: 20px 12px 40px;
            }

            .page-header {
                padding: 25px 21px;
            }

            .form-card {
                padding: 20px;
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

    String success =
        (String) request.getAttribute("blogAddSucessMessage");

    String error =
        (String) request.getAttribute("blogAddFailedMessage");
%>

<div class="blog-admin-page">

    <div class="blog-wrapper">

        <div class="page-header">

            <div class="eyebrow">
                ExamPortal Content Management
            </div>

            <h1>
                Create New Blog
            </h1>

            <p>
                Publish useful learning resources,
                preparation tips and programming articles.
            </p>

        </div>


        <div class="form-card">

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


            <div class="form-title">

                <h2>
                    Blog Details
                </h2>

                <p>
                    Add educational content for ExamPortal students.
                </p>

            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}/blogServlet">

                <input type="hidden"
                       name="operation"
                       value="add">


                <div class="field">

                    <label>
                        Blog Title
                    </label>

                    <input type="text"
                           name="blogTitle"
                           maxlength="200"
                           placeholder="Enter blog title"
                           required>

                </div>


                <div class="field">

                    <label>
                        Blog Content
                    </label>

                    <textarea name="blogData"
                              placeholder="Write your complete article here..."
                              required></textarea>

                </div>


                <div class="field">

                    <label>
                        Related Link
                    </label>

                    <input type="url"
                           name="links"
                           placeholder="https://example.com">

                </div>


                <div class="button-row">

                    <button type="submit"
                            class="btn btn-primary">
                        Publish Blog
                    </button>

                    <a href="${pageContext.request.contextPath}/blogServlet?operation=viewAllBlog"
                       class="btn btn-secondary">
                        View All Blogs
                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

<jsp:include page="footer1.jsp" />

</body>

</html>