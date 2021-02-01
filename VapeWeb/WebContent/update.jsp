<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>JASET VAPE</title>

</head>

<body>

	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>

	<form method="post" action="joinAction.jsp">
		<div class="container mt-4" style="max-width: 350px;">
			<h2 style="text-align: center;">회원가입</h2>
			<label style="float: left; margin-top: 5px;">아이디</label> 
			<input type="text" class="form-control" name="id" maxlength="20">
			<label style="float: left; margin-top: 5px;">비밀번호</label> 
			<input type="password" class="form-control" name="pw" maxlength="20"> 
			<label style="float: left; margin-top: 5px;">주소</label> 
			<input type="text"class="form-control" placeholder="우편번호" name="zip" maxlength="20" style="margin-top: 5px;">
			<input type="text"class="form-control" placeholder="도로명" name="street" maxlength="100"style="margin-top: 5px;"> 
			<input type="text"class="form-control" placeholder="건물명" name="building"	maxlength="100"style="margin-top: 5px;"> 
			<label style="float: left; margin-top: 5px;">핸드폰 번호</label>
			<input type="tel" class="form-control" name="mobile" maxlength="11">
			<label style="float: left; margin-top: 5px;">생년월일</label> 
			<input type="date"class="form-control" name="birthday" maxlength="20" min="1920-01-01">
			<button type="submit" class="btn btn-primary mt-3">회원가입</button>
			<button type="button" class="btn btn-primary mt-3 ml-3">취소</button>
		</div>
	</form>

	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="css/bootstrap.min.css"></script>

</body>

</html>