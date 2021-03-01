
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
		int RNum = 0;
		String RTitle = null;
		String RContent = null;
	%>
	
	<%
	int RNum = Integer.parseInt(request.getParameter("RNum"));
	String RTitle = request.getParameter("RTitle");
	String RContent = request.getParameter("RContent");
	
	System.out.println(RNum);
	System.out.println(RTitle);
	System.out.println(RContent);
	
	%>
	
	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header" style="background-color: black; color: white;">
	  		글 수정
	  	</div>
	  	<div class="card-body" style="height:500px; ">
	  		<form action="review/reviewUpdateAction.jsp" method="post" onsubmit="return confirm('글을 수정하시겠습니까?')">
	  			<input type="text" class="form-control mb-3" name="RTitle" placeholder="글제목" maxlength="50" value="<%=RTitle%>" required>
	  			<input type="hidden" class="form-control mb-3" name="RNum"  value="<%=RNum%>" required>
	  			<textarea class="form-control mb-3" name="RContent" style="height: 350px" placeholder="글내용" maxlength="2048" required><%=RContent%></textarea>
	  			<div class="row">
					<input type="submit" value="글 수정" class="btn btn-success ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>



	
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>