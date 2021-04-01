<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="DTO.Board" %>
<%@ page import="DAO.Dao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
<jsp:include page="../sub/menu.jsp" flush="true" />
<jsp:include page="../sub/submenu.jsp" flush="true" />

<c:if test="${empty sessionScope.id}">
	<script>
		location.href = "login.do"
	</script>
</c:if>


	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header" style="background-color: black; color: white;">
	  		글쓰기 양식
	  	</div>
	  	<div class="card-body" style="height:500px;">
	  		<form action="communityWriteAction.do" method="post">
	  			<input type="text" class="form-control mb-3" name="BTitle" placeholder="글제목" maxlength="50" required>
	  			<textarea class="form-control mb-3" name="BContent" style="height: 350px" placeholder="글내용" maxlength="2048" required></textarea>
	  			<div class="row">
					<input type="submit" value="등록" class="btn btn-success ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>



	<jsp:include page="../sub/footer.jsp" flush="true"/>
</body>
</html>