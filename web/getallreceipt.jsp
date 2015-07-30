<%@ page import="com.mypackage.receipt" %>
<%@ page import="com.mypackage.receiptDAO" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/14/2015
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/stylelogin.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/stylecart.css" rel="stylesheet" type="text/css" media="all" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script src="js/modernizr.js" type="text/javascript"></script>
  <script src="js/modernizr1.js" type="text/javascript"></script>
  <script src="js/modernizr2.js" type="text/javascript"></script>
  <script type="text/javascript" src="jquery.js"></script>
  <script src="jquery.elevatezoom.js" type="text/javascript"></script>
  <script src="jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
  <script src="jquery-1.8.3.min.js" type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="js/main.js"></script> <!-- Gem jQuery -->
  <script src="js/main1.js"></script>
  <%
    session.removeAttribute("list");
    if(session.getAttribute("listpageadmin")==null){
      List<receipt> list = new receiptDAO().getAllReceipt(0, 9);
      session.setAttribute("listpageadmin",list);
      receiptDAO p2 = new receiptDAO();
      int j2 = p2.countallreceipt();
      session.setAttribute("pageNumber1", 1);
      session.setAttribute("allpages1",j2);
      session.setAttribute("startIndex1", 0);
      session.setAttribute("btnNext1", "Next");
      session.setAttribute("btnPrevious1", "Previous Disabled");
      if (list!=null&&list.size() < 9|| list.size() == 0) {
        session.setAttribute("btnNext1", "Next Disabled");
      }
    }
  %>
</head>
<body>
<span style="color: rgb(236, 38, 33);"><b>Receipts</b></span> <hr />
<c:choose>
  <c:when test="${not empty listpageadmin}">
    <table cellpadding="5" cellspacing="5">
      <tr>
        <td width="50px">ID</td>
        <td align="center" width="100px">Username</td>
        <td align="center" width="170px">TotalPrice</td>
        <td align="center" width="170px">Date</td>
        <td>Status</td>
        <td>PayonDate</td>
      </tr>
    <c:forEach var="receipt" items="${listpageadmin}">
      <c:set var="balance" value="${receipt.gettotal()}" />
      <tr>
        <td>${receipt.getreceiptID()}</td>
        <td align="center">${receipt.getclient()}</td>
        <td align="right"><fmt:formatNumber value="${balance}" type="currency"/></td>
        <td align="center">${receipt.getdate()}</td>
        <td><select id="${receipt.receiptID}">
          <c:choose>
          <c:when test="${receipt.getstatus()==0 || receipt.getstatus()==null}" >
            <option value="0">Unpaid</option>
            <option value="1">Paid</option>
          </c:when>
          <c:otherwise>
            <option value="1">Paid</option>
            <option value="0">Unpaid</option>
          </c:otherwise>
        </c:choose>
        </select>
          </td>
        <td>
          <c:if test="${receipt.getstatus()==1 || receipt.getstatus()!=0}">
            ${receipt.getdatestatus()}
          </c:if>
        </td>
      </tr>
      </c:forEach>
    </table>
    </c:when>
  <c:otherwise>No record</c:otherwise>
  </c:choose>

<c:if test="${not empty listpageadmin}">
  <div style="width: 100%" class="cont span_2_of_3"><h4  style="height: 35px">
    <div id="menu1" style="float:right; vertical-align: middle">
      <div class="navbar">
        <form action="SearchReceiptServlet" method="post">
          <input type="hidden" name="action" value="previous">
          <input type="hidden" name="adminpage" value="1">
          <c:choose>
            <c:when test="${btnPrevious1!='' && btnPrevious1!='Previous Disabled'}">
              <input type="submit" class="button1" value="${btnPrevious1}">
            </c:when>
            <c:otherwise>
              <input type="submit" class="button1" disabled value="Previous">
            </c:otherwise>
          </c:choose>
        </form>
      </div>

      <div class="navbar">
        <c:forEach begin="1" end="${allpages1}" var="i">
          <c:choose>
            <c:when test="${pageNumber1 eq i}">
              <div class="navbar">${i}</div>
            </c:when>
            <c:otherwise>
              <div class="navbar">
                <form action="SearchReceiptServlet" method="post">
                  <input type="hidden" name="action" value="${i}">
                  <input type="hidden" name="page" value="${i}">
                  <input type="submit" class="submitLink" value="${i}">
                </form>
              </div>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </div>

      <div class="navbar">
        <form action="SearchReceiptServlet" method="post">
          <input type="hidden" name="adminpage" value="1">
          <input type="hidden" name="action" value="next">
          <c:choose>
            <c:when test="${btnNext1!=''&& btnNext1!='Next Disabled'}">
              <input type="submit" class="button1" value="${btnNext1}">
            </c:when>
            <c:otherwise>
              <input type="submit" disabled class="button1" value="next">
            </c:otherwise>
          </c:choose>
        </form>
      </div>
    </div></h4>
  </div>
</c:if>
</body>
</html>
