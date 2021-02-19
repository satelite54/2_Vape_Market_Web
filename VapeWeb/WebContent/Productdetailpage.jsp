<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JASET VAPE</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
</head>
<%
	/* 	String id = "";
	id = (String)session.getAttribute("id");
	
	if(id == null || id.equals("")) {
		response.sendRedirect("login.jsp");
	} */
%>


<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="xans-element- xans-product xans-product-detail ">
		<!-- 이미지 영역 -->
		<div class="xans-element- xans-product xans-product-image imgArea">
			<div class="keyImg ">
				<a href="#none" alt="P0000JUA"
					onclick="product_popup('product/image_zoom.html', 'image_zoom', 'toolbar=no,scrollbars=auto,resizable=yes,width=660,height=640,left=0,top=0', this);"><img
					src="//www.thevapor.co.kr/web/product/big/202101/80e8f2cad0294864c3d3b73d3a69d7ae.jpg"
					alt="" class="BigImage "><span id="zoomMouseGiude"
					style="display: block; position: relative; width: 170px; margin: 0 auto;"><img
						src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/txt_product_zoom.gif"
						id="zoomGuideImage" alt="마우스를 올려보세요."
						style="position: absolute; top: -27px; right: 0px;"></span></a>
			</div>
			<div class="listImg">
				<ul>
					<li><img
						src="//www.thevapor.co.kr/web/product/tiny/202101/3c2b463a7314af07a711052b647e3016.jpg"
						class="ThumbImage" alt=""></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="button ">
				<span class="prev"><a href="#none"
					onclick="ImagePreview.viewProductBtnClick('prev');"
					style="display:;"><img
						src="http://img.echosting.cafe24.com/design/skin/default/product/btn_product_prev.gif"
						alt="이전 제품 보기"></a></span> <span class="next"><a href="#none"
					onclick="ImagePreview.viewProductBtnClick('next');"
					style="display:;"><img
						src="http://img.echosting.cafe24.com/design/skin/default/product/btn_product_next.gif"
						alt="다음 제품 보기"></a></span> <a href="#none"
					onclick="product_popup('product/image_zoom.html', 'image_zoom', 'toolbar=no,scrollbars=auto,resizable=yes,width=660,height=640,left=0,top=0', this);"><img
					src="http://img.echosting.cafe24.com/design/skin/default/product/btn_product_zoom.gif"
					alt="크게보기"></a>
			</div>
		</div>
		<!-- //이미지 영역 -->
		<!-- 상세정보 내역 -->
		<div class="infoArea">
			<h3>
				[P0000JUA] [입호흡/Fantasy Juice] 아이스 망고 30ml - Ice Mango 9.8mg/ml
				(원본액상) <span> <img
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
							<td><span style="font-size: 16px; color: #555555;">[입호흡/Fantasy
									Juice] 아이스 망고 30ml - Ice Mango 9.8mg/ml (원본액상)</span></td>
						</tr>
						<tr class=" xans-record-">
							<th><span style="font-size: 12px; color: #555555;">제조사</span></th>
							<td><span style="font-size: 12px; color: #555555;">솔트액상</span></td>
						</tr>

						<tr class=" xans-record-">
							<th><span
								style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span></th>
							<td><span
								style="font-size: 12px; color: #008BCC; font-weight: bold;"><strong
									id="span_product_price_text">32,000원</strong><input
									id="product_price" name="product_price" value="" type="hidden"></span></td>
						</tr>

						<tr class=" xans-record-">
							<th><span style="font-size: 12px; color: #555555;">상품코드</span></th>
							<td><span style="font-size: 12px; color: #555555;">P0000JUA</span></td>
						</tr>


						<tr class=" xans-record-">
							<th><span style="font-size: 12px; color: #555555;">결제수단</span></th>
							<td><span style="font-size: 12px; color: #555555;"><span
									id="individual_payment_method">카드 결제, 무통장 입금, 적립금</span></span></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="zoom_wrap">
				<p class="image_zoom_large" style="display: none;">
					<span class="image_zoom_large_relative"><img id="zoom_image"
						alt="확대 이미지"
						src="//www.thevapor.co.kr/web/product/big/202101/80e8f2cad0294864c3d3b73d3a69d7ae.jpg"
						style="width: 728px; height: 728px;"></span>
				</p>
			</div>

			<p class="displaynone">
				<img
					src="http://img.echosting.cafe24.com/design/skin/default/product/txt_naver.gif"
					alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다."> &nbsp;
			</p>


			<table border="1" summary="">
				<caption>상품 옵션</caption>
				<tbody
					class="xans-element- xans-product xans-product-option xans-record-">
					<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
					<!-- //참고 -->
				</tbody>
			</table>
			<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
			<p class="info ">
				(최소주문수량 1개 이상<span class="displaynone"> / 최대주문수량 0개 이하</span>)
			</p>
			<!-- //참고 -->

			<!-- <div id="zoom_wrap"></div>  -->




			<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
			<!-- //참고 -->

			<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
			<!-- //참고 -->

			<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
			<div id="totalProducts" class="">
				<p class="info ">
					<img
						src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/ico_information.gif"
						alt=""> 수량을 선택해주세요.
				</p>
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
					<tbody class="">
						<tr>
							<td>[입호흡/Fantasy Juice] 아이스 망고 30ml - Ice Mango 9.8mg/ml
								(원본액상)</td>
							<td><span class="quantity"> <input id="quantity"
									name="quantity_opt[]" style="" value="1" type="text"> <a
									href="#none"><img
										src="http://img.echosting.cafe24.com/design/skin/default/product/btn_quantity_up.gif"
										alt="수량증가" class="QuantityUp up"></a> <a href="#none"><img
										src="http://img.echosting.cafe24.com/design/skin/default/product/btn_quantity_down.gif"
										alt="수량감소" class="QuantityDown down"></a>
							</span></td>
							<td class="right"><span class="quantity_price">32,000원<input
									type="hidden" name="option_box_price" class="option_box_price"
									value="32000" item_code="P0000JUA000A"></span> <span
								class="mileage ">(<img
									src="//img.echosting.cafe24.com/design/common/icon_cash.gif">
									&nbsp;<span class="mileage_price">20원</span>)
							</span></td>
						</tr>
					</tbody>
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
							<td colspan="3"><strong>총 상품금액</strong>(수량) : <span
								class="total"><strong><em>32,000원</em></strong> (1개)</span></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- //참고 -->


			<!-- 네이트 C Log (공감하기 버튼) -->
			<!-- //네이트 C Log (공감하기 버튼) -->

			<div class="xans-element- xans-product xans-product-action ">
				<span class="left"> <a href="#none"
					onclick="product_submit(2, '/exec/front/order/basket/', this)"
					class=""><img
						src="//img.echosting.cafe24.com/design/skin/fashion013/btn_basket1.gif"
						alt="장바구니 담기"></a>


				</span> <a href="/"><img
					src="//img.echosting.cafe24.com/design/skin/fashion013/btn_shopping.gif"
					alt="쇼핑 계속하기"></a> <a href="#none"
					onclick="product_submit(1, '/exec/front/order/basket/', this)"
					class=""><img
					src="//img.echosting.cafe24.com/design/skin/fashion013/btn_cart.gif"
					alt="바로 구매하기"></a>
				<!-- 네이버 체크아웃 구매 버튼  -->
				<div id="NaverChk_Button"></div>
				<!-- //네이버 체크아웃 구매 버튼  -->
			</div>



		</div>
		<!-- //상세정보 내역 -->
	</div>
	<%@ include file="footer.jsp"%>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="css/bootstrap.min.css"></script>
</body>
</html>