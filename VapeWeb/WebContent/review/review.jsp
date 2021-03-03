<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.awt.dnd.DropTargetListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page pageEncoding="utf-8" %>
<%@ page import="DAO.Dao"%>
<%@ page import="DTO.Review"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>JASET VAPE</title>

<%
	Review review = new Review();
	Dao dao = new Dao();
%>

</head>
	<%
	request.setCharacterEncoding("UTF-8");
	%>	
<body>

	
<script type="text/javascript">
	function reviewDisplay() {
		var e = document.getElementById("reviewDiv");
		if(e.style.display=='none')
			e.style.display='block';
		else
			e.style.display='none';
	}
</script>

	<div class="container">
		<table class="table">
			<thead class="text-light" style="background-color:#223a6b;">
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">글 제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody class="border">
				<%
				
					ArrayList<Review> list = dao.getReviewList();
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
					<td><%=list.get(i).getRNum()%></td>
					<td><a href="review/reviewView.jsp?RNum=<%=list.get(i).getRNum() %>" target="popup"onclick="window.open('review/reviewView.jsp?RNum=<%=list.get(i).getRNum() %>','popup','width=600,height=600'); return false;"><%= list.get(i).getRTitle()%></a></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getRDate().substring(0,16)%></td>
					<td><%=list.get(i).getViews()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination" style="justify-content: center;">
				<%
					int PreviousPageNumber = NowPageNumber - 1; 
					if(PreviousPageNumber < 1) {
						PreviousPageNumber = 1;
					}
				%>
				<li class="page-item"><a class="page-link" href="review/review.jsp?cnl=<%=PreviousPageNumber%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
					NowPageNumber++;
					if(NowPageNumber > (list.size() - 1) / 10 + 1)
						NowPageNumber = (list.size() - 1) / 10 + 1;
					for(int i = 1; i <= (list.size() - 1) / 10 + 1; i++) {
						
				%>
				<li class="page-item"><a class="page-link" href="review/review.jsp?cnl=<%=i%>"><%=i%></a></li>				
				<%
					}
				%>
				<li class="page-item"><a class="page-link" href="review/review.jsp?cnl=<%=NowPageNumber%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<a href="javascript:reviewDisplay()" class="btn btn-dark float-right">글쓰기</a>			
<br><br><br>

<div id="reviewDiv" align="center" style="display: none;">
<%@ include file="reviewWrite.jsp" %>
</div>

<script type="text/javascript">
   function checkForm1() {
      if (${id==null}) {
         alert("로그인 해주세요.");
         return false;
      }
      location.href = "review/reviewWrite.jsp?id=${id}"
   }
</script>
<script src="css/bootstrap.min.css"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>