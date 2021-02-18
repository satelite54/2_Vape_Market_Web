<%@page import="java.util.Date"%>
<%@page import="DAO.dao"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="DTO.Users" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>

<head>
	<title>JASET VAPE</title>
	
</head>

<body>
	<%
		String id = null;
		if	(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		if	(id != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		dao userDAO = new dao();
		int result = userDAO.login(user.getId(), user.getPw());
		int admin = userDAO.getadmin(user.getId());
		if (result == 1) {
			session.setAttribute("id", user.getId());
			if(admin == 1)
				session.setAttribute("admin", String.valueOf(admin));
			session.setMaxInactiveInterval(30*60);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>

</body>

</html>