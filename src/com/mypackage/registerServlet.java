package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

/**
 * Created by Long on 6/9/2015.
 */
@WebServlet(name = "registerServlet")
public class registerServlet extends HttpServlet {
    private HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        PrintWriter out = response.getWriter();
        String username = request.getParameter("signup-username");
        String password =  request.getParameter("signup-password");
        String checkpassword = request.getParameter("signup-checkpassword");
        String email = request.getParameter("signup-email");
        String fname = request.getParameter("signup-fname");
        String lname = request.getParameter("signup-lname");
        String birthday = request.getParameter("signup-bday");
        String gender = request.getParameter("signup-gender");
        java.sql.Date bday = Date.valueOf(birthday);
        String tel = request.getParameter("signup-tel");
        String address = request.getParameter("signup-address");
        if(password.equals(checkpassword)){
            User u = new User();
            u.registerUser(username,password,fname,lname,bday,gender,tel,address,email);
            session.setAttribute("msgregister","Successfully registered");
        }
        else{
            session.setAttribute("msgregister","confirm password is invalid");
        }
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
