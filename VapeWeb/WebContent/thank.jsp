<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>





<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">	
<title>JASET VAPE</title>
	
</head>

<body>

<%@ include file="menu.jsp" %>




	<%
		String shipping_cartId = "";
		String shipping_shippingDate = "";

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
		
		Date today = new Date();
		Date shippingdate = new Date(today.getTime() + (2000 * 60 * 60 * 24));
	%>
<br><br><br>

<div class="container">
<h1 class="display-3 font-weight-bold" style="color: #223a6b" >주문완료</h1>
<h2 class="alert alert-info">구매해 주셔서 감사합니다!</h2>

<p>	주문은	<%=	shippingdate %>에 배달예정입니다.!!	<p>	Order# :	<%	out.println(shipping_cartId);	%>		
	<div class="container">
		<p>	<a href="Productsalespage.jsp" class="btn btn-dark"> &laquo; 쇼핑더하기</a>		
	</div>
</div>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>
</body>
</html>
<%
	session.invalidate();
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		response.addCookie(thisCookie);
	}
%>
</body>
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>