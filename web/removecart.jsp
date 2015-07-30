<%@ page import="com.mypackage.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/13/2015
  Time: 11:16 PM
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

  String name = String.valueOf(request.getParameter("ver"));
  ArrayList<Cart> cart =  (ArrayList<Cart>) session.getAttribute("cart");
  ArrayList<Cart> cart1 = new Cart().reverse(cart);

    for (Cart c : cart1) {
      String check = "remove" + (c.getP().getSKU());
      if (name.equals(check)) {
        if(cart.size()<=1){
          session.removeAttribute("cart");
        }
        else {
          cart.remove(c);
          session.setAttribute("cart",cart);
        }
      }
    }

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

<p class="cd-go-to-cart"><a href="viewcart.jsp">Go to cart page</a></p>
</body>
</html>
