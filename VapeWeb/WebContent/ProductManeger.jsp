<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="submenu.jsp" %>
	<form action="PMAction" method="post">
		<input type = "text" name = "pname">
		<input type = "text" name = "code">
		<input type = "text" name = "manufacturer">
		<input type = "text" name = "price">
		<input type = "text" name = "stock">
		<input type = "text" name = "producttype">
		<input type = "file" name="imgname" accept="image/*">
		<input type = "file" name="detailedimgname" accept="image/*">
		<input type = "submit" name="insert" value = "insert">
		<input type = "submit" name="delete" value = "delete">
		<input type = "submit" name="update" value = "update">
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>