<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<jsp:include page="../sub/menu.jsp" flush="true"/>
<jsp:include page="../sub/submenu.jsp" flush="true"/>

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
					<c:forEach var="product" items="${sessionScope.list}" varStatus="vs">
					<tr>
						<td>${product[0 + vs.count * 3]}</td>
						<td>${product[1 + vs.count * 3]}</td>
						<td>${product[2 + vs.count * 3]}</td>
					 </tr>
					</c:forEach>
			</table>
		</div>

		<div id="cart">
		<hr>
		<p>Total: ${fn:length(sessionScope.list)/3}
		</div>
		<div class="row">
			<table width="100%">
				<tr>
					<td align="center"><a href="./myshopping.do?id=${requestScope.Deletenumber}" class="btn btn-danger text-white">카트 비우기</a></td>

					<c:if test="${fn:length(sessionScope.list) != 0}">
						<td align="center"><a onclick="return emtpyCheck();" href="thank.do?cartId=${CartID}"  class="btn btn-dark">주문하기 </a></td>
					</c:if>
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

			<c:forEach var="Order" items="${requestScope.Olist}">
				<td style="text-align:center">${Order.cartID}</td>
				<td style="text-align:center">${Order.Odate}%></td>
				<td style="text-align:center">${Order.LaterDate}</td>
			</c:forEach>
			</table>

		</div>
	</div>


</body>
<jsp:include page="../sub/footer.jsp" flush="true"/>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>