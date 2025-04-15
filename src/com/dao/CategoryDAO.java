package com.dao;

import com.entity.Category;

import java.util.List;

/**
 * DAO corresponding to article's category
 */
public interface CategoryDAO {

    /**
     * store new category into database.
     * @param newCategory the Category Object
     * @return success, return 0; otherwise, return 1.
     */
    public int storeNewCategoryIntoDatabase(Category newCategory);

    /**
     * Return Category collection
     * @return List collection of categories
     */
    public List<Category> queryCategories();

    /**
     * delete category form database based on categoryId.
     * @param categoryId the id of the Category
     * @return success, return 1; otherwise, return 0.
     */
    public int removeCategoryById(int categoryId);
}
