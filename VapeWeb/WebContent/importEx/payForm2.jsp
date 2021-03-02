<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="DTO.Orders"%>
<%@page import="DAO.Dao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제시스템</title>
<style>
span {
	width: 60px;
	display: inline-block;
}
</style>
</head>
<body>
	<h2>payForm</h2>
	<form action="payProc.jsp" method="post">
		<span>name:</span><input name="name" value="홍길동"><br> 
		<span>이메일:</span><input name="email" value="simba222@naver.com"><br>
		<span>폰넘버:</span><input name="phone" value="010-3570-6996"><br>
		<span>주소:</span><input name="address" value="부산광역시 연제구 아시아드대로22번길 36 (거제동, 거제푸르지오)"><br>
		<span>총가격:</span><input name="totalPrice" value="500"><br> 
		<input type="submit" value="결제하기"> 
		<input type="reset" value="취소하기">
	
	
	
	
<%
		String id = null;
		if	(session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
		}
	%>
 <%
	 request.setCharacterEncoding("UTF-8");
	 	 Dao DAO = new Dao();
	 	Users user = new Users();
	 	user = DAO.getUserList(session);
	 	PrintWriter pw = response.getWriter();
	 %>
	 
	 
	 ${param.name}
	 ${param.id}
	 ${param.zip}
	 ${param.street}
	 ${param.building}
	 ${param.mobile}
	 
	 
	 
	 <!-- 결제 시스템에 필요한 정보들 불러오기 -->
	<jsp:setProperty name="user" property="name" />		
	<input type="hidden" class="form-control" name="id" maxlength="20" readonly value="<%=user.getId()%>">
	<input type="hidden"class="form-control" placeholder="우편번호" name="zip" maxlength="20" style="margin-top: 5px;" value="<%=user.getZip()%>">
	<input type="hidden"class="form-control" placeholder="도로명" name="street" maxlength="100"style="margin-top: 5px;" value="<%=user.getStreet()%>"> 
	<input type="hidden"class="form-control" placeholder="건물명" name="building"	maxlength="100"style="margin-top: 5px;" value="<%=user.getBuilding()%>"> 
	<input type="hidden" class="form-control" name="mobile" maxlength="11" value="<%=user.getMobile()%>">
	</form>
	
	
	
	
	
	
	
</body>
</html>


