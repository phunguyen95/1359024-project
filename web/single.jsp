<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mypackage.Product" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.ProductDao" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
  <title>Free Bikes-Market Website Template | Single :: w3layouts</title>
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
  <link href="css/stylelogin.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/stylecart.css" rel="stylesheet" type="text/css" media="all" />
  <script src="js/modernizr.js" type="text/javascript"></script>
  <script src="js/modernizr1.js" type="text/javascript"></script>
  <script src="js/modernizr2.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/jquery.js"></script>
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
  <link href="css/jquery_notification.css" type="text/css" rel="stylesheet"/>
  <script type="text/javascript" src="js/jquery_v_1.4.js"></script>
  <script type="text/javascript" src="js/jquery_notification_v.1.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="js/main.js"></script> <!-- Gem jQuery -->
  <script src="js/main1.js"></script>
  <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
  <link rel="stylesheet" href="css/global.css">
  <script src="js/slides.min.jquery.js"></script>

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
</head>
<body>
<%
  int sku = 0;
  Product p1 = new Product();
  if(request.getParameter("sku")!=null){
    sku = Integer.parseInt(request.getParameter("sku"));
    Product p = new Product();
    p.setSKU(sku);
    p1 = new Product().getProduct(p);
    int views = new Product().getViews(p);
    session.removeAttribute("list");
%>
<c:set var="balance" value="<%=p1.getprice()%>" />
<% } %>
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
            <span style="color:#0092dd"><%=session.getAttribute("username")%></span>
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
                          session.removeAttribute("message");
                          session.invalidate();
                        }
                        else
                        {
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
                      <span id="err2"><input class="full-width has-padding" type="submit" value="Create account"></span>
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
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div class="menu">
          <div class="top-nav">
            <ul>
              <li class="active"><a href="index.jsp">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="specials.jsp">Product</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
            <div class="clear"></div>
          </div>
        </div>
        <div class="content-bottom">
          <div class="cont span_2_of_3">
            <div class="top-index">&nbsp;&nbsp;<a href="#" class="headerNavigation">Top</a> »
              <a href="#" class="headerNavigation">Catalog</a> »
              <a href="#" class="headerNavigation">BIKES</a> »
              <a href="#" class="headerNavigation last">Model 0012</a></div>
            <div class="grid-bottom">
              <div class="section group">
                <div class="lsidebar span_1_of_s">
                  <img id="zoom_01" src="images/<%=p1.getimage()%>" alt=""/></a>
                  <div id="container">
                    <div id="products_example">
                      <div id="products">
                        <div class="slides_container">

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="cont1 span_2_of_s">
                  <h5>Description </h5>
                  <p><%=p1.getdescription()%>  </p>
                  <h2 class="head"><br><span class="smallText"><%=p1.getName()%></span></h2>
                  <h3 class="price1"><b>Price:&nbsp;&nbsp;</b><span class="productPrice"><fmt:formatNumber value="${balance}" type="currency"/></span></h3>
                  <div class="options">
                    <p class="options-title">
                    <a href="SearchServlet?sku=<%=p1.getSKU()%>">Add to cart</a>
                    </form>
                    </p>

                    <div class="clear"></div>
                  </div>
                  <p class="desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. </p>
                  <div class="box_wrapper_title"><h1><span class="title-icon"></span>Tags of Product</h1></div>
                </div>
                <div class="clear"></div>
              </div>
              <div class="clear"></div>
            </div>
          </div>
          <div class="rsidebar span_1_of_3">
            <div class="sidebar">
              <h4 class="title_block"><span>Brands</span></h4>
              <div class="info-Box">
                <ul style="list-style: none; margin: 0; padding: 0;">
                  <li class="first">
                    <a href="#">Visit Manufacturer-1 ..</a>
                  </li>
                  <li class="first">
                    <a href="#">Visit Manufacturer-2 ..</a>
                  </li>
                  <li class="last">
                    <a href="#">Visit Manufacturer-3 ..</a>
                  </li>
                </ul>
              </div>
              <div class="box_wrapper_title"><h1><span class="title-icon"></span>Manufacturer Info</h1></div>
              <div class="manu-info">
                <h5><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet</a></h5>
              </div>
              <div class="box_wrapper_title1"><h1><span class="title-icon"></span>Categories</h1></div>
              <div class="sidebar-nav">
                <ul>
                  <li><a href="">Always free from repetition</a></li>
                  <li><a href="">Always free from repetition</a></li>
                  <li><a href="">The standard chunk of Lorem Ipsum</a></li>
                  <li><a href="">The standard chunk of Lorem Ipsum</a></li>
                  <li><a href="">The standard chunk of Lorem Ipsum</a></li>
                  <li><a href="">Always free from repetition</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="clear"></div>
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

    	
    	
            