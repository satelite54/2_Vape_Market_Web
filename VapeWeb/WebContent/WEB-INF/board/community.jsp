<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.awt.dnd.DropTargetListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="DTO.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>


</head>
<body>
<%@ include file="../sub/menu.jsp" %>
<%@ include file="../sub/submenu.jsp" %>

	
	<script type="text/javascript">

</script>

	<div class="container">
		<table class="table border-dark rounded">
			<thead class="thead-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody class="border">
				<c:forEach items="list"> 
				<tr>
					<td>{$list.BNum}</td>
					<td>{$list.BTitle}</td>
					<td>{$list.id}</td>
					<td>{$list.BDate}</td>
					<td>{$list.views}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item"><a class="page-link" href="community.jsp?cnl=#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="community.jsp?cnl=#"></a></li>				
			</ul>
		</nav>
		<a href="#" onclick="checkForm1(); return false;" class="btn btn-success float-right">글쓰기</a>			
		
		
	</div>
	<%@ include file="../sub/footer.jsp" %>
	<script type="text/javascript">
	   function checkForm1() {
	      if (${id==null}) {
	         alert("로그인 해주세요.");
	         return false;
	      }
	      location.href = "./communitywrite.jsp?id=${id}"
	   }
	</script>
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>