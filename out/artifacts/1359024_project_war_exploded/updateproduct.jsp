<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery2.js"></script>

    <link href="css/jquery_notification.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="js/jquery_v_1.4.js"></script>
    <script type="text/javascript" src="js/jquery_notification_v.1.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/main1.js"></script>

    <c:if test="${not empty msgupdate}">
        <script type="text/javascript">
            $(window).bind("load", function() {
                showNotification({
                    message: "${msgupdate}",
                    autoClose: true,
                    duration: 3
                });
            });
        </script>
        <% session.removeAttribute("msgupdate");
        %>
    </c:if>
    <script>
        $(document).ready(function(){
            $("#idsp").change(function(){
                var idsp=$("#idsp").val();
                $.post("updateproduct1.jsp?id="+idsp,
                        {
                            id:idsp
                        },
                        function(data,status){
                            if(status=="success")
                            {
                                $("#iddiv").html(data);
                                $("#masp").change(function(){
                                    var masp=$("#masp").val();
                                    $.post("updateproduct2.jsp?masp="+masp,
                                            {
                                                masp:masp
                                            },
                                            function(data,status){
                                                if(status=="success")
                                                {
                                                    $("#iddiv1").html(data);
                                                }

                                            })
                                });
                            }
                        });
            });
        });
    </script>
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
            <%
                session = request.getSession();
                if(session.getAttribute("username")==null || !session.getAttribute("role").equals(1)){
                    response.sendRedirect("index.jsp");
                }
            %>
            <ul class="nav navbar-right top-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${username} <b class="caret"></b></a>
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
                    <li>
                        <a href="admin.jsp"><i class="fa fa-fw fa-dashboard"></i> List receipt</a>
                    </li>
                    <li>
                        <a href="addproduct.jsp"><i class="fa fa-fw fa-file"></i> Add product</a>
                    </li>
                    <li class="active">
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
                            Update product
                        </h1><div>
                        <select id="idsp" name="idsp">
                            <option value="0">Category</option>
                            <c:if test="${not empty listcate}">
                                <c:forEach var="category" items="${listcate}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </c:if>
                        </select></div>
                        <p id="iddiv"></p>
                        <p id="iddiv1"></p>
                    </div>
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
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</body>

</html>
