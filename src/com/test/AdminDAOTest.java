package com.test;

import com.dao.AdminDAO;
import com.dao.impl.AdminDAOImpl;
import com.entity.Admin;
import org.junit.jupiter.api.Test;

public class AdminDAOTest {

    private AdminDAO adminDAO = new AdminDAOImpl();

    @Test
    public void queryAdminByUsernameAndPassword() {
        Admin admin = adminDAO.queryAdminByUsernameAndPassword("wang", "123456");
        if (admin != null) {
            System.out.println("Admin=" + admin);
        } else {
            System.out.println("Admin=null");
        }
    }

    @Test
    public void insertAdmin() {
        Admin admin = new Admin("jim", "123456", "jim@gmail.com");
        int res = adminDAO.insertAdmin(admin);
        System.out.println("res: " + res);
    }
}
