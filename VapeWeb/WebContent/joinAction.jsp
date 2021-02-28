<%@page import="java.util.Date"%>
<%@page import="DAO.Dao"%>
<%@page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="DTO.Users" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="birthday" />
<jsp:setProperty name="user" property="zip" />
<jsp:setProperty name="user" property="street" />
<jsp:setProperty name="user" property="building" />
<jsp:setProperty name="user" property="mobile" />
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>

<head>
	<title>JASET VAPE</title>
	
</head>

<body>
	<%
	String id = null;
			String pw = (String)session.getAttribute("pw");
			String name = (String)session.getAttribute("name");
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
			if (user.getName() == null || user.getId() == null || user.getPw() == null || user.getZip() == null || user.getStreet() == null || user.getBuilding() == null || user.getMobile() == null || user.getBirthday() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		Dao userDAO = new Dao();
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

			}
	%>

</body>

</html>