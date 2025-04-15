package com.dao;

import com.entity.Admin;

public interface AdminDAO {

    /**
     * Return the corresponding Admin Object based on username and password
     * @return if exists, return Admin Object; otherwise return null;
     */
    public Admin queryAdminByUsernameAndPassword(String username, String password);

    /**
     * Insert new admin into table `admin`
     * @param admin new Admin Object
     * @return success, return 1; otherwise, return 0;
     */
    public int insertAdmin(Admin admin);
    
}
