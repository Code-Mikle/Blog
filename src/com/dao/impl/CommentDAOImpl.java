package com.dao.impl;

import com.dao.BasicDAO;
import com.dao.CommentDAO;
import com.entity.Comment;

import java.util.List;

public class CommentDAOImpl extends BasicDAO<Comment> implements CommentDAO {
    @Override
    public int storeUserCommentsInTheDatabase(Comment comment) {
//        String sql = "INSERT INTO `reader_wall` (`nickname`, `comment`, `email`, `comment_time`) " +
//                "VALUE(?, ?, ?, ?);";
        String sql = "INSERT INTO [readerWall] ([nickname], [comment], [email], [commentTime]) " +
                "VALUES(?, ?, ?, ?);";
        return update(sql, comment.getNickname(), comment.getComment(), comment.getEmail(), comment.getCommentTime());
    }

    @Override
    public List<Comment> queryComments() {
//        String sql = "SELECT `id`, `nickname`, `comment`, `email`, `comment_time` commentTime FROM `reader_wall`;";
        String sql = "SELECT [id], [nickname], [comment], [email], [commentTime] commentTime FROM [readerWall];";
        return queryMulti(sql, Comment.class);
    }

    @Override
    public int removeCommentsByIdList(List<Integer> idList) {
        int countUpdate = 0;
//        String sql = "DELETE FROM `reader_wall` WHERE `id`=?;";
        String sql = "DELETE FROM [readerWall] WHERE [id]=?;";
        for (Integer id : idList) {
            countUpdate += update(sql, id);
        }
        return countUpdate;
    }


}
