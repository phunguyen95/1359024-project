package com.mypackage;

import java.sql.*;
import java.util.Date;

/**
 * Created by Long on 5/18/2015.
 */
public class Product {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    private int _sku;
    private String _name;
    private int _price;
    private int _quantity;
    private int _catid;
    private Date _date;
    private int _views;
    private String _image;
    private String _description;
    public int getSKU() {
        return _sku;
    }

    public void setSKU(int value) {
        _sku = value;
    }

    public String getName() {
        return _name;
    }

    public void setName(String value) {
        _name = value;
    }

    public int getprice() {
        return _price;
    }

    public void setprice(int value) {
        _price = value;
    }

    public int getquantity() {
        return _quantity;
    }

    public void setquantity(int value) {
        _quantity = value;
    }

    public int getcatid() {
        return _catid;
    }

    public void setcatid(int value) {
        _catid = value;
    }

    public Date getdate() { return _date;}

    public void setdate(Date date) { _date = date;}

    public int getviews() {
        return _views;
    }

    public void setviews(int value) {
        _views = value;
    }

    public String getimage(){return _image;}

    public void setimage(String value){_image=value;}

    public String getdescription(){return _description;}

    public void setdescription(String value){_description=value;}
    public Product() {
    }

    public Product(int sku, String name, int price, int quantity, int catid, Date date, int views, String image, String description) {
        _sku = sku;
        _name = name;
        _price = price;
        _quantity = quantity;
        _catid = catid;
        _date = date;
        _views = views;
        _image = image;
        _description = description;
    }

    public int getViews(Product p){
        int views = 0;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select views from product where sku = ?";
        int count = 0;
        try{
            Connection conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,p._sku);
            ResultSet rs = psmt.executeQuery();
            if(rs.next()){
                count = rs.getInt("views");
            }

            String sql1 = "update product set views = ? where sku = ?";
            PreparedStatement psmt1 = conn.prepareStatement(sql1);
            psmt1.setInt(1,count+1);
            psmt1.setInt(2,p._sku);
            psmt1.executeUpdate();

            String sql2 = "select views from product where sku = ?";
            PreparedStatement psmt2 = conn.prepareStatement(sql2);
            psmt2.setInt(1,p._sku);
            ResultSet rs1 = psmt2.executeQuery();
            if(rs1.next()){
                views = rs.getInt("views");
                views = views + 1;
            }
            psmt2.close();
            psmt1.close();
            psmt.close();
            if (conn != null) {
                conn.close();
                conn = null;
            }
        }
        catch(SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return views;
    }

    public Product getProduct(Product p) {
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product where sku=?";
        Connection conn;
        try {
            conn=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, p._sku);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                p._sku = rs.getInt("sku");
                p._name = rs.getString("name");
                p._price = rs.getInt("price");
                p._quantity = rs.getInt("quantity");
                p._catid = rs.getInt("catid");
                p._date = rs.getDate("date");
                p._views = rs.getInt("views");
                p._image = rs.getString("image");
                p._description = rs.getString("description");
            }
            psmt.close();
            if(conn!=null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return p;
    }

    public boolean addproduct(Product p){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "Insert into product(name,price,quantity,catid,date,image,description) values(?,?,?,?,NOW(),?,?)";
        Connection conn;
        try {
            conn=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,p._name);
            psmt.setInt(2,p._price);
            psmt.setInt(3,p._quantity);
            psmt.setInt(4,p._catid);
            psmt.setString(5,p._image);
            psmt.setString(6,p._description);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean updateProduct1(int sku, String name, int price, int quantity,String description ){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql ="update product set name = ?, price = ?,quantity = ?, description = ? where sku =?";
        Connection conn;
        try {
            conn=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,name);
            psmt.setInt(2,price);
            psmt.setInt(3,quantity);
            psmt.setString(4, description);
            psmt.setInt(5, sku);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean updateProduct(int sku, String name, int price, int quantity,String description,String image ){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql ="update product set name = ?, price = ?,quantity = ?, description = ?, image = ? where sku =?";
        Connection conn;
        try {
            conn=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,name);
            psmt.setInt(2, price);
            psmt.setInt(3,quantity);
            psmt.setString(4, description);
            psmt.setString(5,image);
            psmt.setInt(6, sku);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean deleteProduct(int sku){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql ="Delete from product where sku =?";
        Connection conn;
        try {
            conn=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,sku);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

}
