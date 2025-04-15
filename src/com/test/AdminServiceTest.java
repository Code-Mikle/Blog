package com.test;

import com.entity.Admin;
import com.entity.Article;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class AdminServiceTest {
    private AdminService adminService = new AdminServiceImpl();

    @Test
    public void queryAdminByUsernameAndPassword() {
        Admin admin = adminService.queryAdminByUsernameAndPassword("admins", "admin");
        if (admin != null) {
            System.out.println("Admin=" + admin);
        } else {
            System.out.println("Admin=null");
        }
    }

}
