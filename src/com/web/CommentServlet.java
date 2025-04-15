package com.web;

import com.entity.Comment;
import com.service.CommentService;
import com.service.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CommentServlet extends BasicServlet {

    private CommentService commentService = new CommentServiceImpl();

    /**
     * insert comment into the database
     */
    protected void addComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CommentServlet的doPost()方法被调用！");

        req.setCharacterEncoding("UTF-8");
        String commentName = req.getParameter("commentName");
        String commentEmail = req.getParameter("commentEmail");
        String commentContent = req.getParameter("commentContent");
        System.out.println("commentName=" + commentName);
        System.out.println("commentEmail=" + commentEmail);
        System.out.println("commentContent=" + commentContent);

        Comment comment = new Comment(null, commentName, commentContent, commentEmail, LocalDate.now().toString());
        int update = commentService.storeUserCommentsInTheDatabase(comment);
        System.out.println("update=" + update);

        //        req.getRequestDispatcher("commentServlet?action=queryComments").forward(req, resp);
        resp.sendRedirect(req.getContextPath() + "/commentServlet?action=queryComments");
    }

    /**
     * return all comments of the `reader_wall` table
     */
    protected void queryComments(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Comment> commentList = commentService.queryComments();
        for (Comment comment : commentList) {
            System.out.println(comment);
        }

        HttpSession session = req.getSession();
        Object attribute = session.getAttribute("commentList");
//        if (attribute == null) {
//            session.setAttribute("commentList", commentList);
//        }

        session.setAttribute("commentList", commentList);

//        resp.sendRedirect(req.getContextPath() + "/commentServlet?action=queryComments");
        req.getRequestDispatcher("/readerWall.jsp").forward(req, resp);
    }


    /**
     * remove comments based on idList
     */
    protected void removeCommentByIdList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String deleteIdList = req.getParameter("deleteIdList");
        String[] strings = deleteIdList.split(",");
        System.out.println("strings.length=" + strings.length);
        ArrayList<Integer> idList = new ArrayList<>();
        for (String stringId : strings) {
            idList.add(Integer.parseInt(stringId));
        }

        int countRows = commentService.removeCommentsByIdList(idList);
        System.out.println("countRows=" + countRows);

//        resp.sendRedirect(req.getContextPath() + "/commentServlet?action=queryComments");

        // 刷新评论管理页面
        List<Comment> commentList = commentService.queryComments();
        for (Comment comment : commentList) {
            System.out.println(comment);
        }

        HttpSession session = req.getSession();
        Object attribute = session.getAttribute("commentList");
        session.setAttribute("commentList", commentList);

        String referer = req.getHeader("Referer");
        System.out.println("referer=" + referer);
        resp.sendRedirect(referer);

    }
}
