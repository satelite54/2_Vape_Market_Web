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

 	<div class="under19Recommend">
 		<img class="rounded mx-auto d-block" src="${pageContext.request.contextPath}/img/adult.jpg" alt="이 정보내용은 청소년 유해매체물로서 정보통신망 이용촉진법 및 정보보호 등에 관한 법률 및 청소년 보호법의 규정에 의하여 19세 미만의 청소년은 사용할 수 없습니다">
	</div>
	<div class="container mt-5" style="max-width: 800px;">
		 <form method="post" action="loginAction.jsp">
 		 <div class="mb-3 row">
   			<label for="inputID" class="col-sm-4 col-form-label">아이디</label>
   		 		<div class="col-sm-6">
					<input type="text" class="form-control" name="id" maxlength="20">
   				</div>
		 </div>
	 	 <div class="mb-3 row">
    		<label for="inputPassword" class="col-sm-4 col-form-label">비밀번호</label>
    			<div class="col-sm-6">
      				<input type="password" class="form-control" name="pw" maxlength="20">
    			</div>
  		</div>
  			<button type="submit" class="btn btn-primary">로그인</button>
  		</form>
	</div>   


 





							
<%@ include file="footer.jsp" %>		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>