<%@page import="java.awt.dnd.DropTargetListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<%@ page import="DTO.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>

<%!
Board board = new Board();
dao DAO = new dao();
%>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>
	<script type="text/javascript">

</script>


	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody style="border:solid 2px;">
				<%
				
							ArrayList<Board> list = DAO.getList();
							String cnl = request.getParameter("cnl");
							if(cnl == null) {
								cnl = "1";
							}
							// !(CntIndex > (pageSelectectedIndex * 15 - 15) && CntIndex <= pageSelectectedIndex * 15)
							int NowPageNumber = Integer.parseInt(cnl);
							
							for (int i = 0; i < list.size(); i++) {
  								if((i <= (NowPageNumber * 10 - 10) - 1 || i > NowPageNumber * 10 - 1))
									continue;
						%>
				<tr>
					<td><%=list.get(i).getBNum()%></td>
					<td><a href="communityenter.jsp?BNum="<%=list.get(i).getBNum()%>><%= list.get(i).getBTitle()%></a></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getBDate().substring(0, 11) + list.get(i).getBDate().substring(11, 13) + "시"
							+ list.get(i).getBDate().substring(14, 16) + "분"%></td>
							<td><%= list.get(i).getViews()%></td>
				</tr>
				<%
							}
						%>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination" style="justify-content: center;">
				<%
					int PreviousPageNumber = NowPageNumber - 1; 
					if(PreviousPageNumber < 1) {
						PreviousPageNumber = 1;
					}
				%>
				<li class="page-item"><a class="page-link" href="community.jsp?cnl=<%=PreviousPageNumber%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
					
					NowPageNumber++;
					if(NowPageNumber > list.size() / 10 + 1)
						NowPageNumber = list.size() / 10 + 1;
					for(int i = 1; i <= list.size() / 10 + 1; i++) {
						
				%>
				<li class="page-item"><a class="page-link" href="community.jsp?cnl=<%=i%>"><%=i%></a></li>				
				<%
					}
				%>
				<li class="page-item"><a class="page-link" href="community.jsp?cnl=<%=NowPageNumber%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<a href="communitywrite.jsp" class="btn btn-success float-right">글쓰기</a>
	</div>


	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>