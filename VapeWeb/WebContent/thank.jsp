<%@page import="DTO.Orders"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.dao"%>
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
<%!
dao DAO = new dao();
String Date = DAO.getDate();
Orders orders = new Orders();
%>

<%	
String cartID = session.getId();
String id = "Ahyoung";
DAO.upDateOrder(id, session);	
%>
<br><br><br>

<div class="container">
	<h1 class="display-3 font-weight-bold" style="color: #223a6b" >주문완료</h1>
	<h2 class="alert alert-info">구매해 주셔서 감사합니다!</h2>
	<p>	주문은	<%=	Date %> 에 배달예정입니다.!!	<p>	Order# :<%	out.println(cartID);%>		
		<div class="container">
			<p>	<a href="Productsalespage.jsp" class="btn btn-dark"> &laquo; 쇼핑더하기</a>		
		</div>
</div>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>