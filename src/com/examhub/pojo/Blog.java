package com.examhub.pojo;

public class Blog {

    private int blogId;

    private String blogTitle;
    private String blogData;
    private String linkRelated;
    private String lastEdited;

    public Blog() {
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogData() {
        return blogData;
    }

    public void setBlogData(String blogData) {
        this.blogData = blogData;
    }

    public String getLinkRelated() {
        return linkRelated;
    }

    public void setLinkRelated(String linkRelated) {
        this.linkRelated = linkRelated;
    }

    public String getLastEdited() {
        return lastEdited;
    }

    public void setLastEdited(String lastEdited) {
        this.lastEdited = lastEdited;
    }

    @Override
    public String toString() {

        return "Blog [blogId=" + blogId
                + ", blogTitle=" + blogTitle
                + ", blogData=" + blogData
                + ", linkRelated=" + linkRelated
                + ", lastEdited=" + lastEdited + "]";
    }
}