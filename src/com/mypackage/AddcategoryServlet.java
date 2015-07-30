package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Long on 6/19/2015.
 */
@WebServlet(name = "AddcategoryServlet")
public class AddcategoryServlet extends HttpServlet {
    private HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        session.removeAttribute("list");
        String name = request.getParameter("txtname");
        Category c = new Category();
        c.setName(name);
        Category c1 = new Category();
        if(c1.Insert(c)){
            session.setAttribute("msgadd","Successfully added");
            response.sendRedirect("admin.jsp");
        }
        else{
            session.setAttribute("msgadd","Failed. Try to add again");
            response.sendRedirect("addcategory.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
