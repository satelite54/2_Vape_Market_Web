<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JASET VAPE</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="css/theVapor.css">
<link rel="stylesheet" type="text/css" href="css/theVapordetail.css">
<style type="text/css">
<%
	String Pname = request.getParameter("Pname");
	String Price = request.getParameter("Price");
	session.setAttribute("pname", Pname);
	session.setAttribute("price", Price);
%> #prdDetailContentLazy img[src=""], #prdDetailContentLazy img:not([src])
	{
	visibility: hidden !important;
	height: 1px !important;
}
</style>
<link rel="stylesheet" href="css/custom.css">
</head>
<body id="main">
	<%@ include file="../sub/menu.jsp"%>
	<%@ include file="../sub/submenu.jsp"%>

	<hr class="layout">
	<div id="wrap">
		<div id="container">
			<p id="kvMain"></p>

			<hr class="layout">
			<div id="contents">

				<div
					class="xans-element- xans-product xans-product-headcategory path">
					<h3>현재 위치</h3>
					<ol>
						<li class="first"><a href="main.jsp">홈</a></li>
						<li class=" "><p>${param.producttype}</li>
						<li class="displaynone "><a href="/product/list.html"></a></li>
						<li class="displaynone "><a href="/product/list.html"></a></li>
					</ol>
				</div>
				<div class="xans-element- xans-product xans-product-detail ">
					<!-- 이미지 영역 -->
					<div class="xans-element- xans-product xans-product-image imgArea">
						<div class="keyImg ">
							<a href="#none" alt="P0000JUA"><img
								src="img/${param.Imgname}" alt="" class="BigImage "><span
								id="zoomMouseGiude"
								style="display: block; position: relative; width: 170px; margin: 0px auto;"></span></a>
						</div>
					</div>
					<div class="infoArea">
						<h3>
							${param.Pname} <span> <img
								src="//img.echosting.cafe24.com/design/common/icon_sett04.gif"
								alt="적립금">
							</span>
						</h3>

						<p class="displaynone">() 해외배송 가능</p>


						<div class="xans-element- xans-product xans-product-detaildesign">
							<!--  출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.ount = 10 -->
							<table border="1" summary="">
								<caption>기본 정보</caption>
								<tbody>
									<tr class=" xans-record-">
										<th><span style="font-size: 16px; color: #555555;">상품명</span></th>
										<td><span style="font-size: 16px; color: #555555;">${param.Pname}</span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">제조사</span></th>
										<td><span style="font-size: 12px; color: #555555;">${param.Manufacturer}</span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">원산지</span></th>
										<td><span style="font-size: 12px; color: #555555;">해외
										</span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span
											style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span></th>
										<td><span
											style="font-size: 12px; color: #008BCC; font-weight: bold;"><strong
												id="span_product_price_text">${param.Price}</strong> <input
												id="product_price" name="product_price" value=""
												type="hidden"></span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">상품코드</span></th>
										<td><span style="font-size: 12px; color: #555555;">${param.Code}</span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">결제수단</span></th>
										<td><span style="font-size: 12px; color: #555555;"><span
												id="individual_payment_method">카드 결제, 무통장 입금, 적립금</span></span></td>
									</tr>
								</tbody>
							</table>
						</div>





						<div id="totalProducts" class="">


							<table border="1" summary="">
								<caption>상품 목록</caption>
								<colgroup>
									<col style="width: 284px;">
									<col style="width: 80px;">
									<col style="width: 110px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품명</th>
										<th scope="col">상품수</th>
										<th scope="col">가격</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<td colspan="3">
											<form class="form-inline " action="myshopping.jsp">
												<button
													class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;}"
													type="submit" value="Submit">장바구니</button>
												<input id="productCnt" type="text" name=countresult value=1>
												<input type=button value="증가"
													onClick="javascript:this.form.countresult.value++; javascript:transforValue();">
												<input type=button value="감소"
													onClick="javascript:this.form.countresult.value--; javascript:transforValue();">
											</form> <strong>총 상품금액</strong>(수량) : <span class="total"> <strong><em
													id="count">${param.Price}</em><em>원</em></strong></span>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- //참고 -->
						<script type="text/javascript">
							function transforValue() {
 								var productCnt = document.getElementById("productCnt").value;
 								document.getElementById("count").innerHTML = productCnt * document.getElementById("span_product_price_text").innerHTML;
							}
						</script>

						<div class="xans-element- xans-myshop xans-myshop-benefit">
							<p class="myThumb">
								<img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif"
									alt="일반회원"
									onerror="this.src='http://img.echosting.cafe24.com/design/skin/default/member/img_member_default.gif';">
							</p>
							<div class="myInfo">
								<p class="">
									저희 쇼핑몰을 이용해 주셔서 감사합니다. <br> <strong><span>김태헌</span>
										님</strong>은 [일반회원] 회원이십니다.
								</p>
								<p class="displaynone ">
									<strong> 0원 이상</strong> 구매시 <strong>0원</strong>을 추가할인없음 받으실 수
									있습니다.
								</p>
								<p class="displaynone ">
									<strong> 0원 이상</strong> 구매시 <strong>0원</strong>을 받으실 수 있습니다.
								</p>
							</div>
						</div>

					</div>
				</div>


			</div>
		</div>

		<script type="text/javascript">
	   function checkForm3() {
	      if (${id == null}) {
	    	 alert("로그인 해주세요.");
	    	 location.href ="http://localhost/VapeWeb/login.jsp";
	    	 return false;
	      } else {
	    	 var product = document.getElementsByClassName("xans-record-")
			location.href ="PData?product="+product;
	      }
	   }
	</script>

		<div class="parent">
			<body data-spy="scroll" data-target=".navbar" data-offset="50">
				<div class="me">
					<p class="child">
						<nav id="mynav"
							class="navbar navbar-expand-sm bg-dark navbar-dark fixed py-2">
							<ul class="navbar-nav">
								<li class="nav-item">
									<h2>
										<a class="nav-link px-5" href="#section1">상세정보</a>
									</h2>

								</li>
								<li class="nav-item">
									<h2>
										<a class="nav-link px-5" href="#section2">상품후기</a>
									</h2>
								</li>
								<li class="nav-item">
									<h2>
										<a class="nav-link px-5" href="#section3">Q&A</a>
									</h2>
								</li>
							</ul>
						</nav>
					</p>
				</div>

				<!-- 			<div id="section1" class="container-fluid" style="padding-top:70px;padding-bottom:70px">
			</div> -->
				<div id="section1" class="container-fluid"
					style="padding-top: 70px; padding-bottom: 70px">
					<p style="text-align: center;">
						<img style="width: 100%;" src="img/${param.DetailImgName}"
							alt="${param.DetailImgName}">
					</p>
				</div>
				<div id="section2" class="container-fluid"
					style="padding-top: 70px; padding-bottom: 70px">
					<h1 style="">상품후기</h1>
					<%@ include file="../review/review.jsp"%>
				</div>

				<div id="section3" class="container-fluid center"
					style="padding-top: 70px; padding-bottom: 70px">
					<h1 style="">Q&A</h1>
					<%@ include file="question/list.jsp"%>
				</div>
			</body>
		</div>
		<%@ include file="../sub/footer.jsp"%>
</body>
</html>