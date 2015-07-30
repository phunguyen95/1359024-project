<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/4/2015
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String pass = "";
  if(request.getParameter("ver")!=null)
    pass = request.getParameter("ver");
  String pass1 = "";
  if(request.getParameter("ver2")!=null)
    pass1 = request.getParameter("ver2");
  if(pass.equals(pass1)){
    %>
<input style="margin-left: 50px;margin-right:10px;" type="submit" value="Save">
<%
  }
  else{
    %>
<input disabled style="margin-left: 50px;margin-right:10px;" type="submit" value="Save">
<%
  }
%>
</body>
</html>
