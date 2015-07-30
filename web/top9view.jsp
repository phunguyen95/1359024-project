<%@ page import="com.mypackage.Product" %>
<%@ page import="com.mypackage.ProductDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/14/2015
  Time: 1:33 PM
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
  session.removeAttribute("list");
  session.removeAttribute("listpageadmin");
  ProductDao pro = new ProductDao();
  List<Product> list = pro.GetMostView();
  session.setAttribute("listtopview",list);
%>
<span style="color: rgb(236, 38, 33);"><b>Top 9 Most View</b></span> <hr />
<c:choose>
  <c:when test="${not empty listtopview}">
    <% int countcontent = 1; %>
    <c:forEach var="product" items="${listtopview}">
      <c:set var="balance" value="${product.price}" />
      <%
        if(countcontent==1){
      %> <div class="grid-bottom"> <%
      }
      if(countcontent % 3!=0){
        countcontent++;
    %>
      <div class="col_1_of_b span_1_of_bottom">
        <div class="grids ">
          <a href="single.jsp?sku=${product.SKU}">
            <span style="right:0;position:absolute"><img src="img/views-icon.png">${product.getviews()}</span>
            <img width="192px" height="128px" src="images/${product.image}" alt=""/>
          </a>
          <div class="price">
            <a href="single.jsp?sku=${product.SKU}">
              <div class="bot1">
                <p class="title" style="height: 38px;">${product.name}</p>
                <div class="price1" style="margin-top: 25px;height: 19px;">
                        <span class="actual"><fmt:formatNumber value="${balance}"
                                                               type="currency"/></span>
                </div>
              </div></a>
            <div  class="cart1">
              <img  src="images/cart.png" alt=""/>
              <form action="SearchServlet" method="post">
                <input type="hidden" name="action" value="${product.SKU}"/>
                <input type="hidden" name="sku" value="${product.SKU}"/>
                <input type="hidden" name="specialspage" value="3"/>
                <input type="submit" class="submitLink1" value="" style="width: 65px; height: 68px; top:143px; right:0" />
              </form>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>
      <% }
      else {
        countcontent=1;
      %>
      <div class="col_1_of_b span_1_of_bottom1">
        <div class="grids ">
          <a href="single.jsp?sku=${product.SKU}">
            <span style="right:0;position:absolute"><img src="img/views-icon.png">${product.getviews()}</span>
            <img width="192px" height="128px" src="images/${product.image}" alt=""/>
          </a>
          <div class="price">
            <a href="single.jsp?sku=${product.SKU}">
              <div class="bot1">
                <p class="title" style="height: 38px;">${product.name}</p>
                <div class="price1" style="margin-top: 25px;height: 19px;">
                  <span class="actual"><fmt:formatNumber value="${balance}" type="currency"/></span>
                </div>
              </div></a>
            <div class="cart1">
              <img  src="images/cart.png" alt=""/>
              <form action="SearchServlet" method="post">
                <input type="hidden" name="action" value="${product.SKU}"/>
                <input type="hidden" name="sku" value="${product.SKU}"/>
                <input type="hidden" name="specialspage" value="3"/>
                <input type="submit" class="submitLink1" value="" style="width: 65px; height: 68px; top:143px; right:0" />
              </form>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>

      <div class="clear"></div>
    </div>
      <% }
      %>
    </c:forEach>
  </c:when>
  <c:otherwise>No record</c:otherwise>
</c:choose>
</body>
</html>
