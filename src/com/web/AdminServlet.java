package com.web;

import com.entity.Admin;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminServlet extends HttpServlet {

    private AdminService adminService = new AdminServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AdminServlet的doGet()方法被调用！");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AdminServlet的doPost()方法被调用！");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Admin admin = adminService.queryAdminByUsernameAndPassword(username, password);
        if (admin != null) {
            System.out.println("Login Successful!");
            HttpSession session = req.getSession();
            session.setAttribute("Admin", admin);
//            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            req.getRequestDispatcher("/articleServlet?action=queryArticles").forward(req, resp);
        } else {
            System.out.println("Login Failed!");
            req.setAttribute("msg", "Account or password error!");
            req.getRequestDispatcher("/manage/manage_login.jsp").forward(req, resp);
        }
    }
}
