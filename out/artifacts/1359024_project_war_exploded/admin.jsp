<%@ page import="com.mypackage.receipt" %>
<%@ page import="com.mypackage.receiptDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery2.js"></script>

    <link href="css/jquery_notification.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="js/jquery_v_1.4.js"></script>
    <script type="text/javascript" src="js/jquery_notification_v.1.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/main1.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .button1 {
            background-color: transparent;
            border: none;
            color: rgb(40, 249, 209);
            cursor: pointer;
        }

        .button1:hover {
            border-top-color: #28597a;
            background: #28597a;
            color: #ccc;
        }

        .button1:active {
            border-top-color: #1b435e;
            background: #1b435e;
        }

        .menu1{
            text-align: right;
        }
        .navbar {
            margin-left:5px;
            float:left;
        }

        .submitLink {
            background-color: transparent;
            border: none;
            color: rgb(40, 249, 209);
            cursor: pointer;
        }
        .submitLink1 {
            position: absolute;
            background-color: transparent;
            border: none;
            cursor: pointer;
        }
    </style>

    <c:if test="${not empty msgadd}">
        <script type="text/javascript">
            $(window).bind("load", function() {
                showNotification({
                    message: "${msgadd}",
                    autoClose: true,
                    duration: 3
                });
            });
        </script>
        <% session.removeAttribute("msgadd");
        %>
    </c:if>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="admin.jsp">Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                 <%
                    session = request.getSession();
                    if(session.getAttribute("username")==null || !session.getAttribute("role").equals(1)){
                        response.sendRedirect("index.jsp");
                    }
                %>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("username")%> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                         <li>
                            <a href="logout.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="admin.jsp"><i class="fa fa-fw fa-dashboard"></i> List receipt</a>
                    </li>
                    <li>
                        <a href="addcategory.jsp"><i class="fa fa-fw fa-file"></i> Add category</a>
                    </li>
                    <li>
                        <a href="addproduct.jsp"><i class="fa fa-fw fa-file"></i> Add product</a>
                    </li>
                    <li>
                        <a href="updateproduct.jsp"><i class="fa fa-fw fa-file"></i> Update product</a>
                    </li>
                    <li>
                        <a href="index.jsp"><i class="fa fa-fw fa-file"></i>Index</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            List receipts
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div id="adminbutton" class="col-lg-12">
                        <%
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
                            else{
                            session.setAttribute("listpageadmin",session.getAttribute("listpageadmin"));
                        }
                        %>
                        <c:choose>
                            <c:when test="${not empty listpageadmin}">
                        <form  action="updateReceipt.jsp" method="post">
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
                                        <input type="hidden" name="namestatus${receipt.receiptID}" value="${receipt.receiptID}" />
                                        <tr>
                                            <td><a href="#" id="${receipt.getreceiptID()}" onclick="receiptdetail${receipt.getreceiptID()}()">${receipt.getreceiptID()}</a></td>
                                            <td align="center">${receipt.getclient()}</td>
                                            <td align="right"><fmt:formatNumber value="${balance}" type="currency"/></td>
                                            <td align="center">${receipt.getdate()}</td>
                                            <td><select name="status${receipt.receiptID}">
                                                <c:choose>
                                                    <c:when test="${receipt.getstatus()==0 || receipt.getstatus()==null}" >
                                                        <option value="0">not yet delivered</option>
                                                        <option value="1">Done</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1">Done</option>
                                                        <option value="0">not yet delivered</option>
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
                                        <script>
                                            function receiptdetail${receipt.getreceiptID()}(){
                                                var xmlhttp;
                                                var k = document.getElementById("${receipt.getreceiptID()}").id;
                                                var urls="receiptdetail.jsp?ver="+k;
                                                if (window.XMLHttpRequest)
                                                {
                                                    xmlhttp=new XMLHttpRequest();
                                                }
                                                else
                                                {
                                                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                                                }
                                                xmlhttp.onreadystatechange=function()
                                                {
                                                    if (xmlhttp.readyState==4)
                                                    {
                                                        //document.getElementById("err").style.color="red";
                                                        document.getElementById("receiptdetail").innerHTML=xmlhttp.responseText;
                                                    }
                                                }
                                                xmlhttp.open("GET",urls,true);
                                                xmlhttp.send();
                                            }
                                        </script>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="5" align="right">
                                            <input type="submit" value="Update">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </c:when>
                            <c:otherwise>No record</c:otherwise>
                        </c:choose>

                        <c:if test="${not empty listpageadmin}">
                            <div style="width: 100%" class="cont span_2_of_3"><h4  style="height: 35px">
                                <div id="menu1" style="float:right; vertical-align: middle">
                                    <div class="navbar">
                                        <form action="SearchReceipt" method="post">
                                            <input type="hidden" name="action" value="previous">
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
                                                        <form action="SearchReceipt" method="post">
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
                                        <form action="SearchReceipt" method="post">
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
                        <div style="padding-bottom: 70px" id="receiptdetail"></div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">

                </div>


                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery1.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
