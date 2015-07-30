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
        .smart-green {
            margin-left:auto;
            margin-right:auto;

            max-width: 500px;
            background: #F8F8F8;
            padding: 30px 30px 20px 30px;
            font: 12px Arial, Helvetica, sans-serif;
            color: #666;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
        }
        .smart-green h1 {
            font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
            padding: 20px 0px 20px 40px;
            display: block;
            margin: -30px -30px 10px -30px;
            color: #FFF;
            background: #9DC45F;
            text-shadow: 1px 1px 1px #949494;
            border-radius: 5px 5px 0px 0px;
            -webkit-border-radius: 5px 5px 0px 0px;
            -moz-border-radius: 5px 5px 0px 0px;
            border-bottom:1px solid #89AF4C;

        }
        .smart-green h1>span {
            display: block;
            font-size: 11px;
            color: #FFF;
        }

        .smart-green label {
            display: block;
            margin: 0px 0px 5px;
        }
        .smart-green label>span {
            float: left;
            margin-top: 10px;
            color: #5E5E5E;
        }
        .smart-green input[type="text"], .smart-green input[type="email"], .smart-green textarea, .smart-green select {
            color: #555;
            height: 30px;
            line-height:15px;
            width: 100%;
            padding: 0px 0px 0px 10px;
            margin-top: 2px;
            border: 1px solid #E5E5E5;
            background: #FBFBFB;
            outline: 0;
            -webkit-box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            font: normal 14px/14px Arial, Helvetica, sans-serif;
        }
        .smart-green textarea{
            height:100px;
            padding-top: 10px;
        }
        .smart-green select {
            background: url('down-arrow.png') no-repeat right, -moz-linear-gradient(top, #FBFBFB 0%, #E9E9E9 100%);
            background: url('down-arrow.png') no-repeat right, -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FBFBFB), color-stop(100%,#E9E9E9));
            appearance:none;
            -webkit-appearance:none;
            -moz-appearance: none;
            text-indent: 0.01px;
            text-overflow: '';
            width:100%;
            height:30px;
        }
        .smart-green .button {
            background-color: #9DC45F;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-border-radius: 5px;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            text-shadow: 1px 1px 1px #949494;
        }
        .smart-green .button:hover {
            background-color:#80A24A;
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
                <a class="navbar-brand" href="index.jsp">Admin</a>
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
                    <li>
                        <a href="admin.jsp"><i class="fa fa-fw fa-dashboard"></i> List receipt</a>
                    </li>
                    <li>
                        <a href="addcategory.jsp"><i class="fa fa-fw fa-file"></i> Add category</a>
                    </li>
                    <li  class="active">
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
                            Add product
                        </h1>
                    </div>
                    </div>
                <div class="row">
                    <div>
                        <form action="AddProductServlet" method="post" class="smart-green" enctype="multipart/form-data">
                            <h1>Create product
                                <span>Please fill all the texts in the fields.</span>
                            </h1>
                            <lable>
                                <span>Name :</span>
                                <input type="text" name="txtname" placeholder="Name of product" required>
                            </lable>
                            <lable>
                                <span>Price :</span>
                                <input type="text" name="txtprice" placeholder="Price of product" required>
                            </lable>
                            <lable>
                                <span>Quantity :</span>
                                <input type="text" name="txtquantity" placeholder="Quantity of product" required>
                            </lable>
                            <lable>
                                <span>Category :</span>
                                <select name="txtcategory" required>
                                    <c:if test="${not empty listcate}">
                                        <c:forEach var="category" items="${listcate}">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </lable>
                            <lable>
                                <span>Image :</span>
                                <input type="file" name="dataFile" placeholder="Image" required>
                            </lable> <br/>
                            <lable>
                                <span>Description :</span>
                                <textarea name="txtdescription" placeholder="Description of the product" required></textarea>
                            </lable>
                            <input type="submit" class="button" value="Add"/>
                        </form>
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

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
