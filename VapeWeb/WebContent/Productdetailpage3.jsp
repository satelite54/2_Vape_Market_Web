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


<html>
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

</head>
<%@ include file="menu.jsp" %>
<%@ include file="submenu.jsp" %>
<br><br><br><br><br><br>
<body>
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
						<h1>상세정보</h1>
						<div class="imgbox">
							<img src="<%=request.getParameter("Detailedimagepath")%>" style="width: 100%" />
						</div>
					</div>
					
					<div id="section2" class="container-fluid border border-warning" style="padding-top:70px;padding-bottom:70px">
						<h1>상품후기</h1>
						<%@ include file="review.jsp" %>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					</div>
					
					<div id="section3" class="container-fluid border border-secondary" style="padding-top:70px;padding-bottom:70px">
						<h1>Q&A</h1>
						<%@ include file="question/list2.jsp"%>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
					</div>
					
   				 </div>
				</body>
<div align=center>
<%@ include file="footer.jsp"%>
</div>

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>
</html>
