<%@page import="DTO.Users"%>
<%@page import="java.util.Date"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	 <%
	 request.setCharacterEncoding("UTF-8");
	 	 Dao DAO = new Dao();
	 	Users user = new Users();
	 	user = DAO.getUserList(session);
	 	PrintWriter pw = response.getWriter();
	 %>
	
<div class="container mt-4" style="max-width: 350px;">
	<form name="frm" method="post" action="updateAction.jsp" onsubmit="return PleaseSendUTF8();" accept-charset="UTF-8">

			<h2 style="text-align: center;">회원수정</h2>
			<label style="float: left; margin-top: 5px;">이름</label> 
			<input type="text" class="form-control" name=name" maxlength="20" readonly value="<%=user.getName()%>">
			<label style="float: left; margin-top: 5px;">아이디</label> 
			<input type="text" class="form-control" name="id" maxlength="20" readonly value="<%=user.getId()%>">
			<label style="float: left; margin-top: 5px;">비밀번호</label> 
			<input type="password" class="form-control" name="pw" maxlength="20"> 
			<label style="float: left; margin-top: 5px;">이메일주소</label> 
			<input type="password" class="form-control" name=email" maxlength="100"> 
			<label style="float: left; margin-top: 5px;">주소</label> 
			<input type="text"class="form-control" placeholder="우편번호" name="zip" maxlength="20" style="margin-top: 5px;" value="<%=user.getZip()%>">
			<input type="text"class="form-control" placeholder="도로명" name="street" maxlength="100"style="margin-top: 5px;" value="<%=user.getStreet()%>"> 
			<input type="text"class="form-control" placeholder="건물명" name="building"	maxlength="100"style="margin-top: 5px;" value="<%=user.getBuilding()%>"> 
			<label style="float: left; margin-top: 5px;">핸드폰 번호</label>
			<input type="tel" class="form-control" name="mobile" maxlength="11" value="<%=user.getMobile()%>">
			<label style="float: left; margin-top: 5px;">생년월일</label> 
			<input type="date"class="form-control" name="birthday" maxlength="20" min="1920-01-01" value="<%=user.getBirthday()%>">
			<button type="submit" class="btn btn-dark mt-3">수정하기</button>
			<input type="hidden" name="admin" value="0">
			<input type="hidden" name="authority" value="1">

	</form>
	
	<form name="frm" action="deleteAction.jsp" onsubmit="return confirm('탈퇴하시겠습니까?');">
		<button type="submit" name="leave" class="btn btn-dark mt">회원탈퇴</button>
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
	
	<%@ include file="footer.jsp" %>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="css/bootstrap.min.css"></script>

</body>

</html>