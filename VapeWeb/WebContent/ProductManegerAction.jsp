<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="products" class="DTO.Products" scope="page"/>
<jsp:setProperty name ="products" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		dao DAO = new dao();
		int result = DAO.insertProduct(products);
		PrintWriter script = response.getWriter();
		if(result == 1) {
			script.println("<script>");
			script.println("alert('상품 등록이 성공적으로 되었습니다.')");
			script.println("location.href = 'ProductManeger.jsp'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('상품 등록 오류 발생.')");
			script.println("location.href = 'ProductManeger.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>