<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="DTO.Products"%>
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
		
		Map<String, String[]> paraMeterMap = request.getParameterMap();
		Set<String> paraMeterKey = paraMeterMap.keySet();
		Iterator iter = paraMeterKey.iterator();
		String detailimgpath = paraMeterMap.get("detailedimgname")[0];
		products.setDetailedimagepath(detailimgpath);
		
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