package com.mypackage;

import java.sql.*;

/**
 * Created by Long on 5/18/2015.
 */
public class Category {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    private int _catid;
    private String _name;
    public int getid() {
        return _catid;
    }

    public void setcatid(int value) {
        _catid = value;
    }

    public String getName() {
        return _name;
    }

    public void setName(String value) {
        _name = value;
    }


    public Category() {
    }

    public Category(int catid, String name) {
        _catid = catid;
        _name = name;
    }

    public boolean Update(Category cat){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String sql = "update category set catname = ? where catid = ? ";
        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, "root", "");
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, cat._name);
            psmt.setInt(2, cat._catid);
            int i = psmt.executeUpdate();
            success = (i == 1);
            psmt.close();
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean Delete(int catid){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String sql = "delete from category where catid = ?";
        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, "root", "");
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, catid);
            int i = psmt.executeUpdate();
            success = (i == 1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }

        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean Insert(Category cat){
        boolean success = false;
        String sql = "Insert into category(catname) VALUES (?)";
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        try {
            Connection conn = DriverManager.getConnection(connectionURL, "root", "");
            PreparedStatement psmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            psmt.setString(1, cat._name);
            int i = psmt.executeUpdate();
            ResultSet rs = psmt.getGeneratedKeys();
            if (rs.next()) {
                cat._catid = rs.getInt(1);
            }
            success = (i == 1);
            psmt.close();
            conn.close();
        }
        catch(SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

}
