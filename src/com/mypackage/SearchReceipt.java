package com.mypackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Long on 6/15/2015.
 */
@WebServlet(name = "SearchReceipt")
public class SearchReceipt extends HttpServlet {
    private List<receipt> list;
    private int perPagesArticles = 9;
    private HttpSession session;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        String action = request.getParameter("action");
        String page = "";
        int p = 0;
        if(request.getParameter("page")!=null){
            page = request.getParameter("page");
            p = Integer.parseInt(page);
        }

        if (action != null && action.equals(page)){
            if (p == 1) {
                session.setAttribute("pageNumber1", 1);
                List<receipt> list = new receiptDAO().getAllReceipt(0, perPagesArticles);
                session.setAttribute("listpageadmin", list);
                session.setAttribute("startIndex1", 0);
                session.setAttribute("btnNext1", "Next");
                session.setAttribute("btnPrevious1", "Previous Disabled");
                if (list != null && list.size() < perPagesArticles || list.size() == 0) {
                    session.setAttribute("btnNext1", "Next Disabled");
                }
            } else if (p > 1) {
                session.setAttribute("btnPrevious1", "Previous");
                session.setAttribute("btnNext1", "Next");
                session.setAttribute("pageNumber1", p);
                List<receipt> list = new receiptDAO().getAllReceipt((p - 1) * perPagesArticles, perPagesArticles);
                session.setAttribute("listpageadmin", list);
                session.setAttribute("startIndex1", (p - 1) * 9);
                int size1 = new receiptDAO().getAllReceipt((Integer) session.getAttribute("startIndex1") + perPagesArticles, perPagesArticles).size();

                // logic to disable Next button.
                if (list != null && list.size() < perPagesArticles || size1 == 0) {
                    session.setAttribute("btnNext1", "Next Disabled");
                    session.setAttribute("btnPrevious1", "Previous");
                }
            }
      }
        else if(action!=null && action.equals("next")){
            session.setAttribute("btnPrevious1", "Previous");
            session.setAttribute("startIndex1",(Integer) session.getAttribute("startIndex1") + perPagesArticles);
            List<receipt> list = new receiptDAO().getAllReceipt((Integer) session.getAttribute("startIndex1"), perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex1");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber1", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("listpageadmin", list);
            int size1 = new receiptDAO().getAllReceipt((Integer) session.getAttribute("startIndex1") + perPagesArticles, perPagesArticles).size();
            // logic to disable Next button.
            if (list!=null&&list.size() < perPagesArticles || size1 == 0) {
                session.setAttribute("btnNext1", "Next Disabled");
                session.setAttribute("btnPrevious1", "Previous");
            }
        }
        else if(action!=null && action.equals("previous")){
            session.setAttribute("btnNext1", "Next");
            session.setAttribute("startIndex1", (Integer) session.getAttribute("startIndex1") - perPagesArticles);
            List<receipt> list = new receiptDAO().getAllReceipt((Integer) session.getAttribute("startIndex1"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex1");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber1", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("listpageadmin", list);
            // logic to disable Previous button.
            if ((Integer) session.getAttribute("startIndex1") <= 0) {
                session.setAttribute("btnPrevious1", "Previous Disabled");
                session.setAttribute("btnNext1", "Next");
                session.setAttribute("startIndex1", 0);
            }
            else {
                session.setAttribute("btnNext1", "Next");
            }
        }
        response.sendRedirect("admin.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
