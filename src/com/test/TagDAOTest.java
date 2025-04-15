package com.test;

import com.dao.TagDAO;
import com.dao.impl.TagDAOImpl;
import com.entity.Tag;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;

public class TagDAOTest {

    private TagDAO tagDAO = new TagDAOImpl();

    @Test
    public void storeNewTagIntoDatabase() {
        Tag tag = new Tag(null, "C/C++", new Date());
        int update = tagDAO.storeNewTagIntoDatabase(tag);
        System.out.println("update=" + update);
    }

    @Test
    public void queryTags() {
        List<Tag> tags = tagDAO.queryTags();
        for (Tag tag : tags) {
            System.out.println(tag);
        }
    }

    @Test
    public void removeTagById() {
        int update = tagDAO.removeTagById(2);
        System.out.println("update=" + update);
    }


}
