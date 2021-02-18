<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="DAO.dao"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>	
	<%!
		dao DAO = new dao();
	%>
	
	<%
	String BTitle = request.getParameter("BTitle");
	String BContent= request.getParameter("BContent");
	int BNum = Integer.parseInt(request.getParameter("BNum"));
	
	DAO.updateBoard(BTitle, BContent, BNum);
	response.sendRedirect("communityenter.jsp");
	%>



	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>