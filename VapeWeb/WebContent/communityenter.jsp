<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.Board"%>
<%@page import="DAO.dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>

	<%!
		Board board = new Board();	
		dao DAO = new dao();
		
		int BNum = 0;
	%>
		<%
			if (request.getParameter("BNum") != null){
		 	BNum = Integer.parseInt(request.getParameter("BNum"));
		 	System.out.println(BNum) ;
		 }

		 if (BNum == 0) {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('유효하지 않은 글 입니다.')");
			 script.println("<location.href = 'community.jsp'");
			 script.println("</script>");
		 }
		board = DAO.getBoard(BNum);
	%>
	
	<div class="container  border border-dark rounded">
		<div class="row p-2 font-weight-bold"
			style="background-color: black; color: white;">
			<div class="col-sm-2">번호</div>
			<div class="col-sm-4">글 제목</div>
			<div class="col-sm-2">작성자</div>
			<div class="col-sm-2">작성일</div>
			<div class="col-sm-2">조회수</div>
		</div>
		<div class="row border border-dark">
			<div class="col-sm-2"><%= board.getBNum() %></div>
			<div class="col-sm-4"><%= board.getBTitle() %></div>
			<div class="col-sm-2"><%= board.getId() %></div>
			<div class="col-sm-2"><%= board.getBDate() %></div>
			<div class="col-sm-2"><%= board.getViews() %></div>
		</div>
			<div class="card-body text-dark">
				<p class="card-text"><%= board.getBContent() %></p>
 			</div>
 			<a href="community.jsp" class="btn btn-primary float-right mt-3">목록</a>
 			<a href="communityDeleteAction.jsp?BNum=<%= board.getBNum() %>" class="btn btn-primary float-right mt-3">삭제</a>
 			<a href="communityUpdate.jsp?BNum=<%=board.getBNum()%>&BTitle=<%=board.getBTitle()%>&BContent=<%=board.getBContent()%>" class="btn btn-primary float-right mt-3">수정</a>
		</div>
		





	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>