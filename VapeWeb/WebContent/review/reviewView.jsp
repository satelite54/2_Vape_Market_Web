<%@page import="DTO.Users"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.Review"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	%>	
	<%
		Review review = new Review();	
		Dao DAO = new Dao();
		
		int RNum = 0;
	%>
		<%
			if(request.getParameter("displayEdit") == null) {
			}
		
			if (request.getParameter("RNum") != null){
		 	RNum = Integer.parseInt(request.getParameter("RNum"));
		 	System.out.println(RNum) ;
		 	}

			if (RNum == 0) {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('유효하지 않은 글 입니다.')");
			 script.println("<location.href = 'review.jsp'");
			 script.println("</script>");
		 }
		Users user = new Users();
		review = DAO.getReview(RNum);
		int admin = DAO.getadmin((String) session.getAttribute("id"));
	%>
<div class="container">
  <h2 style="color:#223a6b; font-style: italic;">JASET VAPE</h2>
  <p style="color:#223a6b;">소중한 후기 감사합니다!</p>
  <table class="table" style="text-align: center;">
    <thead class="text-light" style="background-color:#223a6b;">
      <tr>
      	<th>번호</th>
      	<th>제목</th>
      	<th>작성자</th>
      	<th>작성일</th>
      	<th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr style="color:#223a6b;">
        <td><%=review.getRNum()%></td>
        <td><%=review.getRTitle()%></td>
        <td><%=review.getId()%></td>
        <td><%=review.getRDate().substring(0,16)%></td>
        <td><%=review.getViews()%></td>
      </tr>      
    </tbody>
  </table>
	<div class="card-body text-dark border boder-dark rounded mt-3 mb-5">
		<p class="card-text text-left" style="height:350px"><%= review.getRContent() %></p>
	</div>
    <div>
	<%	String strid = (String) session.getAttribute("id");
		if(review.getId().equals(strid) || admin == 1 ) {
	%>
		<a href="reviewDeleteAction.jsp?RNum=<%= review.getRNum() %>" class="btn float-right mt-3" style="margin-right:5px; background-color:#223a6b; color:white;" onclick="return confirm('글을 삭제하시겠습니까?');">삭제</a>
		<a href="reviewUpdate.jsp?RNum=<%=review.getRNum()%>&RTitle=<%=review.getRTitle()%>&RContent=<%=review.getRContent()%>" class="btn float-right mt-3" style="margin-right:5px; background-color:#223a6b; color:white;">수정</a>
	<%
	}
	%>
	</div>
</div>		
<script type="text/javascript">
function DeleteForm(){
	if(${id == null}){
		alert("권한이 없습니다.")
		return false;
	}else{
		confirm("정말 삭제하시겠습니까??");
		return true;
	}
}
function checkForm() {
	   if (${id==null}) {
	      alert("로그인 해주세요.");
	      return false;
	   }
	   location.href = "reviewWrite.jsp?id=${id}"
	}
</script>
</body>