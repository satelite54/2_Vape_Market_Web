<%@page import="DTO.Users"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.Board"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<jsp:include page="../sub/menu.jsp" flush="true" />
<jsp:include page="../sub/submenu.jsp" flush="true" />
<title>JASET VAPE</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	%>	
	<%!Board board = new Board();	
		Dao DAO = new Dao();
		
		int BNum = 0;%>
		<%
			if(request.getParameter("displayEdit") == null) {
				
			}
		
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
		Users user = new Users();
		board = DAO.getBoard(BNum);
		int admin = DAO.getadmin((String) session.getAttribute("id"));
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
			<div class="col-sm-2"><%= board.getBNum() %></div>
			<div class="col-sm-4"><%= board.getBTitle() %></div>
			<div class="col-sm-2"><%= board.getId() %></div>
			<div class="col-sm-2"><%= board.getBDate().substring(0,16) %></div>
			<div class="col-sm-2"><%= board.getViews() %></div>
		</div>
			<div class="card-body text-dark border boder-dark rounded mt-3 mb-5">
				<p class="card-text text-left" style="height:350px"><%= board.getBContent() %></p>
 			</div>
 			<div>
		 				<a href="community.jsp" class="btn btn-primary float-right mt-3" style="margin-right:5px;">글목록</a>
		 				<%	String strid = (String) session.getAttribute("id");
		 					if(board.getId().equals(strid) || admin == 1 ) {
		 				%>
	 					<a href="communityDeleteAction.jsp?BNum=<%= board.getBNum() %>" class="btn btn-danger float-right mt-3" style="margin-right:5px; onclick="return confirm('글을 삭제하시겠습니까?');"">삭제</a>
	 					<a href="communityUpdate.jsp?BNum=<%=board.getBNum()%>&BTitle=<%=board.getBTitle()%>&BContent=<%=board.getBContent()%>" class="btn btn-warning float-right mt-3" style="margin-right:5px;">수정</a>
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
   location.href = "./communitywrite.jsp?id=${id}"
}

</script>




	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<jsp:include page="footer.do" flush="true"/>
</body>
</html>