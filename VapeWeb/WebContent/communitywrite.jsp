<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
<%
	
%>
	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header">
	  		글쓰기 양식
	  	</div>
	  	<div class="card-body">
	  		<form action="communityAction" method="post">
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" required>
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required></textarea>
	  			<div class="row">
					<input type="submit" value="글작성" class="btn btn-primary ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
		
	  </div>
	</div>
 
<% 
dao DAO = new dao();
String sql = "INSERT INTO Board Values(?,?,?,?,?,?,?)";
Connection conn = null;
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = null;



%>



	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>