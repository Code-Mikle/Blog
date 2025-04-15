package com.service.impl;

import com.dao.ArticleDAO;
import com.dao.impl.ArticleDAOImpl;
import com.entity.Article;
import com.service.ArticlesService;

import java.util.List;

public class ArticlesServiceImpl implements ArticlesService {
    private ArticleDAO articleDAO = new ArticleDAOImpl();

    @Override
    public int storeArticleInTheDataBase(Article article) {
        return articleDAO.storeArticleInTheDataBase(article);
    }

    @Override
    public List<Article> queryArticles() {
        return articleDAO.queryArticles();
    }

    @Override
    public int removeArticleByArticleId(int articleId) {
        return articleDAO.removeArticleByArticleId(articleId);
    }

    @Override
    public int updateArticleByArticleId(Article article, int articleId) {
        return articleDAO.updateArticleByArticleId(article, articleId);
    }

}
