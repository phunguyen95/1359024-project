package com.mypackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 5/19/2015.
 */
public class CategoryDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    public CategoryDao() {
    }

    public List<Category> GetAll(){
        List<Category> list = new ArrayList<Category>();

        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from category";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int catid = rs.getInt("catid");
                String name = rs.getString("catname");
                Category cate = new Category(catid,name);
                list.add(cate);
            }

            psmt.close();
            rs.close();
            if (conn != null) {
                conn.close();
                conn = null;
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }

}
