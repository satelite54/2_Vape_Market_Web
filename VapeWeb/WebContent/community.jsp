<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>
<%@ page import="DTO.Board" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>

<%!
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	%>
<%
	try{
		String url = "jdbc:mysql://localhost:3306/Vape?useSSL=false";
		String user = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	}catch (SQLException e){
		
	}
%>

<%! 
	public ArrayList<Board> getList(int pageNumber){ 
	String SQL = "SELECT * FROM Board WHERE BNum < ? Authority = 1 ORDER BY BNum DESC LIMIT 10";
	ArrayList<Board> list = new ArrayList<Board>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			Board board = new Board();
			board.setBNum(rs.getInt(1));
			board.setBTitle(rs.getString(2));
			board.setBContent(rs.getString(3));
			board.setBDate(rs.getDate(4).toString());
			board.setId(rs.getString(5));
			board.setAuthority(rs.getInt(6));
			board.setViews(rs.getInt(7));
			list.add(board);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list; 
}%>
<%!
public int getNext() { 
	String SQL = "SELECT BNum FROM Board ORDER BY BNum DESC";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1) + 1;
		}
		return 1;//첫 번째 게시물인 경우
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

%>

<%!
public boolean nextPage (int pageNumber) {
	String SQL = "SELECT * FROM Board WHERE BNum < ? Authority = 1 ORDER BY BNum DESC LIMIT 10";
	ArrayList<Board> list = new ArrayList<Board>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false; 		
}
%>
</head>
<body>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>
<script type="text/javascript">

</script>


<%
int pageNumber = 1; //기본 페이지 넘버
%>
	<div class="container">

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
						<%
							ArrayList<Board> list = getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getBNum()%></td>
							<td><a href="communityenter.jsp?BNum="<%=list.get(i).getBNum()%>><%= list.get(i).getBTitle()%></a></td>
							<td><%=list.get(i).getId()%></td>
							<td><%=list.get(i).getBDate().substring(0, 11) + list.get(i).getBDate().substring(11, 13) + "시"
							+ list.get(i).getBDate().substring(14, 16) + "분"%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- 페이지 넘기기 -->
				<%
					if (pageNumber != 1) {
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>
				<%
					}
					if (list.nextPage(pageNumber)) {
				%>
				<a href="community.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
				<button type="button" class="btn btn-secondary">1</button>
				<a href="communitywrite.jsp" class="btn btn-success float-right" >글쓰기</a>
		</div>






	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>