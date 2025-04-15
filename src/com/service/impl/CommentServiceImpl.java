package com.service.impl;

import com.dao.CommentDAO;
import com.dao.impl.CommentDAOImpl;
import com.entity.Comment;
import com.service.CommentService;

import java.util.List;

public class CommentServiceImpl implements CommentService {

    private CommentDAO commentDAO = new CommentDAOImpl();
    @Override
    public int storeUserCommentsInTheDatabase(Comment comment) {
        return commentDAO.storeUserCommentsInTheDatabase(comment);
    }

    @Override
    public List<Comment> queryComments() {
        return commentDAO.queryComments();
    }

    @Override
    public int removeCommentsByIdList(List<Integer> idList) {
        return commentDAO.removeCommentsByIdList(idList);
    }
}
