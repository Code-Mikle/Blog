package com.test;

import com.entity.Comment;
import com.service.CommentService;
import com.service.impl.CommentServiceImpl;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CommentServiceTest {
    private CommentService commentService = new CommentServiceImpl();

    @Test
    public void storeUserCommentsInTheDatabase() {
        String string = LocalDate.now().toString();
        Comment liming = new Comment(null, "李铭",
                "据目前而言，还不错，可以进行测试！", "liming@126.com", string);
        int res = commentService.storeUserCommentsInTheDatabase(liming);
        System.out.println("res=" + res);
    }

    @Test
    public void queryComments() {
        List<Comment> commentList = commentService.queryComments();
        for (Comment comment : commentList) {
            System.out.println(comment);
        }
    }

    @Test
    public void removeCommentsById() {
        ArrayList<Integer> idList = new ArrayList<>();
        idList.add(1);
        idList.add(3);
        int update = commentService.removeCommentsByIdList(idList);
        System.out.println("update=" + update);
    }
}
