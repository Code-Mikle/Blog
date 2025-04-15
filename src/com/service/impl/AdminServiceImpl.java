package com.service.impl;

import com.dao.AdminDAO;
import com.dao.impl.AdminDAOImpl;
import com.entity.Admin;
import com.service.AdminService;

public class AdminServiceImpl implements AdminService {

    private AdminDAO adminDAO = new AdminDAOImpl();
    @Override
    public Admin queryAdminByUsernameAndPassword(String username, String password) {
        return adminDAO.queryAdminByUsernameAndPassword(username, password);
    }
}
