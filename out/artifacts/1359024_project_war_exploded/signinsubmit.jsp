<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/19/2015
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String name=null;
  name = request.getParameter("ver");
  String database = "myproduct";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String sql =  "select * from user where username= ?";
  Connection conn;
  try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(connectionURL, "root", "");
    PreparedStatement psmt = conn.prepareStatement(sql);
    psmt.setString(1,name);
    ResultSet rs = psmt.executeQuery();
    if(rs.next()){
      out.println("<input  class=\"full-width\"  type=\"submit\" value=\"Login\">");
    }
    else{
      out.println("<input disabled  class=\"full-width\"  type=\"submit\" value=\"Login\">");
    }
    psmt.close();
    if(conn!=null){
      conn.close();
      conn=null;
    }
  }catch(SQLException sqle){
    sqle.printStackTrace();
  }
  catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
%>
</body>
</html>
