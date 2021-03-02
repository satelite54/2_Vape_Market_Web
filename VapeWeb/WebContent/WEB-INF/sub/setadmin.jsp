<%@page import="java.io.PrintWriter"%>
<%@ page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Dao DAO = new Dao();
			String id = (String)request.getParameter("userid");
			int setadmin = DAO.setadmin(id);
			if(setadmin == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('" + id + "님이 관리자 권한을 획득하셨습니다." + "')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자 권한 부여 취소')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
			}
	%>
</body>
</html>