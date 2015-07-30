<%@ page import="com.mypackage.receipt" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/14/2015
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String name = request.getParameter("ver");
  String value = request.getParameter("ver2");
  List<receipt> list = (List<receipt>) session.getAttribute("listpageadmin");

  for(receipt re: list){
    String check = String.valueOf(re.getreceiptID());
    if(name.equals(check)){
      if(Integer.parseInt(value)==0){
        receipt re1 = new receipt();
        re.setstatus(0);
        re1.updatestatus(re.getreceiptID(),0,null);
      }
      else if(Integer.parseInt(value)==1){
        receipt re1 = new receipt();
        re.setstatus(1);
        java.util.Date  utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        re1.updatestatus(re.getreceiptID(),1,sqlDate);
      }
      break;
    }
  }

  session.setAttribute("listpageadmin",list);
  response.sendRedirect("admin.jsp");
%>

</html>
