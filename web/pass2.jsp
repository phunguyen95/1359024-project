<%@ page import="java.sql.*" %>
<%@ page import="com.mypackage.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/13/2015
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String name="";
  name = request.getParameter("ver");
  String check = name;
  User u = new User();
  if(u.checkemail(name)){
    name = "Email already exists";
  }
  else {
    name = "It's available. You can use this.";
  }
  if(check==""){
    name = "";
  }
  out.println(name);
%>
</body>
</html>
