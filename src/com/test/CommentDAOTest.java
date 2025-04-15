package com.test;

import com.dao.CommentDAO;
import com.dao.impl.CommentDAOImpl;
import com.entity.Comment;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOTest {

    private CommentDAO commentDAO = new CommentDAOImpl();

    @Test
    public void storeUserCommentsInTheDatabase() {
        Comment wilbur = new Comment(null, "Wilbur", "十分不错！", "wilbur@qq.com", LocalDate.now().toString());
        int res = commentDAO.storeUserCommentsInTheDatabase(wilbur);
        System.out.println("res=" + res);
    }

    @Test
    public void queryComments() {
        List<Comment> commentList = commentDAO.queryComments();
        for (Comment comment : commentList) {
            System.out.println(comment);
        }
    }

    @Test
    public void removeCommentsById() {
        ArrayList<Integer> idList = new ArrayList<>();
        idList.add(9);
        idList.add(1);
        int update = commentDAO.removeCommentsByIdList(idList);
        System.out.println("update=" + update);
    }
}
