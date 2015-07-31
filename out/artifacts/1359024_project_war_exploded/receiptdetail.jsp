<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mypackage.receiptDAO" %>
<%@ page import="com.mypackage.receiptdetail" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/4/2015
  Time: 6:24 PM
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
  String id = request.getParameter("ver");
  List<receiptdetail> list = new receiptDAO().getreceiptdetail(id);
  session.setAttribute("listreceiptdetail",list);
%>
<hr/>
<h1 class="page-header"> Information of receipt : <%=id%> </h1>
<table width="500px" cellpadding="5" cellspacing="5">
  <tr>
    <td>RCDetailID</td>
    <td>SKU</td>
    <td>Price</td>
    <td>Quantity</td>
    <td>Total</td>
  </tr>
  <c:forEach items="${listreceiptdetail}" var="re">
    <c:set var="balance" value="${re.getprice()}" />
    <c:set var="balance1" value="${re.gettotal()}" />
<tr>
  <td>${re.getdetailid()}</td>
  <td>${re.getsku()}</td>
  <td><fmt:formatNumber value="${balance}" type="currency"/></td>
  <td>${re.getquantity()}</td>
  <td><fmt:formatNumber value="${balance1}" type="currency"/></td>
</tr>

  </c:forEach>
</table>

</body>
</html>
