<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JASET VAPE</title>

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">	
</head>
<%
/* 	String id = "";
	id = (String)session.getAttribute("id");
	
	if(id == null || id.equals("")) {
		response.sendRedirect("login.jsp");
	} */
%>


<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="submenu.jsp" %>
	<br><br><br><br><br><br>
	<div class="container">
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
					<div class="imgbox">
					   <img src="<%=request.getParameter("Detailedimagepath")%>" style="width: 100%" />
					</div>
	</div>
	<%@ include file="footer.jsp" %>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="css/bootstrap.min.css"></script>
</body>
</html>