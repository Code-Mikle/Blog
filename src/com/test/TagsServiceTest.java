package com.test;

import com.entity.Tag;
import com.google.gson.Gson;
import com.service.TagsService;
import com.service.impl.TagsServiceImpl;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;

public class TagsServiceTest {

    private TagsService tagsService = new TagsServiceImpl();

    @Test
    public void storeNewTagIntoDatabase() {
        Tag tag = new Tag(null, "C/C++", new Date());
        int update = tagsService.storeNewTagIntoDatabase(tag);
        System.out.println("update=" + update);
    }

    @Test
    public void queryTags() {
        List<Tag> tags = tagsService.queryTags();
        for (Tag tag : tags) {
            System.out.println(tag);
        }

        String json = new Gson().toJson(tags);
        System.out.println("json=" + json);
    }

    @Test
    public void removeTagById() {
        int update = tagsService.removeTagById(3);
        System.out.println("update=" + update);
    }
}
