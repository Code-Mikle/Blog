package com.service;

import com.entity.Admin;

/**
 * 处理和管理员相关的业务操作
 */
public interface AdminService {

    /**
     * Return the corresponding Admin Object based on username and password
     * @param username submitted username
     * @param password submitted password
     * @return if exists, return Admin Object; otherwise, return null.
     */
    public Admin queryAdminByUsernameAndPassword(String username, String password);
}
