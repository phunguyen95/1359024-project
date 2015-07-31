<%@ page import="com.mypackage.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/13/2015
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String username= "";
  String email="";
  String pass = "";
  String pass1 = "";
  int a = 0;
  int b = 0;
  int c;
  c = 0;
  if(request.getParameter("ver")!=null){
    username = request.getParameter("ver");
  }
  if(request.getParameter("ver2")!=null){
    email = request.getParameter("ver2");
  }
  if(request.getParameter("ver3")!=null){
    pass = request.getParameter("ver3");
  }
  if(request.getParameter("ver4")!=null){
    pass1 = request.getParameter("ver4");
  }
  User u = new User();
  if(u.checkusername(username)){
    a=1;
  }
  if(u.checkemail(email)){
    b=1;
  }
  if(!pass.equals(pass1)){
    c=1;
  }
  if(a!=0 || b!=0 || c!=0) {
    out.println("<input class='full-width has-padding' type='submit' value='Create account' disabled />");
  }
  else
      out.println("<input class='full-width has-padding' type='submit' value='Create account' />");
%>
</body>
</html>
