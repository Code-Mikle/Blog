package com.dao;

import com.entity.Tag;

import java.util.List;

/**
 * DAO corresponding to article's tags
 */
public interface TagDAO {

    /**
     * store new tag into database.
     * @param newTag the Tag Object
     * @return success, return 0; otherwise, return 1.
     */
    public int storeNewTagIntoDatabase(Tag newTag);

    /**
     * Return Tag collection
     * @return List collection of tags
     */
    public List<Tag> queryTags();

    /**
     * delete tag form database based on tagId.
     * @param tagId the id of the Tag
     * @return success, return 1; otherwise, return 0.
     */
    public int removeTagById(int tagId);


}
