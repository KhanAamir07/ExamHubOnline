package com.examhub.test;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.examhub.dao.BlogDao;
import com.examhub.impl.BlogDaoImpl;
import com.examhub.pojo.Blog;

@WebServlet("/blogServlet")
public class BlogServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BlogDao blogDaoImpl = new BlogDaoImpl();

    public BlogServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String operation = request.getParameter("operation");

        if (operation == null) {
            response.sendRedirect(
                request.getContextPath()
                + "/blogServlet?operation=viewAllBlog&type=student"
            );
            return;
        }

        if (operation.equalsIgnoreCase("viewAllBlog")) {

            List<Blog> listOfAllBlog =
                    blogDaoImpl.viewAllBlog();

            request.setAttribute(
                    "listOfAllBlog",
                    listOfAllBlog
            );

            String type = request.getParameter("type");

            if (type != null) {

                request.getRequestDispatcher(
                        "blog.jsp"
                ).forward(request, response);

            } else {

                request.getRequestDispatcher(
                        "viewAllBlogs.jsp"
                ).forward(request, response);
            }

        } else if (operation.equalsIgnoreCase("edit")) {

            int blogId =
                    Integer.parseInt(
                            request.getParameter("blogId")
                    );

            Blog blogToEdit =
                    blogDaoImpl.viewBlog(blogId);

            request.setAttribute(
                    "blogToEdit",
                    blogToEdit
            );

            request.getRequestDispatcher(
                    "editBlog.jsp"
            ).forward(request, response);

        } else if (operation.equalsIgnoreCase("viewBlog")) {

            int blogId =
                    Integer.parseInt(
                            request.getParameter("blogId")
                    );

            Blog blogToView =
                    blogDaoImpl.viewBlog(blogId);

            request.setAttribute(
                    "blogToView",
                    blogToView
            );

            request.getRequestDispatcher(
                    "viewBlog.jsp"
            ).forward(request, response);

        } else if (operation.equalsIgnoreCase("delete")) {

            int blogId =
                    Integer.parseInt(
                            request.getParameter("blogId")
                    );

            if (blogDaoImpl.deleteBlog(blogId)) {

                request.setAttribute(
                        "blogDeleteSucessMessage",
                        "Blog Deleted Successfully."
                );

            } else {

                request.setAttribute(
                        "blogDeleteFailedMessage",
                        "Failed! Try Again."
                );
            }

            List<Blog> listOfAllBlog =
                    blogDaoImpl.viewAllBlog();

            request.setAttribute(
                    "listOfAllBlog",
                    listOfAllBlog
            );

            request.getRequestDispatcher(
                    "viewAllBlogs.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String operation =
                request.getParameter("operation");

        if (operation == null) {
            response.sendRedirect(
                request.getContextPath()
                + "/blogServlet?operation=viewAllBlog"
            );
            return;
        }

        if (operation.equalsIgnoreCase("add")) {

            Blog blog = new Blog();

            blog.setBlogTitle(
                    request.getParameter("blogTitle")
            );

            blog.setBlogData(
                    request.getParameter("blogData")
            );

            blog.setLinkRelated(
                    request.getParameter("links")
            );

            blog.setLastEdited(
                    new Date().toString()
            );

            if (blogDaoImpl.addBlog(blog)) {

                request.setAttribute(
                        "blogAddSucessMessage",
                        "New Blog Added Successfully."
                );

            } else {

                request.setAttribute(
                        "blogAddFailedMessage",
                        "Failed! Try Again."
                );
            }

            request.getRequestDispatcher(
                    "addBlog.jsp"
            ).forward(request, response);

        } else if (operation.equalsIgnoreCase("edit")) {

            Blog blog = new Blog();

            blog.setBlogId(
                    Integer.parseInt(
                            request.getParameter("blogId")
                    )
            );

            blog.setBlogTitle(
                    request.getParameter("blogTitle")
            );

            blog.setBlogData(
                    request.getParameter("blogData")
            );

            blog.setLinkRelated(
                    request.getParameter("links")
            );

            blog.setLastEdited(
                    new Date().toString()
            );

            if (blogDaoImpl.editBlog(blog)) {

                request.setAttribute(
                        "blogEditSucessMessage",
                        "Blog Updated Successfully."
                );

            } else {

                request.setAttribute(
                        "blogEditFailedMessage",
                        "Failed! Try Again."
                );
            }

            List<Blog> listOfAllBlog =
                    blogDaoImpl.viewAllBlog();

            request.setAttribute(
                    "listOfAllBlog",
                    listOfAllBlog
            );

            request.getRequestDispatcher(
                    "viewAllBlogs.jsp"
            ).forward(request, response);

        } else if (operation.equalsIgnoreCase("viewAllBlog")) {

            doGet(request, response);
        }
    }
}