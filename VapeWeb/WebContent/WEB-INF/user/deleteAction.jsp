<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="user" class="DTO.Users" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="birthday" />
<jsp:setProperty name="user" property="zip" />
<jsp:setProperty name="user" property="street" />
<jsp:setProperty name="user" property="building" />
<jsp:setProperty name="user" property="mobile" />
<jsp:setProperty name="user" property="admin" />
<jsp:setProperty name="user" property="authority" />
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="DAO.Dao"%>
<%@ page import="DTO.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
<%
	// 알러트 창 띄운 다음 메인 홈페이지 이동
		Dao userDAO = new Dao();
		int Updateresult = userDAO.deleteUser(session);
		PrintWriter pw = response.getWriter();
		if(Updateresult > 0) {
			pw.println("<script>");
			session.invalidate();
			pw.println("alert('회원탈퇴가 완료되었습니다.')");
			pw.println("location.href = 'main.jsp'");
			pw.println("</script>");
		} else if(Updateresult == 0) {
			pw.println("<script>");
			pw.println("alert('회원탈퇴에 실패했습니다. 잠시 후 시도해 주세요.')");
			pw.println("location.href = 'main.jsp'");
			pw.println("</script>");

			/*
			var con_test = confirm("어떤 값이 나올까요. 확인을 눌러보세요.");
			if(con_test == true){
			  document.write("확인을 누르셨군요");
			}
			else if(con_test == false){
			  document.write("취소를 누르셨군요.");
			}


			*/
		}
	%>





	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>