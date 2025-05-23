package com.dao;

import com.entity.Comment;

import java.util.List;


/**
 * DAO corresponding to user comments
 */
public interface CommentDAO {

    /**
     * Store User Comments in the Database.
     * @param comment the Comment Object
     * @return Return -1, if failed; otherwise, return number(number > 0)
     */
    public int storeUserCommentsInTheDatabase(Comment comment);

    /**
     * Return all entries of the `reader_wall` table in Database.
     * @return Success, return the Comment set; otherwise, return null.
     */
    public List<Comment> queryComments();

    /**
     * Remove comments based on its id.
     * @param idList the collection of id for comments the need to be deleted.
     * @return Return 0, removal failed; return 1, removal successful.
     */
    public int removeCommentsByIdList(List<Integer> idList);
}
