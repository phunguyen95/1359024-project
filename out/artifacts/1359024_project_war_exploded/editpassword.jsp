<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/4/2015
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="EditProfile" method="post">
  Password: <input type="password" id="editpassword" name="editpassword" placeholder="Your password"><br/>
  Confirm password: <input type="password" id="editpassword1" name="editpassword1" placeholder="Your password" onblur="editpass()"> <span id="divcheck"></span> <br/>
  <span id="divsubmitpass"><input style="margin-left: 50px;margin-right:10px;" type="submit" value="Save"></span> <input type="reset" value="cancel" onclick="location.href='aboutme.jsp'">
</form>
</body>
</html>
