<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/community.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
	<jsp:include page="menu.jsp" />


	<div class="jumbotron mt-5">
		<form action="community_writeaction">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">글제목</span>
				</div>
				<input type="text" class="form-control" name="BTitle" aria-label="Amount (to the nearest dollar)">
				<div class="input-group-append">
					<span class="input-group-text"></span>
				</div>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style="height: 400px;"> 글내용 </span>
				</div>
				<textarea class="form-control" name="BContent" aria-label="글내용"></textarea>
			</div>
			<div>
			
			<br><input type="submit" class="btn btn-primary float-right" value="등록">
			</div>
		</form>
	</div>


</body>
</html>