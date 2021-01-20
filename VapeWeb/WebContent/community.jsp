<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<%@ page import="DTO.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/community.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
<jsp:include page="menu.jsp" />
</head>
<body>
		<table class="table">
			<thead class="thead-dark striped">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>팀프로젝트</td>
					<td>재우</td>
					<td>2021-01-20</td>
					<td>999</td>
			</tbody>
		</table>
		
		
		<span class="pagenum">
		<a href="#" class="btn btn-warning" style="margin-left:20px">이전</a>
		<a href="?community.jsp" class="btn btn-success" style="margin-left:10px">1</a>
		<a href="community_write.jsp" class="btn btn-primary float-right" style="margin-right:20px;" >글작성</a>
		</span>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>
</body>
</html>