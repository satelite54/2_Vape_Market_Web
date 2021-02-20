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
#prdDetailContentLazy img[src=""], #prdDetailContentLazy img:not([src])
	{
	visibility: hidden !important;
	height: 1px !important;
}
</style>
</head>
<%
	String Pname = request.getParameter("Pname");
String DetailImgName = request.getParameter("DetailImgName");
String Code = request.getParameter("Code");
String Manufacturer = request.getParameter("Manufacturer");
String Imgname = request.getParameter("Imgname");
String producttype = request.getParameter("producttype");
String Price = request.getParameter("Price");
%>


<body id="main">
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>
	<script type="text/javascript">
			
	</script>
	
	<hr class="layout">
	<div id="wrap">
		<div id="container">
			<p id="kvMain"></p>

			<hr class="layout">
			<div id="contents">

				<!-- 상단 제품 정보  -->
				<!--
$category_page = /product/list.html
$project_page = /product/project.html
$jointbuy_page = /product/jointbuy.html
-->
				<div
					class="xans-element- xans-product xans-product-headcategory path">
					<h3>현재 위치</h3>
					<ol>
						<li class="first"><a href="/">홈</a></li>
						<li class=" "><a href="/product/list.html?cate_no=12">CSV</a></li>
						<li class="displaynone "><a href="/product/list.html"></a></li>
						<li class="displaynone "><a href="/product/list.html"></a></li>
					</ol>
				</div>



				<!-- 상단 제품 정보  -->
				<div class="xans-element- xans-product xans-product-detail ">
					<!-- 이미지 영역 -->
					<div class="xans-element- xans-product xans-product-image imgArea">
						<div class="keyImg ">
							<a href="#none" alt="P0000JUA"><img src="img/<%=Imgname%>"
								alt="" class="BigImage "><span id="zoomMouseGiude"
								style="display: block; position: relative; width: 170px; margin: 0px auto;"></span></a>
						</div>
					</div>
					<!-- //이미지 영역 -->
					<!-- 상세정보 내역 -->
					<div class="infoArea">
						<h3>
							<%=Pname%>
							<span> <img
								src="//img.echosting.cafe24.com/design/common/icon_sett04.gif"
								alt="적립금">
							</span>
						</h3>

						<p class="displaynone">() 해외배송 가능</p>

						<div class="xans-element- xans-product xans-product-detaildesign">
							<!--
            출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
            count = 10
            -->
							<table border="1" summary="">
								<caption>기본 정보</caption>
								<tbody>
									<tr class=" xans-record-">
										<th><span style="font-size: 16px; color: #555555;">상품명</span></th>
										<td><span style="font-size: 16px; color: #555555;"><%=Pname%></span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">제조사</span></th>
										<td><span style="font-size: 12px; color: #555555;"><%=Manufacturer%></span></td>
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
												id="span_product_price_text"><%=Price%></strong>
												<input id="product_price" name="product_price" value=""
												type="hidden"></span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">상품코드</span></th>
										<td><span style="font-size: 12px; color: #555555;"><%=Code%></span></td>
									</tr>
									<tr class=" xans-record-">
										<th><span style="font-size: 12px; color: #555555;">결제수단</span></th>
										<td><span style="font-size: 12px; color: #555555;"><span
												id="individual_payment_method">카드 결제, 무통장 입금, 적립금</span></span></td>
									</tr>
								</tbody>
							</table>
						</div>



						<p class="displaynone">
							<img
								src="http://img.echosting.cafe24.com/design/skin/default/product/txt_naver.gif"
								alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다."> &nbsp;
						</p>



						<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
						<!-- //참고 -->

						<!-- <div id="zoom_wrap"></div>  -->




						<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
						<!-- //참고 -->

						<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
						<!-- //참고 -->

						<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
						<div id="totalProducts" class="">

							<p class="info displaynone">
								<img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/ico_information.gif"
									alt=""> 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.
							</p>
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

								<!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.-->
								<tbody>
									<!-- tr>
                            <td>
                                <p class="product">
                                    $상품명<br />
                                    <span>$옵션</span>
                                </p>
                            </td>
                            <td>
                                <span class="quantity">
                                    <input type="text" class="quantity_opt" />
                                    &nbsp;<a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" class="up" /></a>
                                    <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" class="down" /></a>
                                </span>
                                <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                            </td>
                            <td class="right">
                                <span>$가격</span>
                                <span class="mileage">(<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                            </td>
                        </tr -->
								</tbody>
								<!-- //참고 -->
								<tfoot>
									<tr>
										<td colspan="3">
											<form class="form-inline " action="myshopping.jsp">
												<button
													class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;}"
													type="submit" value="Submit">장바구니</button>
												<input id="productCnt" type="text" name=countresult value=1>
												<input type=button value="증가" onClick="javascript:this.form.countresult.value++; javascript:transforValue();">
												<input type=button value="감소"
													onClick="javascript:this.form.countresult.value--; javascript:transforValue();">
											</form> 
											<strong>총 상품금액</strong>(수량) : <span class="total">
											<strong><em id="count"></em><em>원</em></strong></span>
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
						<!-- 네이트 C Log (공감하기 버튼) -->
						<!-- //네이트 C Log (공감하기 버튼) -->

						<div class="xans-element- xans-product xans-product-action ">
							<a href="/"><img
								src="//img.echosting.cafe24.com/design/skin/fashion013/btn_shopping.gif"
								alt="쇼핑 계속하기"></a> <a href=""
								onclick="checkForm3(); return false;"
								class=""><img
								src="//img.echosting.cafe24.com/design/skin/fashion013/btn_cart.gif"
								alt="바로 구매하기"></a>
							<!-- 네이버 체크아웃 구매 버튼  -->
							<div id="NaverChk_Button"></div>
							<!-- //네이버 체크아웃 구매 버튼  -->
						</div>

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
					<!-- //상세정보 내역 -->
				</div>
				<!-- //상단 제품 정보 -->

				<!-- 쿠폰 다운로드  -->
				<!-- //쿠폰 다운로드  -->


				<div class="xans-element- xans-product xans-product-additional ">
					<!-- 상품상세정보 -->
					<!-- 관련상품 -->

					<!-- //관련상품 -->
					<div id="prdDetail">

						<div class="cont">
							<p style="text-align: center;">
								<span style="font-size: 32px;"></span>
							</p>
							<p style="text-align: center;"></p>
							<p style="text-align: center;"></p>
							<p style="text-align: center;">
								<span style="font-size: 16px;"><br></span>
							</p>
							<p style="text-align: center;">
								<font color="#ff0000"><span style="font-size: 16px;"><b></b></span></font>
							</p>
							<p style="text-align: center;">
								<span style="font-size: 12pt;"><br></span>
							</p>
							<p style="text-align: center;"></p>
							<div class="menu-A-exp"
								style="text-align: center; font-family: &amp; amp; amp; quot; Noto Sans&amp;amp; amp; quot; , &amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; quot; , &amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; quot; , sans-serif; font-size: 14px; color: rgb(119, 119, 119); line-height: 22px; letter-spacing: -0.03em;"></div>
							<p style="text-align: center;">
								<b style="font-size: 16px;"></b>
							</p>
							<p style="text-align: center;">
								<span style="font-size: 16px;"><br></span>
							</p>
							<div>
								<br>
							</div>
							<p style="text-align: center;">
								<img style="width: 100%;" src="img/<%=DetailImgName%>"
									alt="<%=DetailImgName%>">
							</p>
						</div>
					</div>
					<!-- //상품상세정보 -->
					<!-- 상품결제정보 -->
					<div id="prdPayment"></div>
					<!-- //상품결제정보 -->
					<!-- 배송정보 -->
					<div id="prdDelivery"></div>
					<!-- //배송정보 -->
					<!-- 교환 및 반품정보 -->
					<div id="prdChange"></div>
					<!-- //교환 및 반품정보 -->
					<!-- 서비스문의 -->
					<div id="prdService"></div>
					<!-- //서비스문의 -->
					<!-- 상품사용후기 -->
					<div id="prdReview"></div>
					<!-- //상품사용후기 -->
					<!-- 상품 Q&A -->
					<div id="prdQnA"></div>
					<!-- //상품Q&A -->
				</div>

			</div>
		</div>
		<hr class="layout">
		<div id="banner" style="top: 154px;"></div>

		<div id="aside" style="top: 154px;">


			<div class="xans-element- xans-layout xans-layout-productrecent"
				style="">
				<h2></h2>
				<p class="btn"></p>
				<ul>
					<li class="xans-record-"><a
						href="/product/detail.html?product_no=6604&amp;cate_no=12&amp;display_group=1">

					</a></li>
					<li class="xans-record-"><a
						href="/product/detail.html?product_no=34&amp;cate_no=61&amp;display_group=1">

					</a></li>
				</ul>
				<p class="btn"></p>
			</div>


			<p class="banner"></p>
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
	<%@ include file="footer.jsp"%>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="css/bootstrap.min.css"></script>
</body>
</html>