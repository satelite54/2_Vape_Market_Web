<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.dao"%>
<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.awt.dnd.DropTargetListener"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="DTO.Board"%>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />
	<title>JASET VAPE</title>
</head>
<%-- <%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%> --%>
<style>

div {text-align: center;}
.form {
    float: right;
}
</style>
	<%
		String id = null;
		if	(session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
		}
	%>
    <%
    	if(id == null) {
   	%>		
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">  
   		<div class="d-flex flex-grow-1"> 
        	<div class="w-100 text-right">
            	<button class="navbar-toggler" type="button" data-toggle="collapse" >
                	<span class="navbar-toggler-icon"></span>
            	</button>
        	</div>
    	</div>  

	    <div class="collapse navbar-collapse flex-grow-1 text-right">
    	    <ul class="navbar-nav ml-auto flex-nowrap">
        	    <li class="nav-item active">
            	    <a class="nav-link" href="login.jsp">로그인</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="join.jsp">회원가입</a>
	            </li>
    	        <li class="nav-item">
        	        <a class="nav-link" href="myshopping.jsp" onclick="checkForm(); return false;">나의 쇼핑</a>
	            </li>
    	    </ul>
    	</div>
	</nav>
	<%
    	} else {
    %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">  
   	<div class="d-flex flex-grow-1"> 
        	<div class="w-100 text-right">
            	<button class="navbar-toggler" type="button" data-toggle="collapse" >
                	<span class="navbar-toggler-icon"></span>
            	</button>
        	</div>
    	</div>  

	    <div class="collapse navbar-collapse flex-grow-1 text-right">
    	    <ul class="navbar-nav ml-auto flex-nowrap">
        	    <li class="nav-item active">
            	    <a class="nav-link" href="logout.jsp">로그아웃</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="update.jsp">회원수정</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="myshopping.jsp">나의 쇼핑</a>
            	</li>
            	<%
            		String admin = (String) session.getAttribute("admin");
            		if(admin == null)
            			admin = "0";
            		if(admin.equals("1")) {
            	%>
            	<li class="nav-item">
                	<a data-toggle="modal" href="#myModal" class="nav-link">관리자 권한 부여</a>
            	</li>
            	<%}%>
        	</ul>
    	</div>
	</nav>
    <% 	
    	}
	%>
  <form action="setadmin.jsp" method ="post">
	  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">관리자 등록</h4> <!-- 사용자 지정 부분② : 타이틀 -->
	        </div>
	        <div class="modal-body">
	          	<label for="userid">아이디
	          	<input type="text" name="userid" value="">
	          	</label> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-default">등록</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
  </form>
<br>
<div ><a href="main.jsp"><img src="<c:url value="/img/logo.png"/>"/></a></div>

  <div class="item1">
  <form onsubmit="return checkForm2();" class="form-inline" action="Productsalespage.jsp"><input class="form-control mr-sm-2 " name="search" type="search" placeholder="Search" aria-label="Search">
  <button class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;} float-right" type="submit">Search</button>
  </form>
 </div>
 
<script type="text/javascript">
   function checkForm2() {
      if (${id == null}) {
    	 alert("로그인 해주세요.");
    	 location.href ="http://localhost/VapeWeb/login.jsp";
    	 return false;
      } else {
		return true;
      }
   }
</script>

<script src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/jquery.modal.js"></script>
<script src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/modal.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="css/bootstrap.min.css"></script>