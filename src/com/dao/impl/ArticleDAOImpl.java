package com.dao.impl;

import com.dao.ArticleDAO;
import com.dao.BasicDAO;
import com.entity.Article;

import java.util.List;

public class ArticleDAOImpl extends BasicDAO<Article> implements ArticleDAO {
    @Override
    public int storeArticleInTheDataBase(Article article) {
//        String sql = "INSERT INTO `articles` (`title`, `article_abstract`, `article_body`, `author_id`, `publish_date`, `tags`, `category`) " +
//                "VALUES(?, ?, ?, ?, ?, ?, ?);";
        String sql = "INSERT INTO [article] ([title], [articleAbstract], [articleBody], [authorId], [publishDate], [tags], [category]) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?);";
        return update(sql, article.getTitle(), article.getArticleAbstract(), article.getArticleBody(), article.getAuthorId(),
                article.getPublishDate(), article.getTags(), article.getCategory());
    }

    @Override
    public List<Article> queryArticles() {
//        String sql = "SELECT `id`, `title`, `article_abstract` articleAbstract, `article_body` articleBody, `author_id` authorId, " +
//                "`publish_date` publishDate, `tags`, `category` FROM `articles`;";

        String sql = "SELECT [id], [title], [articleAbstract], [articleBody], [authorId], " +
                " [publishDate], [tags], [category] FROM [article];";
        return queryMulti(sql, Article.class);
    }

    @Override
    public int removeArticleByArticleId(int articleId) {
//        String sql = "DELETE FROM `articles` WHERE `id`=?;";
        String sql = "DELETE FROM [article] WHERE [id] = ?;";
        return update(sql, articleId);
    }

    @Override
    public int updateArticleByArticleId(Article article, int articleId) {
//        String str = "UPDATE `articles` SET `title`=?, `article_abstract`=?, `article_body`=?, " +
//                "`publish_date`=?, `tags`=?, `category`=? WHERE `id`=?;";
        String str = "UPDATE [article] SET [title] = ?, [articleAbstract] = ?, [articleBody] = ?, " +
                "[publishDate] = ?, [tags] = ?, [category] = ? WHERE [id] = ?;";
        return update(str, article.getTitle(), article.getArticleAbstract(), article.getArticleBody(),
                article.getPublishDate(), article.getTags(), article.getCategory(), articleId);
    }
}
