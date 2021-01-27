<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>



<%!
dao DAO = new dao();
PreparedStatement pstmt = null;
ResultSet rs = null;
%>
<%
ArrayList <Board> list =  DAO.getList();
for(int i = 0 ; i< list.size() ; i++){

%>



	
	<div class="container  border border-dark rounded">
		<div class="row p-2 font-weight-bold"
			style="background-color: black; color: white;">
			<div class="col-sm-2"> %>번호</div>
			<div class="col-sm-4">글 제목</div>
			<div class="col-sm-2">작성자</div>
			<div class="col-sm-2">작성일</div>
			<div class="col-sm-2">조회수</div>
		</div>
		<div class="row border border-dark">
			<div class="col-sm-2"></div>
			<div class="col-sm-4"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2"></div>
		</div>
			<div class="card-body text-dark">
				<p class="card-text"></p>
<!-- 			</div> -->
		</div>
<%! %>

%>



	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>