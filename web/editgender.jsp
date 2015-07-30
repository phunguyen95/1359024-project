<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/4/2015
  Time: 12:16 PM
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
<form action="EditProfile" method="post">
  <c:choose>
  <c:when test="${gender eq 'Male'}">
  Gender: ${gender}<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="Female"/> Female<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="Other"/> Other<br/>
  </c:when>
  <c:when test="${gender eq 'Female'}">
    Gender: ${gender}<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="Male"/> Male<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="other"/> Other<br/>
  </c:when>
  <c:when test="${gender eq 'Other'}">
    Gender: ${gender}<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="Male"/> Male<br/>
    <input style="margin-left:66px" name="editgender" type="checkbox" value="Female"/> Female<br/>
  </c:when>
  </c:choose>
  <input style="margin-right: 10px" type="submit" value="Save"><input type="reset" value="cancel" onclick="location.href='aboutme.jsp'">
</form>
</body>
</html>
