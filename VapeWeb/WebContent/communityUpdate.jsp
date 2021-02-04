
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="DAO.dao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	
	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header" style="background-color: black; color: white;">
	  		글 수정
	  	</div>
	  	<div class="card-body" style="height:500px; ">
	  		<form action="communityUpdateAction.jsp" method="post" onsubmit="return confirm('글을 수정하시겠습니까?')">
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" value="<%=BTitle%>" required>
	  			<input type="hidden" class="form-control mb-3" name="BNum"  value="<%=BNum%>" required>
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required><%=BContent%></textarea>
	  			<div class="row">
					<input type="submit" value="글 수정" class="btn btn-success ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>



	<%@ include file="footer.jsp" %>
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>