<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">	
	<title>JASET VAPE</title>
	
</head>

<body>

<%@ include file="menu.jsp" %>


<style>
#pointer {
  width: 200px;
  height: 40px;
  position: relative;
  background: #223a6b;
}
#pointer:after {
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  width: 0;
  height: 0;
  border-left: 20px solid white;
  border-top: 20px solid transparent;
  border-bottom: 20px solid transparent;
}
#pointer:before {
  content: "";
  position: absolute;
  right: -20px;
  bottom: 0;
  width: 0;
  height: 0;
  border-left: 20px solid #223a6b;
  border-top: 20px solid transparent;
  border-bottom: 20px solid transparent;
}
  
</style>
<br>
<br>
<div id="pointer"><p style="color:white; font-size: x-large;">마이 쇼핑</div>


							
		
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

</body>

</html>