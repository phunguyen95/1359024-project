<%@ page import="com.mypackage.receipt" %>
<%@ page import="com.mypackage.receiptDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Long
  Date: 6/15/2015
  Time: 9:39 AM
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
  String page1 = request.getParameter("page");
  int p = Integer.parseInt(page1);
  int perPagesArticles = 9;

  if(p==1){
    session.setAttribute("pageNumber1", 1);
    List<receipt> list = new receiptDAO().getAllReceipt(0, perPagesArticles);
    session.setAttribute("listpageadmin", list);
    session.setAttribute("startIndex1", 0);
    session.setAttribute("btnNext1", "Next");
    session.setAttribute("btnPrevious1", "Previous Disabled");
    if (list!=null&&list.size() < perPagesArticles|| list.size() == 0) {
      session.setAttribute("btnNext1", "Next Disabled");
    }
  }
  else if(p>1){
    session.setAttribute("btnPrevious1", "Previous");
    session.setAttribute("btnNext1", "Next");
    session.setAttribute("pageNumber1", p);
    List<receipt> list = new receiptDAO().getAllReceipt((p - 1) * perPagesArticles, perPagesArticles);
    session.setAttribute("listpageadmin", list);
    session.setAttribute("startIndex1",(p-1)*9);
    int size1 =new receiptDAO().getAllReceipt((Integer)session.getAttribute("startIndex1")+ perPagesArticles,perPagesArticles).size();

    // logic to disable Next button.
    if (list!=null&&list.size() < perPagesArticles || size1 == 0) {
      session.setAttribute("btnNext1", "Next Disabled");
      session.setAttribute("btnPrevious1", "Previous");
    }
  }
%>
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
          <td><select id="${receipt.receiptID}" >
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
        <c:choose>
          <c:when test="${btnPrevious1!='' && btnPrevious1!='Previous Disabled'}">
            <input type="button" class="button1" value="${btnPrevious1}" onclick="buttonprevious()">
          </c:when>
          <c:otherwise>
            <input type="submit" class="button1" disabled value="Previous">
          </c:otherwise>
        </c:choose>
      </div>

      <div class="navbar">
        <c:forEach begin="1" end="${allpages1}" var="i">
          <c:choose>
            <c:when test="${pageNumber1 eq i}">
              <div class="navbar">${i}</div>
            </c:when>
            <c:otherwise>
              <div class="navbar">
                <input type="button" id="pagebutton" class="submitLink" value="${i}" onclick="pagebutton()">
              </div>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </div>

      <div class="navbar">
        <c:choose>
          <c:when test="${btnNext1!=''&& btnNext1!='Next Disabled'}">
            <input type="button" class="button1" value="${btnNext1}" onclick="buttonnext()">
          </c:when>
          <c:otherwise>
            <input type="submit" disabled class="button1" value="next">
          </c:otherwise>
        </c:choose>
      </div>
    </div></h4>
  </div>
</c:if>
</body>
</html>
