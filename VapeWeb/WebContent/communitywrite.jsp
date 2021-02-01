
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
<%@ include file="menu.jsp" %>
<%@ include file="submenu.jsp" %>
	
	<%! 
	dao DAO = new dao(); 
	int BNum = 0;
	%>
	
	<%
		BNum = DAO.getBNum();
	%>

	<div class="container mt-3">
	  <div class="card" style="height:500px;">
	  	<div class="card-header">
	  		글쓰기 양식
	  	</div>
	  	<div class="card-body" style="height:300px;">
	  		<form action="communityAction.jsp" method="post">
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" required>
	  			<input type="hidden" name="BNum" value="<%=BNum%>">
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required></textarea>
	  			<div class="row">
					<input type="submit" value="글작성" class="btn btn-primary ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>




	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>