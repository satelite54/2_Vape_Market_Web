<%@page import="DTO.Users"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>JASET VAPE</title>

</head>

<body>
<jsp:include page="../sub/menu.jsp" flush="true"/>
<jsp:include page="../sub/submenu.jsp" flush="true"/>
<div class="container mt-4" style="max-width: 350px;">
	<form name="frm" method="post" action="updateAction.do" onsubmit="return PleaseSendUTF8();" accept-charset="UTF-8">
			<h2 style="text-align: center;">회원수정</h2>
            <label style="float: left; margin-top: 5px;">이름</label> 
   			<input type="text" class="form-control" name="name" maxlength="20" readonly value="${userList.name}">
			
			<label style="float: left; margin-top: 5px;">아이디</label>
			<input type="text" class="form-control" name="id" maxlength="20" readonly value="${userList.id}">
			<label style="float: left; margin-top: 5px;">비밀번호</label>
			<input type="password" class="form-control" name="pw" maxlength="20">
			<label style="float: left; margin-top: 5px;">이메일</label>
			<input type="email" class="form-control" name="email" maxlength="20" value="${userList.email}">
			<label style="float: left; margin-top: 5px;">주소</label>
			<input type="text"class="form-control" placeholder="우편번호" name="zip" maxlength="20" style="margin-top: 5px;" value="${userList.zip}">
			<input type="text"class="form-control" placeholder="도로명" name="street" maxlength="100"style="margin-top: 5px;" value="${userList.street}">
			<input type="text"class="form-control" placeholder="건물명" name="building"	maxlength="100"style="margin-top: 5px;" value="${userList.building}">
			<label style="float: left; margin-top: 5px;">핸드폰 번호</label>
			<input type="tel" class="form-control" name="mobile" maxlength="11" value="${userList.mobile}">
			<label style="float: left; margin-top: 5px;">생년월일</label>
			<input type="date"class="form-control" name="birthday" maxlength="20" min="1920-01-01" value="${userList.birthday}">
			<button type="submit" class="btn btn-primary mt-3">수정하기</button>
			<input type="hidden" name="authority" value="1">
	</form>

	<form name="frm" action="deleteAction.do" onsubmit="return confirm('탈퇴하시겠습니까?');">
		<button type="submit" name="leave" class="btn btn-primary mt">회원탈퇴</button>
	</form>
</div>

	<script type="text/javascript">
		function PleaseSendUTF8() {
			if(confirm('수정하시겠습니까?')) {
				var f = document.frm;
				f.charset = 'UTF-8';
				f.submit();
				return true;
			} else {
				return false;
			}
		}
	</script>
<!-- 	<script>
	function Delete() {
		function button_event(){

			if (confirm("정말 삭제하시겠습니까??") == true){    //확인

			    location href = "deleteAction.jsp"

			}else{   //취소

			    return;
	}
/* 	delete.onclick() = confirm("계정을 삭제하시겠습니까??");
	 */

	</script> -->

	<jsp:include page="../sub/footer.jsp" flush="true"/>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="css/bootstrap.min.css"></script>

</body>

</html>