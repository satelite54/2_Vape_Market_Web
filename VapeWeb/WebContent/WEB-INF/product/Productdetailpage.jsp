<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="DAO.Dao"%>
<%@ page import="DTO.Review"%>
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
String producttype = request.getParameter("producttype");
String Manufacturer = request.getParameter("Manufacturer");
String Code = request.getParameter("Code");
String DetailImgName = request.getParameter("DetailImgName");
String ImgName = request.getParameter("Imgname"); 
	 session.setAttribute("pname", Pname);
	 session.setAttribute("price", Price);%>
	
	
	
	#prdDetailContentLazy img[src=""], #prdDetailContentLazy img:not([src])
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
						<a href="#none" alt="P0000JUA"><img src="img/${param.Imgname}"
							alt="" class="BigImage "><span id="zoomMouseGiude"
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

					<%-- <%System.out.println() %> --%>
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
										<form name="shoppingForm" class="form-inline " action="ShoppingListAction.do" method="post">
											<button
												class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;}"
												type="submit" value="Submit">장바구니</button>
											<input id="productCnt" type="text" name=countresult value=1>
											<input type=button value="증가"
												onClick="javascript:this.form.countresult.value++; javascript:transforValue();">
											<input type=button value="감소"
												onClick="javascript:this.form.countresult.value--; javascript:transforValue();">
											<input type="hidden" name="inputtotal" value="${param.Price}">
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
								var f = document.shoppingForm;
								f.inputtotal.value = document.getElementById("count").innerHTML
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
				<br> <br> <br>
				<%-- 	<%@ include file="../review/review.jsp"%> --%>

				<%
				Review review = new Review();
				Dao dao = new Dao();
				%>

				<%
				request.setCharacterEncoding("UTF-8");
				%>
				</head>
				<body>


					<script type="text/javascript">
	function reviewDisplay() {
		var e = document.getElementById("reviewDiv");
		if(e.style.display=='none')
			e.style.display='block';
		else
			e.style.display='none';
	}
</script>

					<div class="container">
						<table class="table">
							<thead class="text-light" style="background-color: #223a6b;">
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">글 제목</th>
									<th class="text-center">작성자</th>
									<th class="text-center">작성일</th>
									<th class="text-center">조회수</th>
								</tr>
							</thead>
							<tbody class="border">
								<%
								ArrayList<Review> list = dao.getReviewList();
								String cnl = request.getParameter("cnl");
								if (cnl == null) {
									cnl = "1";
								}
								// !(CntIndex > (pageSelectectedIndex * 15 - 15) && CntIndex <= pageSelectectedIndex * 15)
								int NowPageNumber = Integer.parseInt(cnl);

								if (list != null) {
									for (int i = 0; i < list.size(); i++) {
										if ((i <= (NowPageNumber * 10 - 10) - 1 || i > NowPageNumber * 10 - 1))
									continue;
								%>

								<tr>
									<td><%=list.get(i).getRNum()%></td>
									<td><a
										href="reviewView.do?RNum=<%=list.get(i).getRNum()%>"
										target="popup"
										onclick="window.open('reviewView.do?RNum=<%=list.get(i).getRNum()%>','popup','width=600,height=600'); return false;"><%=list.get(i).getRTitle()%></a></td>
									<td><%=list.get(i).getId()%></td>
									<td><%=list.get(i).getRDate().substring(0, 16)%></td>
									<td><%=list.get(i).getViews()%></td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination" style="justify-content: center;">
							<%
							int PreviousPageNumber = NowPageNumber - 1;
							if (PreviousPageNumber < 1) {
								PreviousPageNumber = 1;
							}
							%>
							<li class="page-item"><a class="page-link"
								href="productdetailpage.do?cnl=<%=PreviousPageNumber%>&Imgname=<%=ImgName%>&DetailImgName=<%=DetailImgName%>&Code=<%=Code%>&Manufacturer=<%=Manufacturer%>&Pname=<%=Pname%>&producttype=<%=producttype%>&Price=<%=Price%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
							if (list != null) {
								NowPageNumber++;
								if (NowPageNumber > (list.size() - 1) / 10 + 1)
									NowPageNumber = (list.size() - 1) / 10 + 1;
								for (int i = 1; i <= (list.size() - 1) / 10 + 1; i++) {
							%>
							<li class="page-item"><a class="page-link"
								href="productdetailpage.do?cnl=<%=i%>&Imgname=<%=ImgName%>&DetailImgName=<%=DetailImgName%>&Code=<%=Code%>&Manufacturer=<%=Manufacturer%>&Pname=<%=Pname%>&producttype=<%=producttype%>&Price=<%=Price%>"><%=i%></a></li>
							<%
							}
							%>
							<li class="page-item"><a class="page-link"
								href="productdetailpage.do?cnl=<%=NowPageNumber%>&Imgname=<%=ImgName%>&DetailImgName=<%=DetailImgName%>&Code=<%=Code%>&Manufacturer=<%=Manufacturer%>&Pname=<%=Pname%>&producttype=<%=producttype%>&Price=<%=Price%>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							<%
							}
							%>
						</ul>
					</nav>
					<a href="javascript:reviewDisplay()"
						class="btn btn-dark float-center">글쓰기</a>
					<br>
					<br>
					<br>

					<div id="reviewDiv" align="center" style="display: none;">
						<%
						int RNum = 0;
						Dao daoforReviewWrite = new Dao();
						%>
						<div class="container mt-3">
							<div class="card">
								<div class="card-header"
									style="background-color: black; color: white;">후기를
									작성해주세요!</div>

								<div class="card-body" style="height: 500px;">
									<form action="reviewWriteAction.do" method="post">
										<input type="text" class="form-control mb-3" name="RTitle"
											placeholder="글제목" maxlength="50" required> <input
											type="hidden" name="RNum"
											value="<%=daoforReviewWrite.getRNum()%>">
										<textarea class="form-control mb-3" name="RContent"
											id="editor" style="height: 350px important!"
											placeholder="글내용" maxlength="2048" required></textarea>
										<br>
										<div class="row">
											<input type="submit" value="등록"
												class="btn btn-dark ml-auto mr-3"> <input
												type="hidden" name="Pname" value="<%=Pname%>" /> <input
												type="hidden" name="Imgname" value="<%=ImgName%>" /> <input
												type="hidden" name="producttype" value="<%=producttype%>" />
											<input type="hidden" name="Price" value="<%=Price%>" /> <input
												type="hidden" name="Code" value="<%=Code%>" /> <input
												type="hidden" name="DetailImgName"
												value="<%=DetailImgName%>" /> <input type="hidden"
												name="Manufacturer" value="<%=Manufacturer%>" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
	   function checkForm1() {
	      if (${id==null}) {
	         alert("로그인 해주세요.");
	         return false;
	      }
	      location.href = "review/reviewWrite.jsp?id=${id}"
	   }
	</script>
			</div>

			<div id="section3" class="container-fluid center"
				style="padding-top: 70px; padding-bottom: 70px">
				<h1 style="">Q&A</h1>
				<%-- <%@ include file="../question/list.jsp"%> --%>
				<%@page import="question.QuestionBean"%>
				<%@page import="java.util.Vector"%>
				<%@page import="question.UtilMgr"%>
				<%@page contentType="text/html; charset=utf-8"%>
				<jsp:useBean id="mgr" class="question.QuestionMgr" />
				<jsp:useBean id="cmgr" class="question.QCommentMgr" />
				<%
				request.setCharacterEncoding("utf-8");
				int totalRecord = 0;//총게시물수
				int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
				int pagePerBlock = 15;//블럭당 페이지 개수
				int totalPage = 0;//총 페이지 개수
				int totalBlock = 0;//총 블럭 개수
				int nowPage = 1;//현재 페이지
				int nowBlock = 1;//현재 블럭

				if (request.getParameter("numPerPage") != null) {
					numPerPage = UtilMgr.parseInt(request, "numPerPage");
				}

				String keyField = "", keyWord = "";

				if (request.getParameter("keyWord") != null) {
					keyField = request.getParameter("keyField");
					keyWord = request.getParameter("keyWord");
				}

				if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
					keyField = "";
					keyWord = "";
				}

				totalRecord = mgr.getTotalCount(keyField, keyWord);
				if (request.getParameter("nowPage") != null) {
					nowPage = UtilMgr.parseInt(request, "nowPage");
				}

				int start = (nowPage * numPerPage) - numPerPage;
				int cnt = numPerPage;

				totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
				totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
				nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
				%>
				<link href="style.css" rel="stylesheet" type="text/css">
				<script type="text/javascript">

	function check() {
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function  list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "question/read.jsp";
		document.readFrm.submit();
	}
	function postDisplay() {
		var e = document.getElementById("writeDiv");
		if(e.style.display=='none')
			e.style.display='block';
		else
			e.style.display='none';
	}
	
</script>
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet"
					href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

				<div class="container">
					<div align="center">
						<br />
						<table align="center">
							<tr>
								<td width="600">Total : <%=totalRecord%>Articles(<font
									color="red"> <%=nowPage + "/" + totalPage%>Pages
								</font>)
								</td>
								<td align="right">
									<form name="npFrm" method="post">
										<select name="numPerPage" size="1"
											onchange="numPerFn(this.form.numPerPage.value)">
											<option value="5">5개 보기</option>
											<option value="10" selected>10개 보기</option>
											<option value="15">15개 보기</option>
											<option value="30">30개 보기</option>
										</select> <input type="hidden" name="Pname" value="<%=Pname%>" /> <input
											type="hidden" name="Imgname" value="<%=ImgName%>" /> <input
											type="hidden" name="producttype" value="<%=producttype%>" />
										<input type="hidden" name="Price" value="<%=Price%>" /> <input
											type="hidden" name="Code" value="<%=Code%>" /> <input
											type="hidden" name="DetailImgName" value="<%=DetailImgName%>" />
										<input type="hidden" name="Manufacturer"
											value="<%=Manufacturer%>" />
									</form> <script>document.npFrm.numPerPage.value=<%=numPerPage%></script>
								</td>
							</tr>
						</table>
						<table align="center">
							<tr>
								<td align="center" colspan="2">
									<%
									Vector<QuestionBean> vlist = mgr.getQuestionList(keyField, keyWord, start, cnt);
									int listSize = vlist.size();//브라우저 화면에 표시될 게시물 번호
									if (vlist.isEmpty()) {
										out.println("등록된 게시물이 없습니다.");
									} else {
									%>
									<table cellspacing="0">
										<tr align="center" bgcolor="#D0D0D0">
											<td width="100">번 호</td>
											<td width="250">제 목</td>
											<td width="100">이 름</td>
											<td width="150">날 짜</td>
											<td width="100">조회수</td>
										</tr>
										<%
										for (int i = 0; i < numPerPage; i++) {
											if (i == listSize)
												break;
											QuestionBean bean = vlist.get(i);
											int num = bean.getNum();//게시물 번호
											String subject = bean.getSubject();//제목
											String name = bean.getName();//이름
											String regdate = bean.getRegdate();//날짜
											int depth = bean.getDepth();//답변의 깊이
											int count = bean.getCount();//조회수
											String filename = bean.getFilename();//첨부파일
											//댓글 count
											int qcount = cmgr.getQCommentCount(num);
										%>
										<tr align="center">
											<td><%=totalRecord - start - i%></td>
											<td align="left">
												<%
												for (int j = 0; j < depth; j++) {
													out.println("&nbsp;&nbsp;");
												}
												%> <a href="question/read.jsp?<%=num%>" target="popup"
												onclick="window.open('question/read.jsp?num=<%=num%>','popup','width=600,height=600'); return false;"><%=subject%></a>
												<%
												if (filename != null && !filename.equals("")) {
												%> <img src="img/icon_file.gif" align="middle"> <%
 }
 %> <%
 if (qcount > 0) {
 %> <font color="red">(<%=qcount%>)
											</font> <%
 }
 %>
											</td>
											<td><%=name%></td>
											<td><%=regdate%></td>
											<td><%=count%></td>
										</tr>
										<%
										} //---for
										%>
									</table> <%
 } //---if-else
 %>
								</td>
							</tr>
							<tr>
								<td colspan="2"><br> <br></td>
							</tr>
							<tr>
								<td>
									<!-- 페이징 및 블럭 Start --> <%
 if (totalPage > 0) {
 %> <!-- 이전 블럭 --> <%
 if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 }
 %> <!-- 페이징 --> <%
 int pageStart = (nowBlock - 1) * pagePerBlock + 1;
 int pageEnd = (pageStart + pagePerBlock) < totalPage ? pageStart + pagePerBlock : totalPage + 1;
 for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 if (nowPage == pageStart) {
 %><font color="blue"> <%
 }
 %> [<%=pageStart%>] <%
 if (nowPage == pageStart) {
 %>
									</font> <%
 }
 %>
								</a> <%
 } //---for
 %> <!-- 다음 블럭 --> <%
 if (totalBlock > nowBlock) {
 %> <a data-toggle="modal" href="javascript:block('<%=nowBlock + 1%>')">...next</a>
									<%
									}
									%> <%
 } //---if1
 %> <!-- 페이징 및 블럭 End -->
								</td>
								<td align="right"><a style="color: blue;"
									href="javascript:postDisplay()">[글쓰기]</a></td>
							</tr>
						</table>


						<div id="writeDiv" align="center" style="display: none;">
							<br /> <br />
							<form name="postFrm" method="post"
								action="QuestionAnserWriteAction.do"
								enctype="multipart/form-data">
								<table width="600" cellpadding="3" align="center">
									<tr>
										<td align=center>
											<table align="center">
												<tr>
													<td width="10%">성 명</td>
													<td width="90%"><input name="name" size="10"
														maxlength="8"></td>
												</tr>
												<tr>
													<td>제 목</td>
													<td><input name="subject" value="Q: " size="50"
														maxlength="30"></td>
												</tr>
												<tr>
													<td>내 용</td>
													<td><textarea name="content" rows="10" cols="50"></textarea></td>
												</tr>
												<tr>
													<td>비밀 번호</td>
													<td><input type="password" name="pass" size="15"
														maxlength="15" value="1234"></td>
												</tr>
												<tr>
												<tr>
													<td>파일찾기</td>
													<td><input type="file" name="filename" size="50"
														maxlength="50"></td>
												</tr>

												<tr>
													<td colspan="2"><hr /></td>
												</tr>
												<tr>
													<td colspan="2"><input type="submit" value="글등록">
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
								<input type="hidden" name="Pname" value="<%=Pname%>" /> <input
									type="hidden" name="Imgname" value="<%=ImgName%>" /> <input
									type="hidden" name="producttype" value="<%=producttype%>" /> <input
									type="hidden" name="Price" value="<%=Price%>" /> <input
									type="hidden" name="Code" value="<%=Code%>" /> <input
									type="hidden" name="DetailImgName" value="<%=DetailImgName%>" />
								<input type="hidden" name="Manufacturer"
									value="<%=Manufacturer%>" />
							</form>
						</div>

						<form name="listFrm" method="post">
							<input type="hidden" name="reload" value="true"> <input
								type="hidden" name="nowPage" value="1"> <input
								type="hidden" name="Pname" value="<%=Pname%>" /> <input
								type="hidden" name="Imgname" value="<%=ImgName%>" /> <input
								type="hidden" name="producttype" value="<%=producttype%>" /> <input
								type="hidden" name="Price" value="<%=Price%>" /> <input
								type="hidden" name="Code" value="<%=Code%>" /> <input
								type="hidden" name="DetailImgName" value="<%=DetailImgName%>" />
							<input type="hidden" name="Manufacturer"
								value="<%=Manufacturer%>" />
						</form>

						<form name="readFrm">
							<input type="hidden" name="nowPage" value="<%=nowPage%>" /> <input
								type="hidden" name="numPerPage" value="<%=numPerPage%>" /> <input
								type="hidden" name="keyField" value="<%=keyField%>" /> <input
								type="hidden" name="num" /> <input type="hidden" name="Pname"
								value="<%=Pname%>" /> <input type="hidden" name="Imgname"
								value="<%=ImgName%>" /> <input type="hidden" name="producttype"
								value="<%=producttype%>" /> <input type="hidden" name="Price"
								value="<%=Price%>" /> <input type="hidden" name="Code"
								value="<%=Code%>" /> <input type="hidden" name="DetailImgName"
								value="<%=DetailImgName%>" /> <input type="hidden"
								name="Manufacturer" value="<%=Manufacturer%>" />
						</form>
					</div>
				</div>


			</div>
		</body>
	</div>
	<%@ include file="../sub/footer.jsp"%>
</body>
</html>