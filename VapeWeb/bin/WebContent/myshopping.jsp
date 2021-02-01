<<<<<<< HEAD
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>


=======
<%@page import="DTO.Orders"%>
<%@page import="sun.security.mscapi.CKeyPairGenerator.RSA"%>
<%@page import="DAO.dao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
	String cartID = session.getId();

	 List<String> list = (List<String>) session.getAttribute("list");
	 if(list == null) {
		 list = new ArrayList<String>();
	 }
	 list.add((String)session.getAttribute("pname"));
	 list.add(request.getParameter("countresult"));
	 list.add((String)session.getAttribute("price"));
	
	 session.setAttribute("list", list);
	 
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
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1

<html>

<head>
<<<<<<< HEAD
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">	
	<title>JASET VAPE</title>
	
=======
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
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
</head>

<body>

<%@ include file="menu.jsp" %>

<<<<<<< HEAD

<style>
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
<br>
<br>
<div id="pointer"><p style="color:white; font-size: x-large;">나의 쇼핑</div>

<br>
<br>
<br>
<br>
<div id="submenu"><p>장바구니</div>
<!---------------------------------cart---------------------------------------------------------------  -->
<br>
<br>
<div class="container">
		
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>Item</th>
					<th>Price</th>
					<th>#</th>
					<th>Sub total</th>
					<th>Info</th>
				</tr>
				<%-- <%				
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();

					for (int i = 0; i < cartList.size(); i++) { // ?ê³¹ë­¹ç±Ñëª???ìêµ¹??ç°ìì °?ìë¦°
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=product.getPname()%></td>
					<td><%=product.getUnitPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">Delete</a></td>
				</tr>
				<%
					}
				%> --%>
				<tr>
					<th></th>
					<th></th>
					<th>Total</th>
				<%-- 	<th id="sum"><%=sum%></th> --%>
					<th></th>
				</tr> 
			</table>
			
=======
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
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
		</div>
		
		<div id="cart">
		<hr>
<<<<<<< HEAD
=======
		<p>Total: <%=list.size()/3%>
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
		</div>
		<div class="row">
			<table width="100%">
				<tr>
<<<<<<< HEAD
					<td align="center"><a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn border border-danger bg-white text-danger">선택삭제</a></td>
					<td align="center"><a onclick="return emtpyCheck();" href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-danger text-white">주문하기</a></td>
=======
					<td align="center"><a href="./myshopping.jsp?id=<%=Deletenumber%>" class="btn btn-danger text-white">카트 비우기</a></td>
					<%
						if(list.size() != 0) {
					%>
					<td align="center"><a onclick="return emtpyCheck();" href="thank.jsp?cartId=<%=cartID%>"  class="btn btn-dark">주문하기 </a></td>
					<%
						}
					%>
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
				</tr>
			</table>
		</div>
	</div>
<<<<<<< HEAD





<br>
<div id="submenu"><p>주문목록</div>
<br>
<br>
<br>
<br>
<!---------------------------------order---------------------------------------------------------------  -->
=======
<br>
<div id="submenu"><p>주문목록</div>
<br><br><br><br>
<!---------------------------------order---------------------------------------------------------------->
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
	<div class="container col-8 alert alert-primary text-dark">
		<div class="text-center ">
			<h1>Order</h1>
		</div>
		<div class="row justify-content-between">
<<<<<<< HEAD
			<div class="col-4" align="left">
				<strong>Delivery information</strong> <br> Name : <% out.println(shipping_name); %>	<br> 
				Zip code : <% 	out.println(shipping_zipCode);%><br> 
				Address : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4 text-#212529" align="right">
				<p>	<em>Shipping date: <% out.println(shipping_shippingDate);%></em>
			</div>
=======

>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
<<<<<<< HEAD
				<th class="text-center text-primary">Item</th>
				<th class="text-center">#</th>
				<th class="text-center">Price</th>
				<th class="text-center">Sub total</th>
			</tr>
<%-- 			<%
				int sum = 0; 
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center">$<%=product.getUnitPrice()%></td>
				<td class="text-center">$<%=total%></td>
			</tr>
			<%
				}
			%> --%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>Total: </strong></td>
				<%-- <td class="text-center text-danger"><strong><%=sum%> </strong></td> --%>
			</tr>
			</table>
			
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> Back </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> Confirm </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> Cancel </a>			
		</div>
	</div>	
</body>





							
=======
				<th class="text-center">주문번호</th>
				<th class="text-center">주문날짜</th>
				<th class="text-center">배송일</th>
			</tr>
		<%
			String id = "Ahyoung";
			ArrayList <Orders> Olist = DAO.getOrderList(id);
			for(int  i = 0 ; i < Olist.size();i++){		
		%>
			<tr>
				<td><%= Olist.get(i).getCartID() %></td>				
				<td><%= Olist.get(i).getOdate() %></td>				
				<td><%= Olist.get(i).getLaterDate() %></td>
				<% %>				
			</tr>
			<%} %>
			</table>
						
		</div>
	</div>	
</body>
>>>>>>> 0febfd583a3dbb7f8ae27973123d371c816988e1
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>