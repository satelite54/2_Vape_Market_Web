<%@page import="DTO.Users"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.Review"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	%>	
	<%!
		Review review = new Review();	
		Dao dao = new Dao();
		
		int RNum = 0;
	%>
		<%
			if(request.getParameter("displayEdit") == null) {
				
			}
		
			if (request.getParameter("RNum") != null){
		 	RNum = Integer.parseInt(request.getParameter("RNum"));
		 	System.out.println(RNum) ;
		 }

/* 		 if (RNum == 0) {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('유효하지 않은 글 입니다.')");
			 script.println("<location.href = 'review.jsp'");
			 script.println("</script>");
		 } */
		Users user = new Users();
		review = dao.getReview(RNum);
		int admin = dao.getadmin((String) session.getAttribute("id"));
	%>
	
	<div class="container  border border-gray rounded">
		<div class="row p-2 font-weight-bold" style="background-color: black; color: white;">
			<div class="col-sm-2">번호</div>
			<div class="col-sm-4">글 제목</div>
			<div class="col-sm-2">작성자</div>
			<div class="col-sm-2">작성일</div>
			<div class="col-sm-2">조회수</div>
		</div>
		<div class="row border boder-dark rounded mt-1">
			<div class="col-sm-2"><%= review.getRNum() %></div>
			<div class="col-sm-4"><%= review.getRTitle() %></div>
			<div class="col-sm-2"><%= review.getId() %></div>
			<div class="col-sm-2"><%= review.getRDate().substring(0,16) %></div>
			<div class="col-sm-2"><%= review.getViews() %></div>
		</div>
			<div class="card-body text-dark border boder-dark rounded mt-3 mb-5">
				<p class="card-text text-left" style="height:350px"><%= review.getRContent() %></p>
 			</div>
 			<div>
		 				<a href="review.jsp" class="btn btn-primary float-right mt-3" style="margin-right:5px;">글목록</a>
		 				<%	String strid = (String) session.getAttribute("id");
		 					if(review.getId().equals(strid) || admin == 1 ) {
		 				%>
	 					<a href="reviewDeleteAction.jsp?RNum=<%= review.getRNum() %>" class="btn btn-danger float-right mt-3" style="margin-right:5px; onclick="return confirm('글을 삭제하시겠습니까?');"">삭제</a>
	 					<a href="reviewUpdate.jsp?RNum=<%=review.getRNum()%>&RTitle=<%=review.getRTitle()%>&RContent=<%=review.getRContent()%>" class="btn btn-warning float-right mt-3" style="margin-right:5px;">수정</a>
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

<script type="text/javascript">
function checkForm() {
   if (${id==null}) {
      alert("로그인 해주세요.");
      return false;
   }
   location.href = "reviewWrite.jsp?id=${id}"
}

</script>
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>