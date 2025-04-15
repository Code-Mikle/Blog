package com.dao.impl;

import com.dao.BasicDAO;
import com.dao.TagDAO;
import com.entity.Tag;

import javax.swing.text.html.HTML;
import java.util.List;

public class TagDAOImpl extends BasicDAO<Tag> implements TagDAO {

    @Override
    public int storeNewTagIntoDatabase(Tag newTag) {
//        String sql = "INSERT INTO `tags`(`tag_name`, `create_time`)" +
//                "VALUE(?, ?);";

        String sql = "INSERT INTO [tag]([tagName], [createTime])" +
                "VALUES(?, ?);";
        return update(sql, newTag.getTagName(), newTag.getCreateTime());
    }

    @Override
    public List<Tag> queryTags() {
//        String sql = "SELECT `id`, `tag_name` tagName, `create_time` createTime FROM `tags`;";
        String sql = "SELECT [id], [tagName], [createTime] FROM [tag];";
        return queryMulti(sql, Tag.class);
    }

    @Override
    public int removeTagById(int tagId) {
//        String sql = "DELETE FROM `tags` WHERE `id`=?;";
        String sql = "DELETE FROM [tag] WHERE [id]=?;";
        return update(sql, tagId);
    }
}
