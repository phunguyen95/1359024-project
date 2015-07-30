package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

/**
 * Created by Long on 6/4/2015.
 */
@WebServlet(name = "EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        String edit = "";
        User u = new User();
        int i = 0;
        int id = 0;
        if(session.getAttribute("userid")!=null){
            id = (Integer) session.getAttribute("userid");
        }
        if(request.getParameter("editname")!=null){
            edit = request.getParameter("editname");
            if(u.editname(id,edit)){
                i = 1;
                session.setAttribute("fname",edit);
            }
        }
        else if(request.getParameter("editemail")!=null){
            edit = request.getParameter("editemail");
            if(u.editemail(id, edit)){
                i = 1;
                session.setAttribute("email",edit);
            }
        }
        else if(request.getParameter("editpassword")!=null){
            edit = request.getParameter("editpassword");
            if(u.editpassword(id, edit)){
                i = 1;
                session.setAttribute("password",edit);
            }
        }
        else if(request.getParameter("editgender")!=null){
            edit = request.getParameter("editgender");
            if(u.editgender(id, edit)){
                i = 1;
                session.setAttribute("gender",edit);
            }
        }
        else if(request.getParameter("edittel")!=null){
            edit = request.getParameter("edittel");
            if(u.edittel(id, edit)){
                i = 1;
                session.setAttribute("tel",edit);
            }
        }
        else if(request.getParameter("editaddress")!=null){
            edit = request.getParameter("editaddress");
            if(u.editaddress(id, edit)){
                i = 1;
                session.setAttribute("address",edit);
            }
        }
        else if(request.getParameter("editbirthday")!=null){
            edit = request.getParameter("editbirthday");
            java.sql.Date bday = Date.valueOf(edit);
            if(u.editbirthday(id,bday)){
                i = 1;
                session.setAttribute("birthday",bday);
            }
        }

        if(i==1){
            session.setAttribute("msgedit","Successfully updated");
        }
        else{
            session.setAttribute("msgedit","Some error happen. Please try again");
        }
        response.sendRedirect("aboutme.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
