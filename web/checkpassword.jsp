<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/4/2015
  Time: 11:42 AM
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
    out.print("<img width='20px' height='20px' src='img/rightstick.png' alt='right' title='right'>");
  }
  else{
    out.print("<img width='20px' height='20px' src='img/wrongstick.png' alt='wrong' title='wrong'>");
  }
%>
</body>
</html>
