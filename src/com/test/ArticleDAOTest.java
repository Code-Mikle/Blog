package com.test;

import com.dao.ArticleDAO;
import com.dao.impl.ArticleDAOImpl;
import com.entity.Article;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;

public class ArticleDAOTest {
    private ArticleDAO articleDAO = new ArticleDAOImpl();

    @Test
    public void storeArticleInTheDataBase() {
        Article article = new Article(null, "title 2", "阿斯顿巴勒斯坦人民正深陷于战争之中...",
                "阿斯顿巴勒斯坦人民正深陷于战争之中，他们的家园正在遭受着以色列的毁灭，希望国际社会能够给予重视！",
                1, new Date(), "战争", "新闻");
        int update = articleDAO.storeArticleInTheDataBase(article);
        System.out.println("update=" + update);
    }

    @Test
    public void queryArticles() {
        List<Article> articleList = articleDAO.queryArticles();
        for (Article article : articleList) {
            System.out.println(article);
        }
    }

    @Test
    public void removeArticleByArticleId() {
        int i = articleDAO.removeArticleByArticleId(5);
        System.out.println("i=" + i);
    }

    @Test
    public void updateArticleByArticleId() {
        Article article = new Article(null, "巴以阿斯顿冲突",
                "巴勒斯坦人民正深陷于战争之中...",
                "阿斯顿巴勒斯坦人民正深陷于战争之中，他们的家园正在遭受着以色列的毁灭，希望国际社会能够给予重视！",
                1, new Date(), "战争", "新闻");
        int update = articleDAO.updateArticleByArticleId(article, 6);
        System.out.println("update=" + update);
    }
}
