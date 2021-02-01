<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>

<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">	
	<title>JASET VAPE</title>
	
</head>

<body>

<%@ include file="menu.jsp" %>
<%@ include file="submenu.jsp" %>

	<div class="container mt-5" style="max-width: 600px;">
		 <form method="post" action="joinAction.jsp">
		 <h3 style="text-align: center;">회원가입</h3>
 		 <div class="form-group">
   			<label style="float: left;">아이디</label>
				<input type="text" class="form-control" name="id" maxlength="20">
		 </div>
 		 <div class="form-group">
   			<label style="float: left;">비밀번호</label>
				<input type="password" class="form-control" name="pw" maxlength="20">
		 </div>
 		 <div class="form-group">
   			<label style="float: left;">주소</label>
				<input type="text" class="form-control" placeholder="우편번호" name="zip" maxlength="20">
				<input type="text" class="form-control" placeholder="도로명" name="street" maxlength="100">
				<input type="text" class="form-control" placeholder="건물명" name="building" maxlength="100">
		 </div>
		 <div class="form-group">
   			<label style="float: left;">핸드폰 번호</label>
				<input type="text" class="form-control" name="mobile" maxlength="20">
		 </div>
		 <div class="form-group">
   			<label style="float: left;">생년월일</label>
				<input type="text" class="form-control" name="birthday" maxlength="20">
		 </div>
		 
  			<button type="submit" class="btn btn-primary ">회원가입</button>
  			<button type="button" class="btn btn-primary ml-3">취소</button>
  		</form>
	</div>   


 





							
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>