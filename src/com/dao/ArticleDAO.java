package com.dao;

import com.entity.Article;

import java.util.List;

public interface ArticleDAO {
    /**
     * Store Article in the Database
     * @param article The Article Object
     */
    public int storeArticleInTheDataBase(Article article);

    /**
     * Return all published articles
     * @return success, return the Article set; otherwise, return null.
     */
    public List<Article> queryArticles();

    /**
     * Delete article by articleId
     * @return success, return 1; otherwise, return 0.
     */
    public int removeArticleByArticleId(int articleId);

    /**
     * Update article by articleId
     * @param articleId articleID
     * @return success, return 1; otherwise, return 0;
     */
    public int updateArticleByArticleId(Article article, int articleId);


}
