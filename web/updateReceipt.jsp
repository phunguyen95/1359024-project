<%@ page import="com.mypackage.receipt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.receiptDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/2/2015
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  List<receipt> list = (List<receipt>) session.getAttribute("listpageadmin");

  for(receipt re : list){
    int a = 0;
    if(request.getParameter("namestatus"+re.getreceiptID())!=null){
      a = Integer.parseInt(request.getParameter("namestatus"+re.getreceiptID()));
    }
    String b = request.getParameter("status"+re.getreceiptID());
    int status = Integer.parseInt(b);
    if(a==re.getreceiptID()) {
      if (status == 1) {
        receipt r = new receipt();
        if(re.getdatestatus()==null) {
          java.util.Date utilDate = new java.util.Date();
          java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
          r.updatestatus(re.getreceiptID(), status, sqlDate);
        }
      } else {
        receipt r = new receipt();
        r.updatestatus(re.getreceiptID(), status, null);
      }
    }
  }

  session.removeAttribute("listpageadmin");
  List<receipt> list1 = new receiptDAO().getAllReceipt((Integer) session.getAttribute("startIndex1"),9);
  // Set list in session to display in page
  session.setAttribute("listpageadmin", list1);
  response.sendRedirect("admin.jsp");
%>
</body>
</html>
