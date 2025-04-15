package com.service.impl;

import com.dao.TagDAO;
import com.dao.impl.TagDAOImpl;
import com.entity.Tag;
import com.service.TagsService;

import java.util.List;

public class TagsServiceImpl implements TagsService {
    private TagDAO tagDAO = new TagDAOImpl();

    @Override
    public int storeNewTagIntoDatabase(Tag newTag) {
        return tagDAO.storeNewTagIntoDatabase(newTag);
    }

    @Override
    public List<Tag> queryTags() {
        return tagDAO.queryTags();
    }

    @Override
    public int removeTagById(int tagId) {
        return tagDAO.removeTagById(tagId);
    }
}
