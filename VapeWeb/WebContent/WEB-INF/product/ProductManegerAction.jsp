<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="DTO.Products"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	Dao DAO = new Dao();
			
			Map<String, String[]> paraMeterMap = request.getParameterMap();
			Set<String> paraMeterKey = paraMeterMap.keySet();
			Iterator iter = paraMeterKey.iterator();
			String[] strAry = new String[paraMeterMap.size()];
			for(int i = 0; iter.hasNext(); i++) {
		strAry[i] = (String) iter.next();
			}
			
			String detailimgpath = paraMeterMap.get("detailedimgname")[0];
			products.setDetailedimagepath(detailimgpath);
			
			
			int parameterSize = paraMeterMap.size();
			switch(strAry[parameterSize - 1]) {
		case "insert": {
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
			break;
		}
		case "delete": {
			int result = DAO.deleteProduct(products.getPname());
			PrintWriter script = response.getWriter();
			if(result == 1) {
				script.println("<script>");
				script.println("alert('상품 삭제가 성공적으로 되었습니다.')");
				script.println("location.href = 'ProductManeger.jsp'");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('상품 삭제 오류 발생.')");
				script.println("location.href = 'ProductManeger.jsp'");
				script.println("</script>");
			}
			break;
		}
		case "update": {
			int result = DAO.UpdateProduct(products);
			PrintWriter script = response.getWriter();
			if(result == 1) {
				script.println("<script>");
				script.println("alert('상품이 성공적으로 업데이트 되었습니다.')");
				script.println("location.href = 'ProductManeger.jsp'");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('상품 업데이트 오류 발생.')");
				script.println("location.href = 'ProductManeger.jsp'");
				script.println("</script>");
			}
			break;
		}
			}
	%>
</body>
</html>