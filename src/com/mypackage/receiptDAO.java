package com.mypackage;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 6/2/2015.
 */
public class receiptDAO {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    public List<receipt> getAllReceipt(int startIndex, int numberOfProductPerpage) {
        List<receipt> list = new ArrayList<receipt>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from receipt limit ?,?";
        receipt re;
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,startIndex);
            psmt.setInt(2,numberOfProductPerpage);
            ResultSet rs = psmt.executeQuery();
            while(rs.next()){
                re = new receipt();
                re.setreceiptID(rs.getInt("ReceiptID"));
                re.setclient(rs.getString("Client"));
                re.settotal(rs.getLong("TotalPrice"));
                re.setdate(rs.getDate("date"));
                re.setstatus(rs.getInt("status"));
                re.setdatestatus(rs.getDate("datestatus"));
                list.add(re);
            }
        }

        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }

    public int countallreceipt(){
        int j = 0;
        int perPagesArticles = 9;
        String database = "u101063145_data";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "SELECT count(*) from receipt";
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

    public List<receiptdetail> getreceiptdetail(String receiptid){
        List<receiptdetail> list = new ArrayList<receiptdetail>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "SELECT * from receiptdetail where ReceiptID = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,receiptid);
            ResultSet rs = psmt.executeQuery();

            while(rs.next()){
                receiptdetail r = new receiptdetail();
                r.setdetailid(rs.getInt("DetailID"));
                r.setreceiptid(rs.getInt("ReceiptID"));
                r.setsku(rs.getInt("Sku"));
                r.setprice(rs.getInt("Price"));
                r.setquantity(rs.getInt("Quantity"));
                r.settotal(rs.getLong("Total"));
                list.add(r);
            }

            psmt.close();
            if(conn!=null){
                conn.close();
                conn = null;
            }
        }
        catch(SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }
}
