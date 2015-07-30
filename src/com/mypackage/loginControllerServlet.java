package com.mypackage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Long on 5/25/2015.
 */
public class loginControllerServlet extends HttpServlet {
    private HttpSession session;
    public void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String a = null;
        if (request.getParameter("signin-username") != null) {
            a = request.getParameter("signin-username");
        }
        String b = null;
        if (request.getParameter("signin-password") != null) {
            b = request.getParameter("signin-password");
        }
        String c = null;
        if (request.getParameter("checkbox") != null) {
            c = request.getParameter("checkbox");
        }
        User k = new User();
        User u =  k.loginUser(a, b);
        if (u.getuserid() != 0) {
            session = request.getSession();
            session.setAttribute("userid",u.getuserid());
            session.setAttribute("username", u.getusername());
            session.setAttribute("password", u.getpassword());
            session.setAttribute("fname", u.getfname());
            session.setAttribute("lname", u.getlname());
            session.setAttribute("tel", u.gettel());
            session.setAttribute("role", u.getrole());
            session.setAttribute("gender", u.getgender());
            session.setAttribute("address", u.getaddress());
            session.setAttribute("birthday",u.getbirthday());
            session.setAttribute("email",u.getemail());
            session.setAttribute("alertlogin", 1);
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {

                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("check")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }

                if ((u.getrole() != 1) && (c == "" || c == null)) {
                    session = request.getSession();
                    if (session.getAttribute("logincart") != null) {
                        session.removeAttribute("logincart");
                        response.sendRedirect("viewcart.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else if (u.getrole() != 1 && !c.equals(null)) {
                    session = request.getSession();
                    session.setAttribute("autologin", "1");
                    Cookie username = new Cookie("username", a);
                    Cookie password = new Cookie("password", b);
                    username.setMaxAge(60 * 60 * 24 * 365);
                    password.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(username);
                    response.addCookie(password);
                    if (session.getAttribute("logincart") != null) {
                        session.removeAttribute("logincart");
                        response.sendRedirect("viewcart.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else if(u.getrole() == 1) {
                    session.removeAttribute("alertlogin");
                    response.sendRedirect("admin.jsp");
                }
            }
        } else {
            session = request.getSession();
            Cookie[] cookies1 = request.getCookies();
            if (cookies1 != null) {
                int dem = 0;

                for (Cookie cookie : cookies1) {
                    if (cookie.getName().equals("check")) {
                        int t = Integer.parseInt(cookie.getValue());
                        t++;
                        String temp = String.valueOf(t);
                        cookie.setValue(temp);
                        dem++;
                        if (cookie.getValue().equals("2"))
                            session.setAttribute("alert","You have 1 times to login left");
                        else if (cookie.getValue().equals("3") || Integer.parseInt(cookie.getValue())>3) {
                            session.setAttribute("loginattemp", 3);
                            session.setAttribute("alert", "You have been banned for 20 minutes");
                        }
                        response.addCookie(cookie);
                    }
                }

                if (dem != 1) {
                    Cookie check = new Cookie("check", "1");
                    session.setAttribute("alert", "You have 2 times to login left");
                    check.setMaxAge(300);
                    response.addCookie(check);
                }
            }
            response.sendRedirect("index.jsp");
        }
    }


        public void doGet (javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse
        response)
        throws javax.servlet.ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            String a = null;
            if(request.getParameter("username")!=null){
                a=request.getParameter("username");
            }
            String b = null;
            if(request.getParameter("password")!=null){
                b=request.getParameter("password");
            }
            User k = new User();
            User u = new User();
            if(a!=null && b!=null) {
                u = k.loginUser(a, b);
                session = request.getSession();
                session.setAttribute("username",a);
                session.setAttribute("password",b);
                response.sendRedirect("index.jsp");
            }

            String option = request.getParameter("option");
            if (option != null || option != "") {
                Cookie[] cookies = request.getCookies();
                for (Cookie c : cookies) {
                    if (c.getName().equals("username")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                    if (c.getName().equals("password")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
                response.sendRedirect("login.jsp");
            }
        }
        }
