<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Profile</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/stylelogin.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/stylecart.css" rel="stylesheet" type="text/css" media="all" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="js/modernizr.js" type="text/javascript"></script>
	<script src="js/modernizr1.js" type="text/javascript"></script>
	<script src="js/modernizr2.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
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

	<c:if test="${not empty msgedit}">
		<script type="text/javascript">
			$(window).bind("load", function() {
				showNotification({
					message: "${msgedit}",
					autoClose: true,
					duration: 2
				});
			});
		</script>
		<%
			session.removeAttribute("msgedit");
		%>
	</c:if>

	<style type="text/css">
		.page-not-found{
			background-color: #B6B6D0;
		}
		.page-not-found div{
			margin-left: 50px;
			margin-top: 20px;
		}
		.page-not-found div a{
			cursor: pointer;
		}
	</style>
	<script>
		function editname(){
			var xmlhttp;
			var urls = "editname.jsp";

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
					document.getElementById("divname").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function editemail(){
			var xmlhttp;
			var urls = "editemail.jsp";

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
					document.getElementById("divemail").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function editpassword(){
			var xmlhttp;
			var urls = "editpassword.jsp";

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
					document.getElementById("divpassword").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function editpass(){
			var xmlhttp;
			var xmlhttp2;
			var k = document.getElementById("editpassword").value;
			var t = document.getElementById("editpassword1").value;
			var urls="checkpassword.jsp?ver="+k+"&ver2="+t;
			var urls2="checkpassword2.jsp?ver="+k+"&ver2="+t;
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
					document.getElementById("divcheck").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp2.onreadystatechange=function()
			{
				if (xmlhttp2.readyState==4)
				{
					//document.getElementById("err").style.color="red";
					document.getElementById("divsubmitpass").innerHTML=xmlhttp2.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
			xmlhttp2.open("GET",urls2,true);
			xmlhttp2.send();
		}
		function editgender(){
			var xmlhttp;
			var urls = "editgender.jsp";

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
					document.getElementById("divgender").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function edittel(){
			var xmlhttp;
			var urls = "edittel.jsp";

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
					document.getElementById("divtel").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function editaddress(){
			var xmlhttp;
			var urls = "editaddress.jsp";

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
					document.getElementById("divaddress").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function editbirthday(){
			var xmlhttp;
			var urls = "editbirthday.jsp";

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
					document.getElementById("divbirthday").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
	</script>
</head>
<body>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="bot2"></div>
				<div class="header">
					<c:if test="${empty username}">
						<%
							response.sendRedirect("index.jsp");
						%>
					</c:if>
					<div class="header_top_right">
						Welcome
						<span style="color:#0092dd"><u><a href="aboutme.jsp"><%=session.getAttribute("username")%></a></u></span>
						|| <a href="logout.jsp">Logout</a>
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
							</div>
						</div>					
						<div class="clear"></div> 
					</div>
			</div>	
			  <div class="menu"> 	
					<div class="top-nav"> 
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="specials.jsp">Specials</a></li>
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
		<div class="page-not-found">
			<span style="font-size: 20px; font-weight: bold; color:blue">Your Infomation</span> <hr/>
			<div>
				Username: ${username}
			</div>
			<div id="divname">
			Name: <a href="#" onclick="editname()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${fname}
			</div>
			<div id="divemail">
				Email: <a href="#" onclick="editemail()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${email}
			</div>
			<div id="divpassword">
				Password: <a href="#" onclick="editpassword()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> <input type="password" readonly value="${password}">
			</div>
			<div id="divgender">
				Gender: <a href="#" onclick="editgender()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${gender}
			</div>
			<div id="divbirthday">
				Birthday: <a href="#" onclick="editbirthday()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${birthday}
			</div>
			<div id="divtel">
				Phone number: <a href="#" onclick="edittel()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${tel}
			</div>
			<div id="divaddress">
				Address: <a href="#" onclick="editaddress()"><img src="img/userfield_edit.gif" alt="edit" title="edit"></a> ${address}
			</div>

		</div>
	</div>
	<div class="footer">
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

    	
    	
            