<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
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


	<div class="container  border border-dark rounded">
		<div class="row p-2 font-weight-bold"
			style="background-color: black; color: white;">
			<div class="col-sm-2">번호</div>
			<div class="col-sm-4">글 제목</div>
			<div class="col-sm-2">작성자</div>
			<div class="col-sm-2">작성일</div>
			<div class="col-sm-2">조회수</div>
		</div>
		<div class="row border border-dark">
			<div class="col-sm-2">1</div>
			<div class="col-sm-4">이것은 제목입니다.</div>
			<div class="col-sm-2">정재우</div>
			<div class="col-sm-2">2021-01-25</div>
			<div class="col-sm-2">1</div>
		</div>
			<div class="card-body text-dark">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>

	</div>
	</div>



	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>