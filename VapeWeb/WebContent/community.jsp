<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<%@ page import="DTO.Board" %>
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
<script type="text/javascript">

</script>
	<div class="container">

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
			<!-- 반복문의 시작 -->
				<tr>
					<th scope="row"><a href="communityenter.jsp">1</a></th>
					<td class="BNum">1</td>
					<td>Otto</td>
					<td>@mdo</td>
					
				</tr>
			</tbody>
		</table>
				<button type="button" class="btn btn-secondary">1</button>
				<a href="communitywrite.jsp" class="btn btn-success float-right" >글쓰기</a>
		</div>






	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>