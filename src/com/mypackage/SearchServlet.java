package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Long on 6/8/2015.
 */
@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    private List<Product> list ;
    private HttpSession session;
    private final int perPagesArticles = 9;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    public void countAllProduct(String _name,String _price,int _category){
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
                int j = 0;
                if(i/perPagesArticles < i * 1.0 / perPagesArticles) {
                    j = i/perPagesArticles + 1;
                }
                else{
                    j =  i / perPagesArticles;
                }
                session.setAttribute("allpages", j);
            }
        }
            catch(SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        String adminpage = "";
        if(request.getParameter("adminpage")!=null){
            adminpage = request.getParameter("adminpage");
        }
        String specialspage = "";
        if(request.getParameter("specialspage")!=null){
            specialspage = request.getParameter("specialspage");
        }
        String _name = "";
        String name = null;
        int sku = 0;
        if(request.getParameter("sku")!=null){
            name = request.getParameter("sku");
            sku = Integer.parseInt(name);
        }
        if(request.getParameter("txtname")!=null){
            _name = request.getParameter("txtname");
            session.setAttribute("txtname",_name);
        }
        else if(session.getAttribute("txtname")!=null){
            _name = (String) session.getAttribute("txtname");
        }
        String price = "";
        if(request.getParameter("txtpricesearch")!=null){
            price=request.getParameter("txtpricesearch");
            session.setAttribute("txtpricesearch",price);
        }
        else if(session.getAttribute("txtpricesearch")!=null){
            price = (String) session.getAttribute("txtpricesearch");
        }
        String category = "";
        int cate = 0;
        if(request.getParameter("txtcategory")!=null){
            category = request.getParameter("txtcategory");
            cate = Integer.parseInt(category);
            session.setAttribute("txtcategory",category);
        }
        else if(session.getAttribute("txtcategory")!=null){
            category = (String) session.getAttribute("txtcategory");
            cate = Integer.parseInt(category);
        }
        String action = request.getParameter("action");
        String page = null;
        int p = 0;
        if(request.getParameter("page")!=null){
            page = request.getParameter("page");
            p = Integer.parseInt(page);
        }
        String single = "";
        if(request.getParameter("single")!=null){
            single = request.getParameter("single");
        }
        countAllProduct(_name,price,cate);
        if(page==null&&action!=null&&action.equals("load")){
            session = request.getSession();
            session.setAttribute("pageNumber", 1);
            list = new ProductDao().getListByName(_name, price, cate,0, perPagesArticles);
            session.setAttribute("list", list);
            session.setAttribute("startIndex", 0);
            session.setAttribute("btnNext", "Next");
            session.setAttribute("btnPrevious", "Previous Disabled");
            if (list!=null&&list.size() < perPagesArticles|| list.size() == 0) {
                session.setAttribute("btnNext", "Next Disabled");
            }
        }

        else if(page!=null&&action!=null&&action.equals(page)){
            if(p==1){
                session.setAttribute("pageNumber", 1);
                list = new ProductDao().getListByName(_name, price, cate, 0, perPagesArticles);
                session.setAttribute("list", list);
                session.setAttribute("startIndex", 0);
                session.setAttribute("btnNext", "Next");
                session.setAttribute("btnPrevious", "Previous Disabled");
                if (list!=null&&list.size() < perPagesArticles|| list.size() == 0) {
                    session.setAttribute("btnNext", "Next Disabled");
                }
            }
            else if(p>1){
                session.setAttribute("btnPrevious", "Previous");
                session.setAttribute("btnNext", "Next");
                session.setAttribute("pageNumber", p);
                list = new ProductDao().getListByName(_name, price, cate, (p-1)*perPagesArticles,perPagesArticles);
                session.setAttribute("list", list);
                session.setAttribute("startIndex",(p-1)*9);
                int size1 = new ProductDao().getListByName(_name, price, cate,(Integer)session.getAttribute("startIndex")+ perPagesArticles,perPagesArticles).size();

                // logic to disable Next button.
                if (list!=null&&list.size() < perPagesArticles || size1 == 0) {
                    session.setAttribute("btnNext", "Next Disabled");
                    session.setAttribute("btnPrevious", "Previous");
                }
            }
        }

        //gio hang
        else if(action!=null&&action.equals(name)){
            Product product = new Product();
            product.setSKU(sku);
            Product a = new Product();
            a.getProduct(product);
            List<Cart> cart = addToCart(product);
            session = request.getSession();
            session.setAttribute("cart",cart);
            session.setAttribute("cartsize",cart.size());
        }

        else if (action!=null&&action.equals("next")) {
            session.setAttribute("btnPrevious", "Previous");
            session.setAttribute("startIndex",(Integer) session.getAttribute("startIndex") + perPagesArticles);
            list = new ProductDao().getListByName(_name, price, cate,(Integer) session.getAttribute("startIndex"),perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("list", list);
            int size1 = new ProductDao().getListByName(_name, price, cate, (Integer) session.getAttribute("startIndex") + perPagesArticles, perPagesArticles).size();
            // logic to disable Next button.
            if (list!=null&&list.size() < perPagesArticles || size1 == 0) {
                session.setAttribute("btnNext", "Next Disabled");
                session.setAttribute("btnPrevious", "Previous");
            }

        }
        // previous- is for previous page to display
        else if (action!=null&&action.equals("previous")) {
            countAllProduct(_name, price, cate);
            session.setAttribute("btnNext", "Next");
            session.setAttribute("startIndex", (Integer) session.getAttribute("startIndex") - perPagesArticles);
            list = new ProductDao().getListByName(_name, price, cate, (Integer) session.getAttribute("startIndex"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("list", list);
            // logic to disable Previous button.
            if ((Integer) session.getAttribute("startIndex") <= 0) {
                session.setAttribute("btnPrevious", "Previous Disabled");
                session.setAttribute("btnNext", "Next");
                session.setAttribute("startIndex", 0);
            }
            else {
                session.setAttribute("btnNext", "Next");
            }

        }
        if(specialspage.equals("1")){
            response.sendRedirect("specials.jsp");
        }
        else if(specialspage.equals("2")){
            session.setAttribute("specialspage","2");
            response.sendRedirect("specials.jsp");
        }
        else if(specialspage.equals("3")) {
            session.setAttribute("specialspage","3");
            response.sendRedirect("specials.jsp");
        }
        else if(specialspage.equals("4")){
            response.sendRedirect("specials.jsp");
        }
        else if(specialspage.equals("5")) {
            session.setAttribute("specialspage","5");
            response.sendRedirect("specials.jsp");
        }
        else if(adminpage.equals("1")){
            response.sendRedirect("admin.jsp");
        }else {
            response.sendRedirect("index.jsp");
        }
    }

    public List<Cart> addToCart(Product p) {
        int count = 0;
        List<Cart> cart = new ArrayList<Cart>();
        if(session.getAttribute("cart")!=null) {
             cart = (List<Cart>) session.getAttribute("cart");
            for (Cart item : cart) {
                if (item.getP().getSKU() == p.getSKU()) {
                    item.setQuantity(item.getQuantity() + 1);
                    count++;
                }
            }
        }
        if(count==0){
            Cart c = new Cart();
            c.setP(p);
            c.setQuantity(1);
            cart.add(c);
        }
        session.setAttribute("msgcart", p.getName()+ " has been added !");
        return cart;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        int sku = 0;
        String name ="";
        if(request.getParameter("sku")!=null){
            name = request.getParameter("sku");
            sku = Integer.parseInt(name);
        }
        if(!name.equals("") || !name.equals(null)){
            Product product = new Product();
            product.setSKU(sku);
            Product a = new Product();
            a.getProduct(product);
            List<Cart> cart = addToCart(product);
            session = request.getSession();
            session.setAttribute("cart",cart);
            session.setAttribute("cartsize",cart.size());
            response.sendRedirect("single.jsp?sku="+name);
        }
    }
}
