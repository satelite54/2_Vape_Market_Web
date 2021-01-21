<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>



<%
	request.setCharacterEncoding("utf-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_shippingDate = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
		}
	}
	
	session.setAttribute("countresult", request.getAttribute("countresult"));
	session.getAttribute("countresult");
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


<br><br><br><br>
<div id="pointer"><p style="color:white; font-size: x-large;">나의 쇼핑</div>

<br><br><br><br>
<div id="submenu"><p>장바구니</div>
<!---------------------------------cart---------------------------------------------------------------  -->
<br><br>
<div class="container">
		
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품목록</th>
					
					<th>수량</th><!-- 기본 수업내용에서는 #으로 저장되는 내용 파일 불러올때 잘 지켜 볼 것 -->
					<th>가격</th>
					
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
					
			</table>
			
			
		</div>
		
		<div id="cart">
		
		<hr>
		<th>Total: 	<p id="sum"><%-- <%=sum%> --%> </th>
		</div>
		<div class="row">
			<table width="100%">
				<tr>
					<td align="center"><a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn border border-danger bg-white text-danger">선택삭제</a></td><!-- 지금 코드는 카드 비워버리기 코 -->
					<td align="center"><a onclick="return emtpyCheck();" href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-danger text-white">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>


<br>
<div id="submenu"><p>주문목록</div>
<br><br><br><br>
<!---------------------------------order---------------------------------------------------------------  -->
	<div class="container col-8 alert alert-primary text-dark">
		<div class="text-center ">
			<h1>Order</h1>
		</div>
		<div class="row justify-content-between">
			
			<%-- <div class="col-4 text-#212529" align="right">
				<p>	<em>배송일: <% out.println(shipping_shippingDate);%></em>
			</div> --%><!--배송일 출력깞 소스 확인 후 아래 배송일에 적용 후 삭제해야 함  -->
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">주문번호</th>
				<th class="text-center">주문날짜</th>
				<th class="text-center">배송일: <% out.println(shipping_shippingDate);%></th>
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
				<%-- <td class="text-center text-danger"><strong><%=sum%> </strong></td> --%>
			</tr>
			</table>
						
		</div>
	</div>	
</body>
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>