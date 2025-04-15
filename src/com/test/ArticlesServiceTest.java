package com.test;

import com.entity.Article;
import com.service.ArticlesService;
import com.service.impl.ArticlesServiceImpl;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;

public class ArticlesServiceTest {
    private ArticlesService articlesService = new ArticlesServiceImpl();

    @Test
    public void storeArticleInTheDataBase() {
        Article article = new Article(null, "阿斯顿冲突", "阿斯顿人民正深陷于战争之中，他们的家园正在遭受着毁灭...",
                "阿斯顿人民正深陷于战争之中，他们的家园正在遭受着毁灭，希望国际社会能够给予重视！",
                1, new Date(), "战争", "新闻");
        articlesService.storeArticleInTheDataBase(article);
    }

    @Test
    public void queryArticles() {
        List<Article> articleList = articlesService.queryArticles();
        for (Article article : articleList) {
            System.out.println(article);
        }
    }

    @Test
    public void removeArticleByArticleId() {
        int i = articlesService.removeArticleByArticleId(1);
        System.out.println("i=" + i);
    }

    @Test
    public void updateArticleByArticleId() {
        Article article = new Article(null, "阿斯顿冲突", "阿斯顿人民正深陷于战争之中，他们的家园正在遭受着毁灭...",
                "阿斯顿人民正深陷于战争之中，他们的家园正在遭受着毁灭，希望国际社会能够给予重视！",
                1, new Date(), "战争", "新闻");
        int update = articlesService.updateArticleByArticleId(article, 5);
        System.out.println("update=" + update);
    }
}
