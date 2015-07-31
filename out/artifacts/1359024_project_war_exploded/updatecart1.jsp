<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mypackage.Cart" %>
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/1/2015
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>

<%
  session = request.getSession();
  String name = String.valueOf(request.getParameter("ver"));
  String name2 = "";
  int quantity = 0;
  List<Cart> cart =  (List<Cart>) session.getAttribute("cart");

  for(Cart c : cart){

    String check = "txtQuantity"+(c.getP().getSKU());
    if(name.equals(check)) {
      if(request.getParameter("ver2")!=null || request.getParameter("ver2")!=""){
        name2 = request.getParameter("ver2");
        quantity = Integer.parseInt(name2);
      }
      c.setQuantity(quantity);
      quantity = c.getQuantity();
    }
  }

  session.setAttribute("cart",cart);
%>
<h2>Cart</h2>
<ul id="cartchange" class="cd-cart-items">
  <c:choose>
    <c:when test="${not empty cart}">
      <c:set var="total" value="0" />
      <c:forEach var="product" items="${cart}">
        <c:set var="balance" value="${product.getP().price*product.quantity}" />
        <c:set var="total" value="${total + balance}" />
        <li>
          <input size="1px" id="txtQuantity${product.getP().SKU}"  type="text" value="${product.quantity}" onblur="sendInfo${product.getP().SKU}()" /> x ${product.getP().name}
          <img width="150px" height="100px" src="images/${product.getP().getimage()}">
          <div class="cd-price"><fmt:formatNumber value="${balance}" type="currency"/></div>
          <a href="#" id="remove${product.getP().SKU}" class="cd-item-remove cd-img-replace" onclick="remove${product.getP().SKU}()">Remove</a>
        </li>
      </c:forEach>
    </c:when>
  </c:choose>
</ul> <!-- cd-cart-items -->

<div class="cd-cart-total">
  <p>Total <span><fmt:formatNumber value="${total}" type="currency"/></span></p>
</div> <!-- cd-cart-total -->

<a href="CheckoutServlet?totalPrice=${total}" class="checkout-btn">Checkout</a>

</body>
</html>
