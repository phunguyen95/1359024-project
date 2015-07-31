<%@ page import="com.mypackage.Product" %>
<%@ page import="com.mypackage.ProductDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/3/2015
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <%
    String id=request.getParameter("id");
    int id1 = 0;
    if(id!=null){
      id1 = Integer.parseInt(id);
    }
    List<Product> list = new ProductDao().GetByCate(id1);

  %>
</head>
<body>
<select id="masp">
  <option value="0">Product</option>
<%
  for(Product p : list){
%>
  <option value="<%=p.getSKU()%>"><%=p.getName()%></option>
<%
  }
%>
</select>
</body>
</html>
