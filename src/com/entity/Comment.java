package com.entity;

import java.time.LocalDate;

/**
 * The entity corresponding to user comments
 */
public class Comment {
    private Integer id;
    private String nickname;
    private String comment;
    private String email;
    private String commentTime;

    public Comment() {
    }

    public Comment(Integer id, String nickname, String comment, String email, String commentTime) {
        this.id = id;
        this.nickname = nickname;
        this.comment = comment;
        this.email = email;
        this.commentTime = commentTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", nickname='" + nickname + '\'' +
                ", comment='" + comment + '\'' +
                ", email='" + email + '\'' +
                ", commentTime=" + commentTime +
                '}';
    }
}
