<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>JASET VAPE</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>

<jsp:include page="../sub/menu.jsp" flush="true"/>
<jsp:include page="../sub/submenu.jsp" flush="true"/>

	<div class="container">
		<form method="post" action="joinAction.jsp">
			<h3 style="text-align: center;">회원가입</h3>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="name" maxlength="100">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="id" maxlength="100">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="pw"
						maxlength="20">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input name="zip" class="form-control" type="text"
						id="sample4_postcode" placeholder="우편번호">
				</div>
				<div class="col-sm-2">
					<input type="button" class="form-control btn btn-dark"
						onclick="sample4_execDaumPostcode()" value="찾기"><br>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-6">
					<input type="text" name="street" class="form-control"
						id="sample4_roadAddress" placeholder="도로명주소"> <input
						type="text" class="form-control" id="sample4_jibunAddress"
						placeholder="지번주소" name="street" maxlength="100">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-4">
					<input type="text" name="building" class="form-control"
						id="sample4_detailAddress" placeholder="상세주소">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="sample4_extraAddress"
						placeholder="읍/면/동">
				</div>
			</div>
			<span id="guide" style="color: #999; display: none"></span>
			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				function sample4_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var roadAddr = data.roadAddress; // 도로명 주소 변수
									var extraRoadAddr = ''; // 참고 항목 변수

									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraRoadAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraRoadAddr += (extraRoadAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraRoadAddr !== '') {
										extraRoadAddr = ' (' + extraRoadAddr
												+ ')';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample4_postcode').value = data.zonecode;
									document
											.getElementById("sample4_roadAddress").value = roadAddr;
									document
											.getElementById("sample4_jibunAddress").value = data.jibunAddress;

									// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
									if (roadAddr !== '') {
										document
												.getElementById("sample4_extraAddress").value = extraRoadAddr;
									} else {
										document
												.getElementById("sample4_extraAddress").value = '';
									}

									var guideTextBox = document
											.getElementById("guide");
									// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
									if (data.autoRoadAddress) {
										var expRoadAddr = data.autoRoadAddress
												+ extraRoadAddr;
										guideTextBox.innerHTML = '(예상 도로명 주소 : '
												+ expRoadAddr + ')';
										guideTextBox.style.display = 'block';

									} else if (data.autoJibunAddress) {
										var expJibunAddr = data.autoJibunAddress;
										guideTextBox.innerHTML = '(예상 지번 주소 : '
												+ expJibunAddr + ')';
										guideTextBox.style.display = 'block';
									} else {
										guideTextBox.innerHTML = '';
										guideTextBox.style.display = 'none';
									}
								}
							}).open();
				}
			</script>
			<div class="form-group row">
				<label class="col-sm-2">핸드폰 번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="mobile">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="birthday">
				</div>
			</div>


			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<button type="submit" class="btn btn-dark">회원가입</button>
					<button type="button" class="btn btn-dark ml-3" name="cancle_home"
						onclick="sendit();">취소</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../sub/footer.jsp" flush="true"/>
	<script type="text/javascript">
		function sendit() {
			location.href = "http://localhost/VapeWeb/main.jsp";
		}
	</script>


	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="css/bootstrap.min.css"></script>

</body>
</html>