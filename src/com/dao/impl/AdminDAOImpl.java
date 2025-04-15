package com.dao.impl;

import com.dao.AdminDAO;
import com.dao.BasicDAO;
import com.entity.Admin;

public class AdminDAOImpl extends BasicDAO<Admin> implements AdminDAO {
    @Override
    public Admin queryAdminByUsernameAndPassword(String username, String password) {
//        String sql = "SELECT * FROM `admin` WHERE `username`=? AND `password`=MD5(?);";
//        String sql = "SELECT * FROM `Admin` WHERE `username`=? AND `password`=?;";
        String sql = "SELECT * FROM [admin] WHERE [username] = ? AND [password] = ?;";
        return querySingle(sql, Admin.class, username, password);
    }

    @Override
    public int insertAdmin(Admin admin) {
        String sql = "INSERT INTO [admin] ([username], [password], [email]) VALUES(?,?,?)";
        return update(sql, admin.getUsername(), admin.getPassword(), admin.getEmail());
    }






}
