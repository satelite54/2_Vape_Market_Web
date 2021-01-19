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



<html>

<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">	
	<title>JASET VAPE</title>
	
</head>

<body>

<%@ include file="menu.jsp" %>


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
			
		</div>
		
		<div id="cart">
		<hr>
		</div>
		<div class="row">
			<table width="100%">
				<tr>
					<td align="center"><a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn border border-danger bg-white text-danger">선택삭제</a></td>
					<td align="center"><a onclick="return emtpyCheck();" href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-danger text-white">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>





<br>
<div id="submenu"><p>주문목록</div>
<br>
<br>
<br>
<br>
<!---------------------------------order---------------------------------------------------------------  -->
	<div class="container col-8 alert alert-primary text-dark">
		<div class="text-center ">
			<h1>Order</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>Delivery information</strong> <br> Name : <% out.println(shipping_name); %>	<br> 
				Zip code : <% 	out.println(shipping_zipCode);%><br> 
				Address : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4 text-#212529" align="right">
				<p>	<em>Shipping date: <% out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
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





							
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>