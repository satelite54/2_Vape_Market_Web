<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.dao"%>
<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.awt.dnd.DropTargetListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="DTO.Board"%>

<html lang="en">
<head>
<title>JASET VAPE</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
request.setCharacterEncoding("UTF-8");
%>	
<%!
Board board = new Board();
dao DAO = new dao();
%>
</head>
<%@ include file="menu.jsp" %>
<%@ include file="submenu.jsp" %>
<body>
<br><br><br><br><br><br>
	<link rel="stylesheet" href="css/custom.css">
		<div class="row">
			<div class="col-md-5">
				<img src="<%=request.getParameter("imgname")%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3>상품명 : <%=request.getParameter("pname")%></h3>
				<h4>제조사 : <%=request.getParameter("manufacturer")%></h4>
				<h4>원산지 : <%=request.getParameter("price")%>원</h4>
				<h4>판매가 : <%=request.getParameter("stock")%></h4>
				<h4>상품코드 : <%=request.getParameter("code")%></h4>

				<%
					String pname = request.getParameter("pname");
					String price = request.getParameter("price");
					String dsadsa = request.getParameter("Detailedimagepath");
					session.setAttribute("pname", pname);
					session.setAttribute("price", price);
				%>

			  <form class="form-inline " action="myshopping.jsp">
			  	<button class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;}" type="submit" value="Submit">장바구니</button>
				<input type="text" name=countresult value=1>
				<input type=button value="증가" onClick="javascript:this.form.countresult.value++;">
				<input type=button value="감소" onClick="javascript:this.form.countresult.value--;">			  	
			  </form>
				</div>
				
				</div>
				<br><br><br><br><br><br>
  <div class="parent">
      <div class="me">
        <p class="child">
        	<body data-spy="scroll" data-target=".navbar" data-offset="50">																
						<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed">  
						  <ul class="navbar-nav">
						    <li class="nav-item">
						      <a class="nav-link" href="#section1">상세정보</a>
						    </li>
						    <li class="nav-item">
						      <a class="nav-link" href="#section2">상품후기</a>
						    </li>
						    <li class="nav-item">
						      <a class="nav-link" href="#section3">Q&A</a>
						    </li>
						 
						  </ul>
						</nav>
		</p>
      </div>
      <div id="section1" class="container-fluid border border-success" style="padding-top:70px;padding-bottom:70px">
					  <h3>상세정보</h3>
					  <div class="imgbox">
						<img src="<%=request.getParameter("Detailedimagepath")%>" style="width: 100%" />
					  </div>
					</div>
					<div id="section2" class="container-fluid border border-warning" style="padding-top:70px;padding-bottom:70px">
					  <h1>상품후기</h1>
					  <div class="container">
		<table class="table border-dark rounded">
			<thead class="thead-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody class="border">
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
					<td><a href="communityenter.jsp?BNum=<%=list.get(i).getBNum() %>"><%= list.get(i).getBTitle()%></a></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getBDate().substring(0,16)%></td>
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
					if(NowPageNumber > (list.size() - 1) / 10 + 1)
						NowPageNumber = (list.size() - 1) / 10 + 1;
					for(int i = 1; i <= (list.size() - 1) / 10 + 1; i++) {
						
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
		<a href="#" onclick="checkForm1(); return false;" class="btn btn-success float-right">글쓰기</a>			
		
					  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					</div>
					<div id="section3" class="container-fluid border border-secondary" style="padding-top:70px;padding-bottom:70px">
					  <h1>Q&A</h1>
					  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					</div>
   				 </div>
				</body>

<%@ include file="footer.jsp"%>
<script type="text/javascript">
	   function checkForm1() {
	      if (${id==null}) {
	         alert("로그인 해주세요.");
	         return false;
	      }
	      location.href = "./communitywrite.jsp?id=${id}"
	   }
	</script>		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>
</html>
