
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
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%!
		int BNum = 0;
		String BTitle = null;
		String BContent = null;
	%>
	
	<%
	int BNum = Integer.parseInt(request.getParameter("BNum"));
	String BTitle = request.getParameter("BTitle");
	String BContent = request.getParameter("BContent");
	
	System.out.println(BNum);
	System.out.println(BTitle);
	System.out.println(BContent);
	
	%>
	<form action="communityUpdateAction.jsp" method="post">
	<div class="container mt-3">
	  <div class="card" style="height:500px;">
	  	<div class="card-header">
	  		글 수정
	  	</div>
	  	<div class="card-body" style="height:350px;">
	  		
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" value="<%=BTitle%>" required>
	  			<input type="hidden" class="form-control mb-3" name="BNum"  value="<%=BNum%>" required>
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required><%=BContent%></textarea>
	  	</div>
			  	
	  </div>
	  <input type="submit" value="글수정" class="btn btn-primary float-right mt-3">
	</div>
	</form>



	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>