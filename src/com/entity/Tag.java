package com.entity;

import java.util.Date;

/**
 * the entity corresponding to tags
 */
public class Tag {
    private Integer id;
    private String tagName;
    private Date createTime;

    public Tag() {
    }

    public Tag(Integer id, String tagName, Date createTime) {
        this.id = id;
        this.tagName = tagName;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", tagName='" + tagName + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
