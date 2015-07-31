<%@ page import="com.mypackage.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/3/2015
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String masp = request.getParameter("masp");
  int sku = 0;
  if(masp!=null){
    sku = Integer.parseInt(masp);
  }
  Product a = new Product();
  a.setSKU(sku);
  Product p = new Product().getProduct(a);
%>
<div>
<div style="float: left">
<form id="form1" name="form1" action="Update1" method="post" enctype="multipart/form-data">
  <input type="hidden" name="txtid" value="<%=p.getSKU()%>">
Name: <input type="text" name="txtname" value="<%=p.getName()%>"/><br/>
  Price: <input type="text" name="txtprice" value="<%=p.getprice()%>"/><br/>
  Quantity: <input type="text" name="txtquantity" value="<%=p.getquantity()%>"/><br/>
  Description: <textarea name="txtdescription"><%=p.getdescription()%></textarea><br/>
  Image: <input type="file" name="dataFile" ><br/>
  <input type="submit" value="Update"> <input type="button"  value="Remove" onclick="document.form1.action='deleteProduct'; document.form1.submit()">
</form>
</div>
<div style="float: left">
  <img width="500px" height="333px" src="images/<%=p.getimage()%>" />
</div>
</div>
</body>
</html>
