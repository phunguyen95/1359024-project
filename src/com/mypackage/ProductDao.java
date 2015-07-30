package com.mypackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 5/18/2015.
 */
public class ProductDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    public ProductDao() {
    }

    public List<Product> getAllPaging(int page, int rowsperpage){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product limit ?,?";
        int p1 = (page-1)*rowsperpage;
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,p1);
            psmt.setInt(2,rowsperpage);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid, date, views, image, description);
                list.add(product);
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

    public List<Product> GetByCatPaging(int catid, int page, int rows){
        List<Product> list = new ArrayList<Product>();

        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product p join category c on  p.catid = c.catid where p.catid = ? limit ?,?";
        int p1 = (page-1)*rows;
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,catid);
            psmt.setInt(2,p1);
            psmt.setInt(3,rows);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid1 = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid, date, views, image, description);
                list.add(product);
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

    public List<Product> GetNewestPaging(int page, int rows){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product order by date DESC limit ?,?";
        int p1 = (page-1)*rows;
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,p1);
            psmt.setInt(2,rows);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid, date, views, image, description);
                list.add(product);
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

    public List<Product> GetMostView(){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product order by Views DESC limit 9";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid, date, views, image, description);
                list.add(product);
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

    public List<Product> getListByName(String _name,String _price,int _category, int startIndex, int numberOfProductPerpage) {
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "";
        int condition = 0;
        if(!_name.equals("") && !_price.equals("") && !_price.equals("0") && _category!=0){
            condition = 1;
            if(_price.equals("low")) {
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price<30000000 and p.catid=? ORDER BY p.price ASC limit ?,? ";
            }
            else if(_price.equals("average")){
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price<100000000 and p.catid=? ORDER BY p.price ASC limit ?,?";
            }
            else{
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price>100000000 and p.catid=? ORDER BY p.price ASC limit ?,?";
            }
        }
        else if(!_name.equals("") && !_price.equals("") && !_price.equals("0")){
            condition = 2;
            if(_price.equals("low")) {
                sql = "SELECT * FROM product where name LIKE ? and price<30000000 ORDER BY price ASC limit ?,?";
            }
            else if(_price.equals("average")){
                sql = "SELECT * FROM product where name LIKE ? and price<100000000 ORDER BY price ASC limit ?,?";
            }
            else{
                sql = "SELECT * FROM product where name LIKE ? and price>100000000 ORDER BY price ASC limit ?,?";
            }
        }
        else if(!_name.equals("") && _category!=0){
            condition = 3;
            sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.catid=? ORDER BY p.price ASC limit ?,?";
        }
        else if(!_price.equals("") && !_price.equals("0") && _category!=0){
            condition = 4;
            if(_price.equals("low")) {
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.price<30000000 and p.catid=? ORDER BY p.price ASC limit ?,?";
            }
            else if(_price.equals("average")){
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.price<100000000 and p.catid=? ORDER BY p.price ASC limit ?,?";
            }
            else{
                sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where p.price>100000000 and p.catid=? ORDER BY p.price ASC limit ?,?";
            }
        }
        else if(!_name.equals("")) {
            condition = 5;
            sql = "SELECT * FROM product where name like ? ORDER BY price ASC limit ?,?";
        }
        else if(!_price.equals("") && !_price.equals("0")){
            condition = 6;
            if(_price.equals("low")) {
                sql = "SELECT * FROM product where price<30000000 ORDER BY price ASC limit ?,?";
            }
            else if(_price.equals("average")){
                sql = "SELECT * FROM product where price<100000000 ORDER BY price ASC limit ?,?";
            }
            else if(_price.equals("high")){
                sql = "SELECT * FROM product where price>100000000 ORDER BY price ASC limit ?,?";
            }
        }
        else if(_category!=0){
            condition = 7;
            sql = "SELECT * FROM product p JOIN category c on p.catid = c.catid where  p.catid=? ORDER BY p.price ASC limit ?,?";
        }
        else{
            condition = 8;
            sql = "SELECT * FROM product ORDER BY price ASC limit ?,?";
        }
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            if(condition==1 || condition==3){
                psmt.setString(1, "%" + _name + "%");
                psmt.setInt(2,_category);
                psmt.setInt(3,startIndex);
                psmt.setInt(4,numberOfProductPerpage);
            }
            else if(condition==2 || condition==5){
                psmt.setString(1, "%" + _name + "%");
                psmt.setInt(2,startIndex);
                psmt.setInt(3,numberOfProductPerpage);
            }
            else if(condition==4 || condition==7){
                psmt.setInt(1,_category);
                psmt.setInt(2,startIndex);
                psmt.setInt(3,numberOfProductPerpage);
            }
            else if(condition==8 || condition==6){
                psmt.setInt(1,startIndex);
                psmt.setInt(2,numberOfProductPerpage);
            }
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid, date, views, image, description);
                list.add(product);
            }

            if(psmt!=null) {
                psmt.close();
                psmt = null;
            }

            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }

    public int countAllProduct(String _name,String _price,int _category){
        int perPagesArticles = 9;
        int j = 0;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "";
        int condition = 0;
        if(!_name.equals("") && !_price.equals("") && !_price.equals("0") && _category!=0){
            condition = 1;
            if(_price.equals("low")) {
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price<30000000 and p.catid=?";
            }
            else if(_price.equals("average")){
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price<100000000 and p.catid=?";
            }
            else{
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.price>100000000 and p.catid=?";
            }
        }
        else if(!_name.equals("") && !_price.equals("") && !_price.equals("0")){
            condition = 2;
            if(_price.equals("low")) {
                sql = "SELECT count(*) FROM product where name LIKE ? and price<30000000";
            }
            else if(_price.equals("average")){
                sql = "SELECT count(*) FROM product where name LIKE ? and price<100000000";
            }
            else{
                sql = "SELECT count(*) FROM product where name LIKE ? and price>100000000";
            }
        }
        else if(!_name.equals("") && _category!=0){
            condition = 3;
            sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.name LIKE ? and p.catid=?";
        }
        else if(!_price.equals("") && !_price.equals("0") && _category!=0){
            condition = 4;
            if(_price.equals("low")) {
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.price<30000000 and p.catid=?";
            }
            else if(_price.equals("average")){
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.price<100000000 and p.catid=?";
            }
            else{
                sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where p.price>100000000 and p.catid=? ";
            }
        }
        else if(!_name.equals("")) {
            condition = 5;
            sql = "SELECT count(*) FROM product where name like ?";
        }
        else if(!_price.equals("") && !_price.equals("0")){
            condition = 6;
            if(_price.equals("low")) {
                sql = "SELECT count(*) FROM product where price<30000000";
            }
            else if(_price.equals("average")){
                sql = "SELECT count(*) FROM product where price<100000000";
            }
            else if(_price.equals("high")){
                sql = "SELECT count(*) FROM product where price>100000000";
            }
        }
        else if(_category!=0){
            condition = 7;
            sql = "SELECT count(*) FROM product p JOIN category c on p.catid = c.catid where  p.catid=?";
        }
        else{
            condition = 8;
            sql = "SELECT count(*) FROM product";
        }
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            if (condition == 1 || condition == 3) {
                psmt.setString(1, "%" + _name + "%");
                psmt.setInt(2, _category);
            } else if (condition == 2 || condition == 5) {
                psmt.setString(1, "%" + _name + "%");
            } else if (condition == 4 || condition == 7) {
                psmt.setInt(1, _category);
            }
            ResultSet rs = psmt.executeQuery();
            if(rs.next()){
                int i =rs.getInt(1);
                if(i/perPagesArticles < i * 1.0 / perPagesArticles) {
                    j = i/perPagesArticles + 1;
                }
                else{
                    j =  i / perPagesArticles;
                }
            }
        }
        catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return j;
    }

    public List<Product> GetByCate(int catid){
        List<Product> list = new ArrayList<Product>();

        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product p join category c on  p.catid = c.catid where p.catid = ?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, catid);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid1 = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name, price, quantity, catid1, date, views, image, description);
                list.add(product);
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

    public List<Product> top9best(){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select  *, SUM(quantity) AS total from receiptdetail group by sku ORDER BY total desc limit 9";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                Product p = new Product();
                p.setSKU(sku);
                Product p1 = new Product().getProduct(p);
                list.add(p1);
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

    public List<Product> searchajax(String name){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product where name like ?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, "%" + name + "%");
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name1 = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid1 = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name1, price, quantity, catid1, date, views, image, description);
                list.add(product);
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

    public List<Product> topNewest(int num){
        List<Product> list = new ArrayList<Product>();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product order by date DESC limit ?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, num);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                int sku = rs.getInt("sku");
                String name1 = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int catid1 = rs.getInt("catid");
                Date date = rs.getDate("date");
                int views = rs.getInt("views");
                String image = rs.getString("image");
                String description = rs.getString("description");
                Product product = new Product(sku, name1, price, quantity, catid1, date, views, image, description);
                list.add(product);
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
