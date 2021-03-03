<%@page import="java.util.stream.Stream"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Arrays"%>
<%@page import="etc.*"%>
<%@page import="DTO.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Dao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="DAO.Dao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*"%>
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
	<%@ include file="../sub/menu.jsp"%>
	<%@ include file="../sub/submenu.jsp"%>

	<%! public void CollectNull(String strSearch, String strPage
			, String NowPageNum) {
			if(strSearch == null)
				strSearch = "";
			if(strPage == null)
				strPage = "1";
			if(NowPageNum == null)
				NowPageNum = "1";
		}
		%>
	<%
		List<Products> products = (List<Products>) session.getAttribute("products");
		int ntotalProductsCnt = products.size();
		String strProducttype = request.getParameter("Producttype");
		String strSortmethod = request.getParameter("Sortmethod");
		String strSearch = request.getParameter("Search");
		String strPage = request.getParameter("Page");
		String NowPageNum = request.getParameter("NowPageNum");
		CollectNull(strSearch, strPage, NowPageNum);
		int ListSize = products.size();
		if(NowPageNum.equals("1")) {
			if(products.size() > 10)
				products = products.subList(0, 10);
		} else {
			int nNowPageNum = Integer.parseInt(NowPageNum);
			int FirstIdx = 10 * (nNowPageNum - 1);
			products = products.subList(FirstIdx, ListSize);
		}

	%>
	<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-product xans-product-menupackage ">
				<div class="xans-element- xans-product xans-product-headcategory path "><h3>현재 위치</h3>
					<ol>
						<li class="first"><a href="main.jsp" style="color: black; text-decoration: none; font-size: 20px;">home</a></li>
	 		            <li class=""><a href="#" style="color: black; text-decoration: none; font-size: 20px;" onclick="javascript:checkForm('<%=strProducttype%>', '1', '<%=strSearch%>', '<%=strPage%>', '<%=NowPageNum%>')"><%=strProducttype%></a></li>
	 			        <li class="displaynone"><a href="/product/list.html"></a></li>
	           		    <li class="displaynone"><strong><a href="/product/list.html"></a></strong></li>
	      		    </ol>
				</div>
			</div>
			<div class="xans-element- xans-product xans-product-normalpackage ">
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
						<li><a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '1', '<%=strSearch%>', '<%=strPage%>', '<%=NowPageNum%>')">낮은가격</a></li>
						<li><a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '2', '<%=strSearch%>', '<%=strPage%>', '<%=NowPageNum%>')">높은가격</a></li>
						<li><a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '3', '<%=strSearch%>', '<%=strPage%>', '<%=NowPageNum%>')">신상품</a></li>
					</ul>
					<p class="prdCount">
						등록 제품 : <strong><%=ntotalProductsCnt%></strong> 개
					</p>
				</div>
				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-listnormal">
						<ul class="prdList column5">
							<%
								for (int i = 0; i < products.size(); i++) {
									String Imgname = products.get(i).getImgname();
									String Detailedimagepath = products.get(i).getDetailedimagepath();
									String Code = products.get(i).getCode();
									String Manufacturer = products.get(i).getManufacturer();
									String Pname = products.get(i).getPname();
									String producttype = products.get(i).getProducttype();
									String Adddate = products.get(i).getAdddate().toString();
									String Price = String.valueOf(products.get(i).getPrice());
							%>
							<li id="anchorBoxId_2379" class="item xans-record-">
								<div class="box">
									<a href="Productdetailpage.jsp?Imgname=<%=Imgname%>
									&DetailImgName=<%=Detailedimagepath%>&Code=<%=Code%>
									&Manufacturer=<%=Manufacturer%>&Pname=<%=Pname%>
									&producttype=<%=producttype%>&Price=<%=Price%>" name="anchorBoxName_2379"><img
										src="img/<%=Imgname%>" alt=""
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
							<%
								}
							%>
						</ul>
					</div>
				</div>
				<div class="xans-element- xans-product xans-product-normalpaging">
					<p>
						<a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=1%>')"><img
							src="//img.echosting.cafe24.com/design/skin/fashion013/btn_page_first.gif"
							alt="첫 페이지"></a>
					</p>
					<p><%int PreviousPageNum = Integer.parseInt(NowPageNum);
						PreviousPageNum--;
						if(PreviousPageNum == 0)
							PreviousPageNum = 1;
					%>
						<a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=PreviousPageNum%>')"><img
							src="//img.echosting.cafe24.com/design/skin/fashion013/btn_page_prev.gif"
							alt="이전 페이지"></a>
					</p>
					<ol>
						<%
							int finalPageNum = ntotalProductsCnt / 10 + 1;
						for(int i = 1; i <= finalPageNum; i++) {

							if(i == Integer.parseInt(NowPageNum)){

						%>
						<li class="xans-record-"><strong><a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=i%>')"
							class="this"><%=i%></a></strong></li>
						<%	} else {
							%>
							<li class="xans-record-"><a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=i%>')"
								class="this"><%=i%></a></li>
							<%
							}
						}
						%>
					</ol>
					<p><%int NextPageNum = Integer.parseInt(NowPageNum);
							NextPageNum++;
							if(NextPageNum > finalPageNum)
								NextPageNum = finalPageNum;
					%>
						<a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=NextPageNum%>')"><img
							src="//img.echosting.cafe24.com/design/skin/fashion013/btn_page_next.gif"
							alt="다음 페이지"></a>
					</p>
					<p>
						<a href="#" onclick="javascript:checkForm('<%=strProducttype%>', '<%=strSortmethod%>', '<%=strSearch%>', '<%=strPage%>', '<%=finalPageNum%>')"><img
							src="//img.echosting.cafe24.com/design/skin/fashion013/btn_page_last.gif"
							alt="마지막 페이지"></a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../sub/footer.jsp"%>
</body>
</html>