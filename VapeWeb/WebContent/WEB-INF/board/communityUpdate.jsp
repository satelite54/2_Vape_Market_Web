
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="DAO.Dao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
<jsp:include page="../sub/menu.jsp" flush="true"/>
<jsp:include page="../sub/submenu.jsp" flush="true"/>

	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header" style="background-color: black; color: white;">
	  		글 수정
	  	</div>
	  	<div class="card-body" style="height:500px; ">
	  		<form action="communityUpdateAction.do" method="post" onsubmit="return confirm('글을 수정하시겠습니까?')">
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" value="${param.BTitle}" required>
	  			<input type="hidden" class="form-control mb-3" name="BNum"  value="${param.BNum}" required>
	  			<input type="hidden" name="pageNum" value="${param.pageNum}"/>
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required>${param.BContent}</textarea>
	  			<div class="row">
					<input type="submit" value="글 수정" class="btn btn-success ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>



	<jsp:include page="../sub/footer.jsp" flush="true"/>
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>