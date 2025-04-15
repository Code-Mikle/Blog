package com.entity;

import java.util.Date;

/**
 * the entity corresponding to Article
 */
public class Article {
    private Integer id;
    private String title;
    private String articleAbstract;
    private String articleBody;
    private Integer authorId;
    private Date publishDate;
    private String tags;
    private String category;


    public Article() {
    }

    public Article(Integer id, String title, String articleAbstract, String articleBody, Integer authorId, Date publishDate, String tags, String category) {
        this.id = id;
        this.title = title;
        this.articleAbstract = articleAbstract;
        this.articleBody = articleBody;
        this.authorId = authorId;
        this.publishDate = publishDate;
        this.tags = tags;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArticleBody() {
        return articleBody;
    }

    public void setArticleBody(String articleBody) {
        this.articleBody = articleBody;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getArticleAbstract() {
        return articleAbstract;
    }

    public void setArticleAbstract(String articleAbstract) {
        this.articleAbstract = articleAbstract;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", articleAbstract='" + articleAbstract + '\'' +
                ", articleBody='" + articleBody + '\'' +
                ", authorId=" + authorId +
                ", publishDate=" + publishDate +
                ", tags='" + tags + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
