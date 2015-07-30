package com.mypackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 6/16/2015.
 */
public class UserDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    public List<User> getAllUser(int startIndex, int numberOfProductPerpage) {
        List<User> list = new ArrayList<User>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from user where role = 2 limit ?,?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,startIndex);
            psmt.setInt(2,numberOfProductPerpage);
            ResultSet rs = psmt.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setuserid(rs.getInt("userid"));
                user.setusername(rs.getString("username"));
                user.setpassword(rs.getString("password"));
                user.setrole(rs.getInt("role"));
                user.setfname(rs.getString("firstname"));
                user.setlname(rs.getString("lastname"));
                user.setbirthday(rs.getDate("birthday"));
                user.setgender(rs.getString("gender"));
                user.settel(rs.getString("tel"));
                user.setaddress(rs.getString("address"));
                user.setemail(rs.getString("email"));
                list.add(user);
            }
        }

        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }

    public int countalluser(){
        int j = 0;
        int perPagesArticles = 9;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "SELECT count(*) from user where role = 2";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();
            if(rs.next()){
                int i =rs.getInt(1);
                j = 0;
                if(i/perPagesArticles < i * 1.0 / perPagesArticles) {
                    j = i/perPagesArticles + 1;
                }
                else{
                    j =  i / perPagesArticles;
                }
            }
        }
        catch(SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return j;
    }
}
