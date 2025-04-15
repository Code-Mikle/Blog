package com.web;

import com.entity.Article;
import com.entity.Comment;
import com.entity.Tag;
import com.google.gson.Gson;
import com.service.ArticlesService;
import com.service.CommentService;
import com.service.TagsService;
import com.service.impl.ArticlesServiceImpl;
import com.service.impl.CommentServiceImpl;
import com.service.impl.TagsServiceImpl;
import com.utils.DataUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ArticleServlet extends BasicServlet{

    private ArticlesService articlesService = new ArticlesServiceImpl();

    private CommentService commentService = new CommentServiceImpl();

    private TagsService tagsService = new TagsServiceImpl();


    protected void addArticle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String articleTitle = req.getParameter("articleTitle");
        String articleTags = req.getParameter("articleTags");
        String articleCategory = req.getParameter("articleCategory");
        String articleBody = req.getParameter("articleBody");
        String articleAbstract = req.getParameter("articleAbstract");


        if (articleAbstract == null || articleAbstract.isEmpty()) {
            String substring = articleBody.substring(0, 128);
            articleAbstract = substring + "...";
        }

        Article article = new Article(null, articleTitle, articleAbstract, articleBody, 1, new Date(), articleTags, articleCategory);
        int update = articlesService.storeArticleInTheDataBase(article);
        System.out.println("update=" + update);

        req.getRequestDispatcher("/articleServlet?action=queryArticles").forward(req, resp);
    }


    protected void queryArticles(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // get comments
        List<Comment> commentList = commentService.queryComments();
        Object attribute = session.getAttribute("commentList");
        if (attribute == null) {
            session.setAttribute("commentList", commentList);
        }

        // get Tags
        List<Tag> tagList = tagsService.queryTags();
        Object attribute1 = session.getAttribute("tagList");
        if (attribute1 == null) {
            session.setAttribute("tagList", tagList);
        }
        // 增加一个Json版本的Session
        String tagListJson = new Gson().toJson(tagList);
        session.setAttribute("tagListJson", tagListJson);


        //get Articles
        List<Article> articleList = articlesService.queryArticles();
        session.setAttribute("articleList", articleList);

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }


    protected void articleDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int articleId = DataUtils.parseInt(req.getParameter("articleId"), 0);

        HttpSession session = req.getSession();
        List<Article> articleList = (List<Article>) session.getAttribute("articleList");

        Article targetArticle =null;
        for (Article article : articleList) {
            if (article.getId() == articleId) {
                targetArticle = article;
                break;
            }
        }

        System.out.println("articleId=" + articleId + "targetArticle=" + targetArticle);
        req.setAttribute("targetArticle", targetArticle);
        req.getRequestDispatcher("/content.jsp").forward(req, resp);
    }


    protected void deleteArticleByArticleId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int articleId = DataUtils.parseInt(req.getParameter("articleId"), 0);
        System.out.println("articleId=" + articleId);
        int update = articlesService.removeArticleByArticleId(articleId);
        System.out.println("update=" + update);

        if (update == 1) { // delete successful
            // update session
            HttpSession session = req.getSession();
            List<Article> articleList = (List<Article>) session.getAttribute("articleList");
            for (Article article : articleList) {
                if (article.getId() == articleId) {
                    articleList.remove(article);
                    break;
                }
            }
        }

        resp.sendRedirect(req.getHeader("Referer"));
    }


    protected void editArticleByArticleId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int articleId = DataUtils.parseInt(req.getParameter("articleId"), 0);
        System.out.println("articleId=" + articleId);

        String articleTitle = req.getParameter("articleTitle");
        String articleTags = req.getParameter("articleTags");
        String articleAbstract = req.getParameter("articleAbstract");
        String articleCategory = req.getParameter("articleCategory");
        String articleBody = req.getParameter("articleBody");

        System.out.println("articleTitle=" + articleTitle);
        System.out.println("articleTags=" + articleTags);
        System.out.println("articleAbstract=" + articleAbstract);
        System.out.println("articleCategory=" + articleCategory);
        System.out.println("articleBody=" + articleBody);

        Article article = new Article(null, articleTitle, articleAbstract, articleBody, null, new Date(), articleTags, articleCategory);
        int update = articlesService.updateArticleByArticleId(article, articleId);
        System.out.println("update=" + update);

        req.getRequestDispatcher("/articleServlet?action=queryArticles").forward(req, resp);
    }
}
