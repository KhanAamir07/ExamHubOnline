package com.examhub.impl;

import static com.examhub.utility.DatabaseConnection.establishConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.examhub.dao.BlogDao;
import com.examhub.pojo.Blog;

public class BlogDaoImpl implements BlogDao {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    @Override
    public boolean addBlog(Blog blog) {

        con = establishConnection();

        String query =
            "INSERT INTO blog " +
            "(blogtitle, blogdata, linkrealted, lastedited) " +
            "VALUES (?, ?, ?, ?)";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, blog.getBlogTitle());
            pst.setString(2, blog.getBlogData());
            pst.setString(3, blog.getLinkRelated());
            pst.setString(4, blog.getLastEdited());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean editBlog(Blog blog) {

        con = establishConnection();

        String query =
            "UPDATE blog SET " +
            "blogtitle=?, blogdata=?, linkrealted=?, lastedited=? " +
            "WHERE blogid=?";

        try {

            pst = con.prepareStatement(query);

            pst.setString(1, blog.getBlogTitle());
            pst.setString(2, blog.getBlogData());
            pst.setString(3, blog.getLinkRelated());
            pst.setString(4, blog.getLastEdited());
            pst.setInt(5, blog.getBlogId());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Blog> viewAllBlog() {

        List<Blog> listOfAllBlog =
            new ArrayList<Blog>();

        con = establishConnection();

        String query =
            "SELECT * FROM blog ORDER BY blogid DESC";

        try {

            pst = con.prepareStatement(query);

            rs = pst.executeQuery();

            while (rs.next()) {

                Blog blog = new Blog();

                blog.setBlogId(rs.getInt(1));
                blog.setBlogTitle(rs.getString(2));
                blog.setBlogData(rs.getString(3));
                blog.setLinkRelated(rs.getString(4));
                blog.setLastEdited(rs.getString(5));

                listOfAllBlog.add(blog);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return listOfAllBlog;
    }

    @Override
    public Blog viewBlog(int blogId) {

        con = establishConnection();

        String query =
            "SELECT * FROM blog WHERE blogid=?";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, blogId);

            rs = pst.executeQuery();

            if (rs.next()) {

                Blog blog = new Blog();

                blog.setBlogId(rs.getInt(1));
                blog.setBlogTitle(rs.getString(2));
                blog.setBlogData(rs.getString(3));
                blog.setLinkRelated(rs.getString(4));
                blog.setLastEdited(rs.getString(5));

                return blog;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean deleteBlog(int blogId) {

        con = establishConnection();

        String query =
            "DELETE FROM blog WHERE blogid=?";

        try {

            pst = con.prepareStatement(query);

            pst.setInt(1, blogId);

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }
}