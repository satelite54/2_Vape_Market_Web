<%@page import="DTO.Orders"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.Dao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">	
<title>JASET VAPE</title>
</head>

<body>

<jsp:include page="../sub/menu.jsp" flush="true"/>
<jsp:include page="../sub/submenu.jsp" flush="true"/>
<%!Dao DAO = new Dao();
String Date = DAO.Day2();%>

<%	
String cartID = session.getId();
DAO.upDateOrder((String)session.getAttribute("id"), session);
%>
<br><br><br>

<div class="container">
	<h1 class="display-3 font-weight-bold" style="color: #223a6b" >주문완료</h1>
	<h2 class="alert alert-info">구매해 주셔서 감사합니다!</h2>
	<p>	주문은	<%=	Date %> 에 배달예정입니다.!!	<p>	Order# :<%	out.println(cartID);%>		
		<div class="container">
			<p>	<a href="main.do" class="btn btn-dark"> &laquo; 쇼핑더하기</a>		
		</div>
</div>
<jsp:include page="../sub/footer.jsp" flush="true"/>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

	  	  	

</body>

</html>