<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 5/25/2015
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  if((null!=session.getAttribute("username") || ""!=session.getAttribute("username"))&&(null!=session.getAttribute("password") || ""!=session.getAttribute("password"))){
    session.invalidate();
    response.sendRedirect("index.jsp");
  }
%>
</body>
</html>
