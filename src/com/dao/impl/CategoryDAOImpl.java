package com.dao.impl;

import com.dao.BasicDAO;
import com.dao.CategoryDAO;
import com.entity.Category;

import java.util.List;

public class CategoryDAOImpl extends BasicDAO<Category> implements CategoryDAO {
    @Override
    public int storeNewCategoryIntoDatabase(Category newCategory) {
//        String sql = "INSERT INTO `category` (`category_name`, `create_time`) " +
//                "VALUE(?, ?);";

        String sql = "INSERT INTO [category] ([categoryName], [createTime]) " +
                "VALUES(?, ?);";
        return update(sql, newCategory.getCategoryName(), newCategory.getCreateTime());
    }

    @Override
    public List<Category> queryCategories() {
        return null;
    }

    @Override
    public int removeCategoryById(int categoryId) {
        return 0;
    }
}
