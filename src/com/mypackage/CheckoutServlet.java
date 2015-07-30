package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 6/2/2015.
 */
@WebServlet(name = "CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private HttpSession session ;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = "";
        session = request.getSession();
        if(session.getAttribute("username")==null){
            session.setAttribute("msgcheckout","Please login first");
            session.setAttribute("logincart",1);
        }
        else {
            username = (String) session.getAttribute("username");
            String total = request.getParameter("totalPrice");
            long tongtien = Long.parseLong(total);
            int receiptid = Checkout(username, tongtien);
            session = request.getSession();
            List<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");

            for (Cart c : cart) {
                CheckoutDetail(receiptid, c.getP().getSKU(), c.getP().getprice(), c.getQuantity());
            }

            session.removeAttribute("cart");
            session.removeAttribute("cartsize");
            session.setAttribute("msgcheckout", "you have successfully ordered. Please wait until we call you to confirm this. Thank you");

        }
        response.sendRedirect("index.jsp");
    }
    public int Checkout(String username, long tongtien){
        int receiptid = 0;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql="Insert into receipt(Client,TotalPrice,date) values(?,?,NOW())";
        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            psmt.setString(1,username);
            psmt.setLong(2, tongtien);
            psmt.executeUpdate();
            ResultSet rs = psmt.getGeneratedKeys();
            if(rs.next()){
                receiptid = rs.getInt(1);
            }
        }
        catch (SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return receiptid;
    }

    public boolean CheckoutDetail(int receiptID, int sku, int price, int quantity){
        boolean success = false;
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql="Insert into receiptdetail(ReceiptID,SKU,Price,Quantity,total) values(?,?,?,?,?)";
        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,receiptID);
            psmt.setInt(2,sku);
            psmt.setInt(3,price);
            psmt.setInt(4,quantity);
            psmt.setLong(5, price * quantity);
            int i = psmt.executeUpdate();
            success=(i==1);
        }
        catch (SQLException sqle){
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
}
