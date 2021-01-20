<%@ page import="DAO.dao" %>  
<%@ page import="DTO.Board" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!-- Bbs클래스의 객체를 생성하여 이페이지에서 사용할수 있게한다. -->
<jsp:useBean id="Board" class="DTO.Board" scope="page"/>
<!-- form으로부터 전달된 파라메터들을 bbs객체의 set메소드를 사용하여 저장 -->
<jsp:setProperty name="Board" property="BTitle"/>
<jsp:setProperty name="Board" property="BContent"/>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%  
			dao DAO = new dao();
			//자바빈 객체 bbs에 저장된 title과 content를 입력
			int result = DAO.write(Board.getBTitle(), Board.getBContent());
	%>
</body>
</html>












