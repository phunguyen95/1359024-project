<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mypackage.Category" %>
<%@ page import="com.mypackage.CategoryDao" %>
<%@ page import="com.mypackage.Product" %>
<%@ page import="com.mypackage.ProductDao" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Product</title>
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
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta charset="UTF-8">
	<!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>-->
	<!-- jQuery -->
	<link href="css/jquery_notification.css" type="text/css" rel="stylesheet"/>

	<script type="text/javascript" src="js/jquery_v_1.4.js"></script>
	<script type="text/javascript" src="js/jquery_notification_v.1.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/main.js"></script> <!-- Gem jQuery -->
	<script src="js/main1.js"></script>
	<script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
    </script>
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
	<c:if test="${not empty msgcart}">
		<script type="text/javascript">
			$(window).bind("load", function() {
				showNotification({
					message: "${msgcart}",
					autoClose: true,
					duration: 2
				});
			});
		</script>
		<% session.removeAttribute("msgcart"); %>
	</c:if>
	<script>
		function loadXMLDoc()
		{
			var xmlhttp;
			var xmlhttp2;
			var k;
			var t;
			k = document.getElementById("signup-username").value;
			var urls="pass.jsp?ver="+k;
			var urls2="pass3.jsp?ver="+k;

			if (window.XMLHttpRequest)
			{
				xmlhttp=new XMLHttpRequest();
				xmlhttp2=new XMLHttpRequest();
			}
			else
			{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");
			}

			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4)
				{
					//document.getElementById("err").style.color="red";
					document.getElementById("err").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp2.onreadystatechange=function()
			{
				if (xmlhttp2.readyState==4)
				{
					//document.getElementById("err").style.color="red";
					document.getElementById("err2").innerHTML=xmlhttp2.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
			xmlhttp2.open("GET",urls2,true);
			xmlhttp2.send();
		}

	</script>
	<script>
		function Top9View(){
			var xmlhttp;
			var urls="top9view.jsp";
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
					document.getElementById("display1").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function Top9Best(){
			var xmlhttp;
			var urls="top9best.jsp";
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
					document.getElementById("display1").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function NewProduct(){
			var xmlhttp;
			var urls="newproduct.jsp";
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
					document.getElementById("display1").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function searchajax(){
			var xmlhttp;
			var k = document.getElementById("keywordajax").value;
			var urls="searchajax.jsp?ver="+k;
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
					document.getElementById("searchajax").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		</script>

	<%-- load page top9best --%>

			<%
				if(session.getAttribute("specialspage")=="2"){
					session.removeAttribute("specialspage");
			%>
			<script type="text/javascript">
				$(document).ready(function() {
					Top9Best();
				});
			</script>
			<%
				}
				else if(session.getAttribute("specialspage")=="3"){
					session.removeAttribute("specialspage");
			%>
			<script type="text/javascript">
				$(document).ready(function() {
					Top9View();
				});
			</script>
	<% }
	else if(session.getAttribute("specialspage")=="5"){
		session.removeAttribute("specialspage");
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			NewProduct();
		});
	</script>
	<% } %>
</head>
<body>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="bot2"></div>
				<div class="header">
					<div class="header_top_right">
						<%
							session.setAttribute("checkloginattemp",3);
							Integer check = (Integer)session.getAttribute("checkloginattemp");
							Integer count = (Integer) session.getAttribute("loginattemp");
							if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
						%>


						<nav class="main-nav">
							<!-- inser more links here -->
							<a class="cd-signin" href="#">Sign in</a>
							<a class="cd-signup" href="#">Sign up</a>
						</nav>
						<%
						}
						else{
						%>
						Welcome
						<span style="color:#0092dd"><u><a href="aboutme.jsp"><%=session.getAttribute("username")%></a></u></span>
						<%
						%> || <u><a href="logout.jsp">Logout</a></u> <%
						}
					%>
						<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
							<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
								<ul class="cd-switcher">
									<li><a href="#">Sign in</a></li>
									<li><a href="#">New account</a></li>
								</ul>

								<div id="cd-login"> <!-- log in form -->
									<form action="login1" method="post" class="cd-form">
										<p class="fieldset">
											<label class="image-replace cd-username" for ="signin-username">Username</label>
											<input class="full-width has-padding has-border" name="signin-username" id="signin-username" type="text" placeholder="Username" required>
										</p>

										<p class="fieldset">
											<label class="image-replace cd-password" for ="signin-password">Password</label>
											<input class="full-width has-padding has-border" name="signin-password" id="signin-password" type="password"  placeholder="Password" required>
											<a href="#0" class="hide-password">Show</a>
										</p>

										<p class="fieldset">
											<input type="checkbox" name="checkbox" id="remember-me" >
											<label for="remember-me">Remember me</label>
										</p>

										<p class="fieldset">
											<%
												if(!check.equals(count) || check<count){
											%><input  class="full-width"  type="submit" value="Login">
											<%
											}
											else{
												long lastAccessedTime = session.getLastAccessedTime();
												Date date = new Date();
												long currentTime = date.getTime();
												long timeDiff = currentTime - lastAccessedTime;
												// 20 minutes in milliseconds
												if (timeDiff >= 600)
												{
													//invalidate user session, so they can try again
													session.removeAttribute("alertlogin");
													session.removeAttribute("loginattemp");
													session.removeAttribute("checkloginattemp");
													session.invalidate();
												}
												else
												{

													session.setAttribute("message","You have exceeded the 3 failed login attempt. Please try logging in 20 minutes");
													out.print(session.getAttribute("message"));
												}
											%>
											<input  class="full-width" disabled type="submit" value="Login">
											<% }

											%>
										</p>
									</form>

									<p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
									<!-- <a href="#0" class="cd-close-form">Close</a> -->
								</div> <!-- cd-login -->

								<div id="cd-signup"> <!-- sign up form -->
									<form action="registerServlet" method="post" class="cd-form">
										<p class="fieldset">
											<span id="err"></span>
											<label class="image-replace cd-username" for="signup-username">Username</label>
											<input class="full-width has-padding has-border" id="signup-username" name="signup-username" type="text" placeholder="Username" required onblur="loadXMLDoc()">
										</p>

										<p class="fieldset">
											<label class="image-replace cd-password" for="signup-password">Password</label>
											<input class="full-width has-padding has-border" id="signup-password" name="signup-password" type="password"  placeholder="Password" required>
											<a href="#0" class="hide-password">Show</a>
										</p>

										<p class="fieldset">
											<label class="image-replace cd-password" for="signup-checkpassword">Password</label>
											<input class="full-width has-padding has-border" id="signup-checkpassword" name="signup-checkpassword" type="password"  placeholder="Password" required>
											<a href="#0" class="hide-password">Show</a>
										</p>

										<p class="fieldset">
											<span id="err3"></span>
											<label class="image-replace cd-email" for="signup-email">E-mail</label>
											<input class="full-width has-padding has-border" id="signup-email" name="signup-email" type="email" placeholder="E-mail" required>
										</p>

										<p class="fieldset">
											<input style="width:250px;margin-right:30px;" class="has-padding has-border" id="signup-fname" name="signup-fname" type="text" placeholder="First name" required>
											<input style="width:250px" class="has-padding has-border" id="signup-lname" name="signup-lname" type="text" placeholder="Last name" required>
										</p>

										<p class="fieldset">
											<label class="image-replace cd-birthday" for="signup-bday">Birthday</label>
											<input style="width:250px;margin-right:30px;" class="full-width has-padding has-border" id="signup-bday" name="signup-bday" type="date" placeholder="Birthday" required>
											<select style="width:250px; height: 58px" id="signup-gender" name="signup-gender">
												<option style="text-align: center" value="female">Female</option>
												<option style="text-align: center" value="male">Male</option>
												<option style="text-align: center" value="other">Other</option>
											</select>
										</p>

										<p class="fieldset">
											<label class="image-replace cd-tel" for="signup-tel">Phone number</label>
											<input  class="full-width has-padding has-border" id="signup-tel" name="signup-tel" type="text" placeholder="Phone number" required>
										</p>

										<p class="fieldset">
											<input  class="full-width has-padding has-border" id="signup-address" name="signup-address" type="text" placeholder="Address" required>
										</p>

										<p class="fieldset">
											<input type="checkbox" id="accept-terms" required>
											<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
										</p>

										<p class="fieldset">
											<span id="err2"><input class='full-width has-padding' type='submit' value='Create account' /></span>
										</p>
									</form>

									<!-- <a href="#0" class="cd-close-form">Close</a> -->
								</div> <!-- cd-signup -->

								<div id="cd-reset-password"> <!-- reset password form -->
									<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

									<form class="cd-form">
										<p class="fieldset">
											<label class="image-replace cd-email" for="reset-email">E-mail</label>
											<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail" required>
										</p>
										<p class="fieldset">
											<input class="full-width has-padding" type="submit" value="Reset password">
										</p>
									</form>

									<p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
								</div> <!-- cd-reset-password -->
								<a href="#0" class="cd-close-form">Close</a>
							</div> <!-- cd-user-modal-container -->
						</div> <!-- cd-user-modal -->
						</header>


						<div class="clear"></div>
						<%
						if(session.getAttribute("list")==null){
							List<Product> list = new ProductDao().getListByName("", "", 0, 0, 9);
							session.setAttribute("list",list);
							ProductDao p2 = new ProductDao();
							int j2 = p2.countAllProduct("","",0);
							session.setAttribute("pageNumber", 1);
							session.setAttribute("allpages",j2);
							session.setAttribute("startIndex", 0);
							session.setAttribute("btnNext", "Next");
							session.setAttribute("btnPrevious", "Previous Disabled");
							if (list!=null&&list.size() < 9|| list.size() == 0) {
								session.setAttribute("btnNext", "Next Disabled");
							}
						}
						%>
						<div class="clear"></div>
			 		</div>
					 <div class="clear"></div>
					<div class="header-bot">
						<div class="logo">
							<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
						</div>
						<div class="cart">
					    	<ul class="ph-no">
								<li class="item  first_item">
								<div class="item_html">
								<span class="text1">Order delivery:</span>
								<span class="text2">+800-0005-5289</span>
								</div>
								</li>
							</ul>
				    		<div class="login">
							</div>
								<header>
									<div id="cd-cart-trigger"><a class="cd-img-replace" href="#0">Cart</a></div>
								</header>

								<div id="cd-cart">
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
													<script>
														function sendInfo${product.getP().SKU}(){
															var xmlhttp;
															var s = document.getElementById("txtQuantity${product.getP().SKU}");
															var k = s.id;
															var t = s.value;
															var urls = "updatecart.jsp?ver2="+t+"&ver="+ k;
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
																	document.getElementById("cd-cart").innerHTML=xmlhttp.responseText;
																}
															}
															xmlhttp.open("GET",urls,true);
															xmlhttp.send();
														}
														function remove${product.getP().SKU}(){
															var xmlhttp;
															var s = document.getElementById("remove${product.getP().SKU}");
															var k = s.id;
															var urls = "removecart.jsp?ver="+ k;
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
																	document.getElementById("cd-cart").innerHTML=xmlhttp.responseText;
																}
															}
															xmlhttp.open("GET",urls,true);
															xmlhttp.send();
														}
													</script>
												</c:forEach>
											</c:when>
										</c:choose>
									</ul> <!-- cd-cart-items -->

									<div class="cd-cart-total">
										<p>Total <span><fmt:formatNumber value="${total}" type="currency"/></span></p>
									</div> <!-- cd-cart-total -->

									<a href="CheckoutServlet?totalPrice=${total}" class="checkout-btn">Checkout</a>

									<p class="cd-go-to-cart"><a href="viewcart.jsp">Go to cart page</a></p>
								</div> <!-- cd-cart -->

				    		<div class="cart-desc">

									<div class="clear"></div> 
							</div>
						</div>					
						<div class="clear"></div> 
					</div>
			</div>	
			  <div class="menu"> 	
					<div class="top-nav"> 
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="#">About</a></li>
								<li class="active"><a href="specials.jsp">Product</a></li>
								<c:if test="${empty role}">
									<li><a href="#">Contact</a></li>
								</c:if>
								<c:if test="${not empty role}">
									<c:choose>
									<c:when test="${role eq 1}">
									<li><a href="admin.jsp">Adminpage</a></li>
									</c:when>
								<c:otherwise>
								<li><a href="#">Contact</a></li>
								</c:otherwise>
									</c:choose>
								</c:if>
							</ul>
							<div class="clear"></div> 
					</div>
				</div>		
	<div class="content-bottom">
		<div style="float:left;width: 300px" class="page-not-found">
			<p style="text-align: center;padding-top: 30px;"><a href="specials.jsp">All Products</a></p>
			<p style="text-align: center;padding-top: 30px;"><a href="#" onclick="Top9Best()">Top 9 Best Seller</a></p>
			<p style="text-align: center;padding-top: 30px;"><a href="#" onclick="Top9View()" >Top 9 Most View</a></p>
			<p style="text-align: center;padding-top: 30px;"><a href="#" onclick="NewProduct()" >New Product</a></p>
		</div>
		<div style="float:left" id="display1">
			<span style="color: rgb(236, 38, 33);"><b>All products</b></span> <hr />
			<h4 style="height:70px; padding-top:10px; padding-left: 10px;">
				<form action="SearchServlet" method="post">
					<input type="hidden" name="specialspage" value="1">
					<input type="hidden" name="action" value="load"/>
					<input type="search" name="txtname" placeholder="key word"/>
					<select name="txtpricesearch">
						<option value="0">Price</option>
						<option value="low"> < 30.000.000 VND</option>
						<option value="average"> < 100.000.000 VND</option>
						<option value="high"> > 100.000.000 VND</option>
					</select>
					<%
						List<Category> listcate = new CategoryDao().GetAll();
						session.setAttribute("listcate",listcate);
					%>
					<select name="txtcategory">
						<option value="0">Category</option>
						<c:if test="${not empty listcate}">
							<c:forEach var="category" items="${listcate}">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</c:if>
					</select>
					<input type="submit" value="Search"/>
				</form>
				<input style="margin-top: 10px" type="text" id="keywordajax" placeholder="Smart key word" onkeyup="searchajax()">
			</h4>
			<div id="searchajax">
			<c:choose>
				<c:when test="${not empty list}">
					<% int countcontent = 1; %>
					<c:forEach var="product" items="${list}">
						<c:set var="balance" value="${product.price}" />
						<%
							if(countcontent==1){
						%> <div class="grid-bottom"> <%
						}
						if(countcontent % 3!=0){
							countcontent++;
					%>
						<div class="col_1_of_b span_1_of_bottom">
							<div class="grids ">
								<a href="single.jsp?sku=${product.SKU}">
									<span style="right:0;position:absolute"><img src="img/views-icon.png">${product.getviews()}</span>
									<img width="192px" height="128px" src="images/${product.image}" alt=""/>
								</a>
								<div class="price">
									<a href="single.jsp?sku=${product.SKU}">
										<div class="bot1">
											<p class="title" style="height: 38px;">${product.name}</p>
											<div class="price1" style="margin-top: 25px;height: 19px;">
                        <span class="actual"><fmt:formatNumber value="${balance}"
															   type="currency"/></span>
											</div>
										</div></a>
									<div  class="cart1">
										<img  src="images/cart.png" alt=""/>
										<form action="SearchServlet" method="post">
											<input type="hidden" name="action" value="${product.SKU}"/>
											<input type="hidden" name="sku" value="${product.SKU}"/>
											<input type="hidden" name="specialspage" value="1"/>
											<input type="submit" class="submitLink1" value="" style="width: 65px; height: 68px; top:143px; right:0" />
										</form>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<% }
						else {
							countcontent=1;
						%>
						<div class="col_1_of_b span_1_of_bottom1">
							<div class="grids ">
								<a href="single.jsp?sku=${product.SKU}">
									<span style="right:0;position:absolute"><img src="img/views-icon.png">${product.getviews()}</span>
									<img width="192px" height="128px" src="images/${product.image}" alt=""/>
								</a>
								<div class="price">
									<a href="single.jsp?sku=${product.SKU}">
										<div class="bot1">
											<p class="title" style="height: 38px;">${product.name}</p>
											<div class="price1" style="margin-top: 25px;height: 19px;">
												<span class="actual"><fmt:formatNumber value="${balance}" type="currency"/></span>
											</div>
										</div></a>
									<div class="cart1">
										<img  src="images/cart.png" alt=""/>
										<form action="SearchServlet" method="post">
											<input type="hidden" name="action" value="${product.SKU}"/>
											<input type="hidden" name="sku" value="${product.SKU}"/>
											<input type="hidden" name="specialspage" value="1"/>
											<input type="submit" class="submitLink1" value="" style="width: 65px; height: 68px; top:143px; right:0" />
										</form>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
						<% }
						%>
					</c:forEach>
				</c:when>
				<c:otherwise>No record</c:otherwise>
			</c:choose>

			<c:if test="${not empty list}">
				<div style="width: 100%" class="cont span_2_of_3"><h4  style="height: 35px">
					<div id="menu1" style="float:right; vertical-align: middle">
						<div class="navbar">
							<form action="SearchServlet" method="post">
								<input type="hidden" name="action" value="previous">
								<input type="hidden" name="specialspage" value="1">
								<c:choose>
									<c:when test="${btnPrevious!='' && btnPrevious!='Previous Disabled'}">
										<input type="submit" class="button1" value="${btnPrevious}">
									</c:when>
									<c:otherwise>
										<input type="submit" class="button1" disabled value="Previous">
									</c:otherwise>
								</c:choose>
							</form>
						</div>

						<div class="navbar">
							<c:forEach begin="1" end="${allpages}" var="i">
								<c:choose>
									<c:when test="${pageNumber eq i}">
										<div class="navbar">${i}</div>
									</c:when>
									<c:otherwise>
										<div class="navbar">
											<form action="SearchServlet" method="post">
												<input type="hidden" name="specialspage" value="1">
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
							<form action="SearchServlet" method="post">
								<input type="hidden" name="specialspage" value="1">
								<input type="hidden" name="action" value="next">
								<c:choose>
									<c:when test="${btnNext!=''&& btnNext!='Next Disabled'}">
										<input type="submit" class="button1" value="${btnNext}">
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
			</div>
		</div>

	</div>
	<div style="float:left;width:100%" class="footer">
		<div class="section group">
				<div class="col_1_of_4 span_1_of_4">
					<h3>INFORMATION</h3>
					<ul>
						<li><a href="#">About us</a></li>
						<li><a href="#">Sitemap</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms and conditions</a></li>
						<li><a href="#">Legal Notice</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h3>OUR OFFERS</h3>
					<ul>
						<li><a href="#">New products</a></li>
						<li><a href="#">top sellers</a></li>
						<li><a href="#">Specials</a></li>
						<li><a href="#">Products</a></li>
						<li><a href="#">Comments</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h3>YOUR ACCOUNT</h3>
					<ul>
						<li><a href="#">Your Account</a></li>
						<li><a href="#">Personal info</a></li>
						<li><a href="#">Prices</a></li>
						<li><a href="#">Address</a></li>
						<li><a href="#">Locations</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4 footer-lastgrid">
					<h3>Get in touch</h3>
					<ul>
						<li><a href="#"><img src="images/facebook.png" title="facebook"></a></li>
						<li><a href="#"><img src="images/twitter.png" title="Twiiter"></a></li>
						<li><a href="#"><img src="images/rss.png" title="Rss"></a></li>
						<li><a href="#"><img src="images/gpluse.png" title="Google+"></a></li>
					</ul>
					<p>Design by <a href="#">W3layouts</a></p>
				</div>
				<div class="clear"></div> 
		</div>
	</div>
   </div>
</div>
</div>
</div>
</body>
</html>

    	
    	
            