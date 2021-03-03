<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>

	<div class="container mt-5" style="max-width: 800px;">
		<form action="PMAction" method="post">
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">상품명</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="pname">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">상품코드</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="code">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">제조사</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="manufacturer">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">가격</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="price">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">재고</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="stock">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">상품타입</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="producttype">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">상품 대표 이미지</label>
				<div class="col-sm-6">
					<input type="file" name="imgname" accept="image/*">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="ProductID" class="col-sm-4 col-form-label">상품 상세 이미지</label>
				<div class="col-sm-6">
					<input type="file" name="detailedimgname" accept="image/*"> 
				</div>
			</div>
			<input type="submit" name="insert" value="삽입" class="btn btn-primary"> 
			<input type="submit" name="delete" value="삭제" class="btn btn-primary">
			<input type="submit" name="update" value="수정" class="btn btn-primary"> 
		</form>
	</div>
	<br>
	
	<form action="DUser" method="get">
		<div class="container mt-5" style="max-width: 800px;">
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
							<td>${User.zip}${User.street} ${User.building}</td>
							<td><input type="checkbox" name="UserCheck"
								value="${User.id}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<input type="submit" class="btn btn-danger" style="float: right;"
			value="삭제">
		</div>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>