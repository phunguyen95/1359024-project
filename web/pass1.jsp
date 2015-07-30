<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/19/2015
  Time: 11:20 PM
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
  String pass2 = "";
  if(request.getParameter("ver")!=null){
    pass = request.getParameter("ver");
  }
  if(request.getParameter("ver2")!=null){
    pass2 = request.getParameter("ver2");
  }
  if(!pass.equals(pass2)){
    out.print("confirm password is invalid");
  }
%>
</body>
</html>
