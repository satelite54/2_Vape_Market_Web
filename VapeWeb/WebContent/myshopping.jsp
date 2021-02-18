<%@page import="DTO.Orders"%>
<%@page import="DAO.dao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cartID = session.getId();
	 String idx = (String)session.getAttribute("id");

	 
	 List<String> list = (List<String>) session.getAttribute("list");
	 if(list == null) {
		 list = new ArrayList<String>();
	 }

	 list.add((String)session.getAttribute("pname"));
	 list.add(request.getParameter("countresult"));
	 list.add((String)session.getAttribute("price"));
	 
	 int listSize = list.size();
	 
	 for(int i = listSize - 1; i >= 0; i--) {
		 if(list.get(i) == null)
			 list.remove(i);
	 }
	 
	 session.setAttribute("list", list);
	 
	 
	 // 장바구니 비우기 관련
	boolean Deleteflag = false;
	String temp = request.getParameter("id");
	
	if(temp == null) {
		temp = "1";
	}
	if(temp.equals("0")) {
		for(int i = list.size() - 1; i >= 0; i--) {
			list.remove(i);
		}
		session.setAttribute("list", list);
	}
	int Deletenumber = 0;
	
	dao DAO = new dao();
	%>

<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">	
<title>JASET VAPE</title>
	<style>
		#pointer {
		   display: block;
		   margin-left: auto;
		   margin-right: auto }
		#cart hr{
			border: 1px solid;
			color:lightgray
		}
		#submenu p{
			font-family: 'Gothic A1', sans-serif;
			font-style: italic;
			color: #223a6b !important;
			font-size: xx-large;
			position:absolute;
			left:0px;
			padding-left: 45px;
		}
		#pointer {
		  width: 200px;
		  height: 40px;
		  position: relative;
		  background: #223a6b;
		}
		#pointer:after {
		  content: "";
		  position: absolute;
		  left: 0;
		  bottom: 0;
		  width: 0;
		  height: 0;
		  border-left: 20px solid white;
		  border-top: 20px solid transparent;
		  border-bottom: 20px solid transparent;
		}
		#pointer:before {
		  content: "";
		  position: absolute;
		  right: -20px;
		  bottom: 0;
		  width: 0;
		  height: 0;
		  border-left: 20px solid #223a6b;
		  border-top: 20px solid transparent;
		  border-bottom: 20px solid transparent;
		}
	</style>
</head>

<body>

<%@ include file="menu.jsp" %>
<%@ include file="submenu.jsp" %>

<br><br><br><br>
<div id="pointer"><p style="color:white; font-size: x-large;">나의 쇼핑</div>
<br><br><br><br>
<div id="submenu"><p>장바구니</div>
<!---------------------------------cart--------------------------------------------------------->
<br><br>
<div class="container">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품목록</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
					<%
						for(int i = 0; i < list.size()/3; i++) {
					%>
					<tr>
					 	<td><%=list.get(0 + i * 3)%></td>
					 	<td><%=list.get(1 + i * 3)%></td>
					 	<td><%=list.get(2 + i * 3)%></td>
					 </tr>
				 	<%}%>
			</table>
		</div>
		
		<div id="cart">
		<hr>
		<p>Total: <%=list.size()/3%>
		</div>
		<div class="row">
			<table width="100%">
				<tr>
					<td align="center"><a href="./myshopping.jsp?id=<%=Deletenumber%>" class="btn btn-danger text-white">카트 비우기</a></td>
					<%
						if(list.size() != 0) {
					%>
					<td align="center"><a onclick="return emtpyCheck();" href="thank.jsp?cartId=<%=cartID%>"  class="btn btn-dark">주문하기 </a></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
<br>
<div id="submenu"><p>주문목록</div>
<br><br><br><br>
<!---------------------------------order---------------------------------------------------------------->
	<div class="container col-8 alert alert-primary text-dark">
		<div class="text-center ">
			<h1>Order</h1>
		</div>
		<div class="row justify-content-between">

		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">주문번호</th>
				<th class="text-center">주문날짜</th>
				<th class="text-center">배송일</th>
			</tr>
		<%
			ArrayList <Orders> Olist = DAO.getOrderList(id);
			for(int  i = 0 ; i < Olist.size();i++){		
		%>
			<tr>
				<td style="text-align:center"><%= Olist.get(i).getCartID() %></td>				
				<td style="text-align:center"><%= Olist.get(i).getOdate() %></td>				
				<td style="text-align:center"><%= Olist.get(i).getLaterDate() %></td>
				<% %>				
			</tr>
			<%} %>
			</table>
						
		</div>
	</div>
	

</body>
<%@ include file="footer.jsp" %>		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>