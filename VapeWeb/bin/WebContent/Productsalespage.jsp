<%@page import="java.net.URLEncoder"%>
<%@page import="DAO.dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;	
	
	try {
		String url = "jdbc:mysql://localhost:3306/vape";
		String user = "root";
		String password = "1234";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
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
			
			[class*="col-md-3"] {
				  padding: 8px;
				  border: 1px solid gray;
				  text-align: center;
			}
		</style>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/custom.css">	
	</head>
	
	<body>
		<%@ include file="menu.jsp" %>
		<%@ include file="submenu.jsp" %>
	    <header>
	    	<form action="">
				<div class="container">
				  <div class="row">
  				<%	
					PreparedStatement pstmt1 = null;
					ResultSet rs1 = null;
					
					String sql1 = "select * from products";
					pstmt1 = conn.prepareStatement(sql1);
					rs1 = pstmt1.executeQuery();
					while (rs1.next()) {
				%>
				    <div class="col-6 col-md-4">
				    	<a href="Productdetailpage.jsp"><%=rs1.getString("pname")%></a>
				    </div>
				<%
					}
				%>
				  </div>

				</div>
	    	</form>

		</header>
		
		<div class="container">
			<div class="row" align="center">
				<%	
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = "select * from products";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String pname = rs.getString("pname");
						String code = rs.getString("code");
						String manufacturer = rs.getString("manufacturer");
						int price = rs.getInt("price");
						int stock = rs.getInt("stock");
						String imgname = rs.getString("imgname");
						Date adddate = rs.getDate("adddate");
						String producttype = rs.getString("producttype");
						String Detailedimagepath = rs.getString("Detailedimagepath");
						// JSP 변수를 html에 쓰기 위해서는 pageContext 객체를 이용해야한다.
						pageContext.setAttribute("pname", pname);
						pageContext.setAttribute("code", code);
						pageContext.setAttribute("manufacturer", manufacturer);
						pageContext.setAttribute("price", price);
						pageContext.setAttribute("stock", stock);
						pageContext.setAttribute("imgname", imgname);
						pageContext.setAttribute("adddate", adddate);
						pageContext.setAttribute("producttype", producttype);
						pageContext.setAttribute("Detailedimagepath", Detailedimagepath);
					// EL의 출력 방식은 ${} pageScope는 EL의 내장 객체중 하나로 Page 영역에 존재하는 객체를 참조할 때 사용
				%>
				<div class="col-md-3">
					<a href="Productdetailpage.jsp
					?pname=${pageScope.pname}&code=${pageScope.code}&manufacturer=${pageScope.manufacturer}
					&price=${pageScope.price}&stock=${pageScope.stock}&imgname=${pageContext.request.contextPath}/img/${pageScope.imgname}
					&adddate=${pageScope.adddate}&producttype=${pageScope.producttype}&Detailedimagepath=${pageContext.request.contextPath}/img/${pageScope.Detailedimagepath}
					"><img src="${pageContext.request.contextPath}/img/${pageScope.imgname}" style="width: 100%"></a>
					<h3><%=pname%></h3>
					<p><%=price%>원
					<%-- <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a> --%>
				</div>
				<%
					}
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				%>
			</div>
			<hr>
		</div>
		
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="css/bootstrap.min.css"></script>
	</body>
</html>