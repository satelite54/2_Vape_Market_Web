<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="DAO.dao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
</head>
<body>
	<%!
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
	%>

	<%
	String BTitle = request.getParameter("BTitle");
	String BContent = request.getParameter("BContent");
	String dbUrl = "jdbc:mysql://localhost:3306/vape";
	String dbUser = "root";
	String dbPass = "root";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	int BNum = 0;
	String sql = "select max(BNum) from board";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){ 
		BNum = rs.getInt("max(BNum)")+1; 
		}
	
	rs.close();
	
	/*
	String sqldate = "select now()";
	PreparedStatement pstmt2 = con.prepareStatement(sqldate);
	ResultSet rs2 = pstmt.executeQuery();
	if(rs2.next()){
		BDate = rs2.getString("now()");
	}
	rs2.close();
	*/
	String BDate = "";
	
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = null;
	today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	BDate = ts.toString();
	System.out.println(BDate);
	
	String id = "WooJ";
	int authority = 1;
	int views = 0;
	
	String sql2="insert into board(BNum, BTitle, BContent, BDate, id, authority, views) values(?,?,?,?,?,?,?)";
	try{
	pstmt = con.prepareStatement(sql2);
	pstmt.setInt(1, BNum);
	pstmt.setString(2, BTitle);
	pstmt.setString(3, BContent);
	pstmt.setString(4, BDate);
	pstmt.setString(5, id);
	pstmt.setInt(6, authority);
	pstmt.setInt(7, views);
	int insertResult1 = pstmt.executeUpdate();
	}catch(SQLException e){
		System.out.println("쓰기 데이터 전송에러");
	}
	%>




	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>