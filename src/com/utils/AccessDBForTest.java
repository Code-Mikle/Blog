package com.utils;

import com.dao.AdminDAO;
import com.dao.impl.AdminDAOImpl;
import com.entity.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccessDBForTest {
    private static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=Blog;encrypt=true;trustServerCertificate=true";
    private static final String USER = "sa";
    private static final String PASSWORD = "123456";

    public List<Admin> getAllAdmins() {
        List<Admin> adminList = new ArrayList<>();
        String sql = "SELECT id, username, password, email FROM Admin";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                adminList.add(admin);
            }
        } catch (SQLException e) {
            System.err.println("数据库操作异常: " + e.getMessage());
            e.printStackTrace();
        }
        return adminList;
    }

    public static void main(String[] args) {
        AccessDBForTest dao = new AccessDBForTest();
        List<Admin> admins = dao.getAllAdmins();
        admins.forEach(admin -> System.out.println(
                "ID: " + admin.getId() +
                        ", Username: " + admin.getUsername() +
                        ", Email: " + admin.getEmail()));
    }

}


