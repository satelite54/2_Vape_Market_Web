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
</head>

<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="submenu.jsp"%>
	<%
		String getproducttype = request.getParameter("producttype");
		String searchfromMain = request.getParameter("search");

		String searchtrim = searchfromMain.trim();

		if (searchtrim != null) {
			getproducttype = "search";
		}
		String sqlQueryforOrderby = request.getParameter("sqlQuery");
		String orderbyint = request.getParameter("orderbyint");
		CSQL sqlforOrderby = new CSQL();
		if (orderbyint == null) {
			orderbyint = "1";
		}

		String[] getsalespagedata = sqlforOrderby.generateSQLQuery(getproducttype, sqlQueryforOrderby, orderbyint,
				searchtrim);
		String sqlQuerynew = "";
	%>
	<br>
	<br>
	<br>
	<br>
	<div class="orderbyContainer d-flex justify-content-end">
		<%
			if (searchtrim == null) {
				sqlQuerynew = getsalespagedata[0];
		%>

		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%=getsalespagedata[1]%>&orderbyint=<%=1%>"><%="↓높은 가격 순&nbsp;&nbsp;"%></a>
		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%=getsalespagedata[1]%>&orderbyint=<%=2%>"><%="↑낮은 가격 순&nbsp;&nbsp;"%></a>
		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%=getsalespagedata[1]%>&orderbyint=<%=3%>"><%="날짜순&nbsp;&nbsp;"%></a><%="&nbsp;"%>
		<%
			} else {
				sqlQuerynew = getsalespagedata[0];
		%>

		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%="search"%>&orderbyint=<%=1%>&search=<%=searchfromMain%>"><%="↓높은 가격 순&nbsp;&nbsp;"%></a>
		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%="search"%>&orderbyint=<%=2%>&search=<%=searchfromMain%>"><%="↑낮은 가격 순&nbsp;&nbsp;"%></a>
		<a
			href="Productsalespage.jsp?sqlQuery=<%=getsalespagedata[0]%>&producttype=<%="search"%>&orderbyint=<%=3%>&search=<%=searchfromMain%>"><%="날짜순"%></a><%="&nbsp;"%>
		<%
			}
		%>
	</div>
	<br>
	<div class="container">
		<div class="row" align="center">
			<%
				int pageItemCnt = 8;
				int CntIndex = 0;
				int Cnthardware = 0;
				int Cntliquid = 0;
				int Cntcoil = 0;

				int Cntsum = 0;
				dao products = new dao();
				List<Products> ItemList = new ArrayList<Products>();
				ItemList = products.makeProductsList(sqlQuerynew);
				boolean searchFlag = false;

				String moreShopping = request.getParameter("fromShop");
				if (moreShopping == null)
					if (request.getParameter("producttype") == null || request.getParameter("search") != null) {

						List<Products> ItemListRefine = new ArrayList<Products>();
						for (int i = 0; i < ItemList.size(); i++) {
							if (request.getParameter("producttype") == null) {

								if (ItemList.get(i).getPname().contains(request.getParameter("search"))) {
									ItemListRefine.add(ItemList.get(i));
								}
							} else if (request.getParameter("producttype").equals("search")) {
								if (ItemList.get(i).getPname().contains(request.getParameter("search"))) {
									ItemListRefine.add(ItemList.get(i));
								}
							} else {
								searchFlag = false;
								break;
							}
							searchFlag = true;
						}
						if (searchFlag)
							ItemList = ItemListRefine;
					}
				;

				for (int i = 0; i < ItemList.size(); i++) {// total Count가 36이면 2페이지이면 16 ~ 30까지 출력 아니면 스킵
					Products product = ItemList.get(i);
					CntIndex++;

					if (searchFlag == true) {
						Cntsum++;
						if (!(CntIndex > (pageSelectectedIndex * pageItemCnt - pageItemCnt)
								&& CntIndex <= pageSelectectedIndex * pageItemCnt))
							continue;
					} else {
						if (product.getProducttype().equals("hardware")) {
							Cnthardware++;
							if (!(CntIndex > (pageSelectectedIndex * pageItemCnt - pageItemCnt)
									&& CntIndex <= pageSelectectedIndex * pageItemCnt))
								continue;
						} else if (product.getProducttype().equals("liquid")) {
							Cntliquid++;
							if (!(CntIndex > (pageSelectectedIndex * pageItemCnt - pageItemCnt)
									&& CntIndex <= pageSelectectedIndex * pageItemCnt))
								continue;
						} else if (product.getProducttype().equals("coil")) {
							Cntcoil++;
							if (!(CntIndex > (pageSelectectedIndex * pageItemCnt - pageItemCnt)
									&& CntIndex <= pageSelectectedIndex * pageItemCnt))
								continue;
						}
					}

					// JSP 변수를 html에 쓰기 위해서는 pageContext 객체를 이용해야한다.
					pageContext.setAttribute("pname", product.getPname());
					pageContext.setAttribute("code", product.getCode());
					pageContext.setAttribute("manufacturer", product.getManufacturer());
					pageContext.setAttribute("price", product.getPrice());
					pageContext.setAttribute("stock", product.getStock());
					pageContext.setAttribute("imgname", product.getImgname());
					pageContext.setAttribute("adddate", product.getAdddate());
					pageContext.setAttribute("producttype", product.getProducttype());
					pageContext.setAttribute("Detailedimagepath", product.getDetailedimagepath());
					// EL의 출력 방식은 ${} pageScope는 EL의 내장 객체중 하나로 Page 영역에 존재하는 객체를 참조할 때 사용roducttype.

					if (request.getParameter("producttype") != null) {
						if (product.getProducttype().equals(request.getParameter("producttype"))) {
			%>
			<div class="col-md-3">
				<a
					href="Productdetailpage.jsp?pname=${pageScope.pname}&code=${pageScope.code}&manufacturer=${pageScope.manufacturer}
					&price=${pageScope.price}&stock=${pageScope.stock}&imgname=${pageContext.request.contextPath}/img/${pageScope.imgname}
					&adddate=${pageScope.adddate}&producttype=${pageScope.producttype}&Detailedimagepath=${pageContext.request.contextPath}/img/${pageScope.Detailedimagepath}
					"><img
					src="${pageContext.request.contextPath}/img/${pageScope.imgname}"
					style="width: 100%"></a>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getPrice()%>원
					<%-- <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a> --%>
			</div>
			<br>
			<%
				} else if (request.getParameter("producttype").equals("search")) {
			%>
			<div class="col-md-3">
				<a
					href="Productdetailpage.jsp?pname=${pageScope.pname}&code=${pageScope.code}&manufacturer=${pageScope.manufacturer}&price=${pageScope.price}&stock=${pageScope.stock}&imgname=${pageContext.request.contextPath}/img/${pageScope.imgname}&adddate=${pageScope.adddate}&producttype=${pageScope.producttype}&Detailedimagepath=${pageContext.request.contextPath}/img/${pageScope.Detailedimagepath}"><img
					src="${pageContext.request.contextPath}/img/${pageScope.imgname}"
					style="width: 100%"></a>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getPrice()%>원
					<%-- <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a> --%>
			</div>
			<br>
			<%
				}
					} else {
			%>
			<div class="col-md-3">
				<a
					href="Productdetailpage.jsp?pname=${pageScope.pname}&code=${pageScope.code}&manufacturer=${pageScope.manufacturer}&price=${pageScope.price}&stock=${pageScope.stock}
					&imgname=${pageContext.request.contextPath}/img/${pageScope.imgname}&adddate=${pageScope.adddate}&producttype=${pageScope.producttype}&Detailedimagepath=${pageScope.Detailedimagepath}"><img
					src="${pageContext.request.contextPath}/img/${pageScope.imgname}"
					style="width: 100%"></a>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getPrice()%>원
					<%-- <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a> --%>
			</div>
			<br>
			<%
				}
			%>

			<%
				}
			%>
		</div>

	</div>
	<hr>
	<nav aria-label="Page navigation example">
		<ul class="pagination" style="justify-content: center;">
			<%
				if (pageSelectectedIndex != 1) {
			%>
			<%--  <li class="page-item">
		      <a class="page-link" href="Productsalespage.jsp?sqlQuery=<%=hashParameterMap.get("sqlQuery")[0]%>&producttype=<%=hashParameterMap.get("producttype")[0]%>&orderbyint=<%=hashParameterMap.get("orderbyint")[0]%>&pageSelectedIndx=<%=pageSelectectedIndex%>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li> --%>
			<%
				}
			%>
			<%
				// 현재 클릭한 페이지 넘버 a태그 에 넣어주고
				int pageNumber = 0;

				if (searchFlag == true) {
					String search = request.getParameter("search");
					if (search.equals(" "))
						search = "";
					String sqlQuerySearch = "select * from products where pname Like '%" + search + "%'";
					for (int i = 1; i <= (Cntsum - 1) / pageItemCnt + 1; i++) {
						pageNumber = i;
						String strsearch = "search";
			%>
			<li class="page-item"><a class="page-link"
				href="Productsalespage.jsp?sqlQuery=<%=sqlQuerySearch%>&producttype=<%=strsearch%>&search=<%=search%> &orderbyint=<%=orderbyint%>&pageSelectedIndx=<%=pageNumber%>"><%=pageNumber%></a></li>
			<%
				}
				} else {
			%>
			<%
				if (hashParameterMap.get("producttype")[0].equals("hardware")) {
						for (int i = 1; i <= (Cntsum - 1) / pageItemCnt + 1; i++) {
							pageNumber = i;
			%>
			<li class="page-item"><a class="page-link"
				href="Productsalespage.jsp?sqlQuery=<%=hashParameterMap.get("sqlQuery")[0]%>&producttype=<%=hashParameterMap.get("producttype")[0]%>&orderbyint=<%=hashParameterMap.get("orderbyint")[0]%>&pageSelectedIndx=<%=pageNumber%>"><%=pageNumber%></a></li>
			<%
				}
					}
			%>
			<!-- 		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
			<%
				if (hashParameterMap.get("producttype")[0].equals("liquid")) {
						for (int i = 1; i <= (Cntsum - 1) / pageItemCnt + 1; i++) {
							pageNumber = i;
			%>
			<li class="page-item"><a class="page-link"
				href="Productsalespage.jsp?sqlQuery=<%=hashParameterMap.get("sqlQuery")[0]%>&producttype=<%=hashParameterMap.get("producttype")[0]%>&orderbyint=<%=hashParameterMap.get("orderbyint")[0]%>&pageSelectedIndx=<%=pageNumber%>"><%=pageNumber%></a></li>
			<%
				}
					}
					if (hashParameterMap.get("producttype")[0].equals("coil")) {
						for (int i = 1; i <= (Cntsum - 1) / pageItemCnt + 1; i++) {
							pageNumber = i;
			%>
			<li class="page-item"><a class="page-link"
				href="Productsalespage.jsp?sqlQuery=<%=hashParameterMap.get("sqlQuery")[0]%>&producttype=<%=hashParameterMap.get("producttype")[0]%>&orderbyint=<%=hashParameterMap.get("orderbyint")[0]%>&pageSelectedIndx=<%=pageNumber%>"><%=pageNumber%></a></li>
			<%
				}
						if (pageSelectectedIndex == pageNumber) {
			%>
			<%--  <li class="page-item">
		      <a class="page-link" href="Productsalespage.jsp?sqlQuery=<%=hashParameterMap.get("sqlQuery")[0]%>&producttype=<%=hashParameterMap.get("producttype")[0]%>&orderbyint=<%=hashParameterMap.get("orderbyint")[0]%>&pageSelectedIndx=<%=pageNumber%>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li> --%>
			<%
				}
					}
				}
			%>



		</ul>
	</nav>
	<%@ include file="footer.jsp"%>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="css/bootstrap.min.css"></script>
</body>
</html>