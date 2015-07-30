package com.mypackage;

import java.sql.*;
import java.util.Date;

/**
 * Created by Long on 5/23/2015.
 */
public class User {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }
    private int _userid;
    private String _username;
    private String _password;
    private int _role;
    private String _fname;
    private String _lname;
    private Date _birthday;
    private String _gender;
    private String _tel;
    private String _address;
    private String _email;

    public User(){}

    public User(String username, String password, int role, String fname, String lname, Date birthday, String gender, String tel, String address, String email){
        _username = username;
        _password = password;
        _role = role;
        _fname = fname;
        _lname = lname;
        _birthday = birthday;
        _gender = gender;
        _tel = tel;
        _address = address;
        _email = email;
    }

    public int getuserid(){return _userid;}
    public void setuserid(int value){_userid=value;}
    public String getusername(){return _username;}
    public void setusername(String value){_username=value;}
    public String getpassword(){return _password;}
    public void setpassword(String value){_password=value;}
    public int getrole(){return _role;}
    public void setrole(int value){_role=value;}
    public String getfname(){return _fname;}
    public void setfname(String value){_fname=value;}
    public String getlname(){return _lname;}
    public void setlname(String value){_lname=value;}
    public Date getbirthday(){return _birthday;}
    public void setbirthday(Date value){_birthday=value;}
    public String getgender(){return _gender;}
    public void setgender(String value){_gender=value;}
    public String gettel(){return _tel;}
    public void settel(String value){_tel=value;}
    public String getaddress(){return _address;}
    public void setaddress(String value){_address=value;}
    public String getemail(){return _email;}
    public void setemail(String value){_email=value;}

    public User loginUser(String name, String pass){
        User user = new User();
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from user where username = ? and password = ?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, name);
            psmt.setString(2, pass);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                user._userid=rs.getInt("userid");
                user._username= rs.getString("username");
                user._password = rs.getString("password");
                user._role = rs.getInt("role");
                user._fname = rs.getString("firstname");
                user._lname = rs.getString("lastname");
                user._birthday= rs.getDate("birthday");
                user._gender = rs.getString("gender");
                user._tel = rs.getString("tel");
                user._address = rs.getString("address");
                user._email = rs.getString("email");
            }
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return user;
    }

    public void registerUser(String username, String password, String fname, String lname, java.sql.Date bday, String gender, String tel, String address, String email){
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "Insert into user(username,password,role,firstname,lastname,birthday,gender,tel,address,email)"
                + " values(?,?,2,?,?,?,?,?,?,?)";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,username);
            psmt.setString(2,password);
            psmt.setString(3,fname);
            psmt.setString(4,lname);
            psmt.setDate (5,bday);
            psmt.setString(6,gender);
            psmt.setString(7,tel);
            psmt.setString(8,address);
            psmt.setString(9,email);
            psmt.executeUpdate();
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
    }

    public boolean checkusername(String name){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String sql = "select * from user where username= ?";
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, "root", "");
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, name);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                success = true;
            }
            psmt.close();
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean checkemail(String name){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String sql = "select * from user where email= ?";
        Connection conn;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, "root", "");
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,name);
            ResultSet rs = psmt.executeQuery();
            if(rs.next()){
                success = true;
            }
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle){
            sqle.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean editname(int id,String fname){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set firstname = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,fname);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean editemail(int id,String email){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set email = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,email);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean editpassword(int id,String pass){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set password = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,pass);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean editgender(int id,String gender){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set gender = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,gender);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean edittel(int id,String tel){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set tel = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,tel);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean editaddress(int id,String address){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set address = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,address);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }

    public boolean editbirthday(int id,Date date){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update user set birthday = ? where userid = ?";
        Connection conn;
        try{
            conn = DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setDate(1,(java.sql.Date) date);
            psmt.setInt(2,id);
            int i = psmt.executeUpdate();
            success = (i==1);
            psmt.close();
            if(conn!=null){
                conn.close();
                conn=null;
            }
        }catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
}
