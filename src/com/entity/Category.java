package com.entity;

import java.util.Date;

/**
 * the entity corresponding to category
 */
public class Category {
    private Integer id;
    private String categoryName;
    private Date createTime;

    public Category() {
    }

    public Category(Integer id, String categoryName, Date createTime) {
        this.id = id;
        this.categoryName = categoryName;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
