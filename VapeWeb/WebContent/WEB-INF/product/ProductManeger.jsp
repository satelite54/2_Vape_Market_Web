<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../sub/menu.jsp" flush="true"/>
	<jsp:include page="../sub/submenu.jsp" flush="true"/>

	<div>
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
	</div>

	<form action="DUser" method="get">
		<div>
			<table class="table table-sm boder-dark">
			  <thead>
			    <tr>
			      <th scope="col">회원번호</th>
			      <th scope="col">아이디</th>
			      <th scope="col">이름</th>
			      <th scope="col">전화번호</th>
			      <th scope="col">주소</th>
			      <th scope="col">선택</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="User" items="${AllUsersList}" varStatus="vs">
			    <tr>
			      <th scope="row">${vs.count}</th>
			      <td>${User.id}</td>
			      <td>${User.name}</td>
			      <td>${User.mobile}</td>
			      <td>${User.zip} ${User.street} ${User.building}</td>
			      <td><input type="checkbox" name="UserCheck" value="${User.id}"></td>
			    </tr>
			   </c:forEach>
			  </tbody>
			</table>
		</div>
		<input type="submit" class="btn btn-danger" style="float: right;" value="삭제">
	</form>




	<jsp:include page="../sub/footer.jsp" flush="true"/>
</body>
</html>