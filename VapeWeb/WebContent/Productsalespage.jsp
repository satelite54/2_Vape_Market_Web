<%@page import="java.net.URL"%>
<%@page import="java.util.Arrays"%>
<%@page import="etc.*"%>
<%@page import="DTO.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.dao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="DAO.dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*"%>
<%
	String idx = (String) session.getAttribute("id");
	String sqlQuery = request.getParameter("sqlQuery");
	Map<String, String[]> hashParameterMap = request.getParameterMap();

	String pageSelectedIndexstr = request.getParameter("pageSelectedIndx");
	int pageSelectectedIndex;
	if (pageSelectedIndexstr != null) {
		pageSelectectedIndex = Integer.parseInt(pageSelectedIndexstr);
	} else {
		pageSelectectedIndex = 1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JASET VAPE</title>
<style>
header {
	border: 1px solid black;
	width: 90%;
	/* 전체 브라우저에 80% 사용하겠다. */
	margin-right: auto;
	margin-left: auto;
	margin-top: 30px;
	margin-bottom: 50px;
	background-color: #ffffff;
	padding: 10px;
	overflow: hidden;
	/* 넘치는 부분은 안보이게 하겠다. */
}

.col-md-3 {
	padding: 30px;
	text-align: center;
}

.orderbyContainer a:hover {
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="css/theVapor.css">
</head>

<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>

	<%
		List<Products> products = (List<Products>)session.getAttribute("products");
	%>
	<div id="wrap"></div>
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-product xans-product-normalmenu ">
				<div class="title" id="Product_ListMenu"></div>
				<fieldset class="displaynone">
					<legend>조건별 검색</legend>
					<p>
						<select
							class="xans-element- xans-product xans-product-firstselect FirstSelect"><option
								value="">-조건선택-</option>
							<option value="" class=""></option>
						</select> <select
							class="xans-element- xans-product xans-product-secondselect SecondSelect"><option
								value="">-조건선택-</option>
							<option value="" class=""></option>
						</select> <a href="#SelectSearch" class="SelectSearch"><img
							src="http://img.echosting.cafe24.com/design/skin/default/product/btn_list_search.gif"
							alt="검색"></a>
					</p>
				</fieldset>
				<p class="compare displaynone">
					<a href="#none" onclick="EC_ListAction.setProductCompare();"><img
						src="http://img.echosting.cafe24.com/design/skin/default/product/btn_compare.gif"
						alt="상품비교"></a>
				</p>
				<ul id="type">
					<li><a href="">낮은가격</a></li>
					<li><a href="">높은가격</a></li>
					<li><a href="">상품명</a></li>
					<li><a href="">제조사</a></li>
					<li><a href="">신상품</a></li>
					<li><a href="">인기상품</a></li>
				</ul>
				<p class="prdCount">
					등록 제품 : <strong>1468</strong> 개
				</p>
			</div>
			<div class="xans-element- xans-product xans-product-normalpackage ">
				<div class="xans-element- xans-product xans-product-listnormal">
					<ul class="prdList column5">
						<%
							for (int i = 0; i < products.size(); i++) {
						%>
						<li id="anchorBoxId_2379" class="item xans-record-">
							<div class="box">
								<a href="  " name="anchorBoxName_2379"><img
									src="img/<%=products.get(i).getImgname()%>" alt=""
									class="thumb"></a>
								<p class="name">
									<a
										href="/product/detail.html?product_no=2379&amp;cate_no=37&amp;display_group=1"
										class=""> <strong class="title displaynone"><span
											style="font-size: 12px; color: #555555;">상품명</span> :</strong> <span
										style="font-size: 12px; color: #555555;"><%=products.get(i).getPname()%></span><br>
									</a>
								</p>
								<ul class="xans-element- xans-product xans-product-listitem">
									<li class=" xans-record-"><strong
										class="title displaynone"><span
											style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span>
											:</strong> <span
										style="font-size: 12px; color: #008BCC; font-weight: bold;"><%=products.get(i).getPrice()%>
									</span> <span id="span_product_tax_type_text" style=""> </span></li>
									<li class=" xans-record-"><strong
										class="title displaynone"><span
											style="font-size: 12px; color: #555555;">적립금</span> :</strong> <span
										style="font-size: 12px; color: #555555;"><span
											id="span_mileage_text"><img
												src="//img.echosting.cafe24.com/design/common/icon_cash.gif"
												alt="적립금" style="margin-bottom: 2px;"> 10원</span></span></li>
								</ul>
							</div>
						</li>
						<%}%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>