<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JASET VAPE</title>
</head>

<body>
<jsp:include page="./menu.jsp" flush="true"/>
<jsp:include page="./submenu.jsp" flush="true"/>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>

  <div class="carousel-inner">
		   <div class="carousel-item active">
		      <img class="d-block w-100" src="${pageContext.request.contextPath}/img/main1.jpg" alt="First slide">
		      	<div class="carousel-caption d-none d-md-block">
			    <h5>JASET VAPE홈페이지 </h5>
			    <p>앞으로 많은 신상으로 찾아뵙겠습니다.</p>
				</div>
			</div>

    <div class="carousel-item">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/img/main2.jpg" alt="Second slide">
			<div class="carousel-caption d-none d-md-block">
			    <h5>JASET VAPE만의 특별함</h5>
			    <p>타사와는 비교안되는 퀄리티를 추구합니다.</p>
			</div>
    </div>

    <div class="carousel-item">
      <img class="d-block w-100" src="${pageContext.request.contextPath}/img/main3.jpg" alt="Third slide">
			<div class="carousel-caption d-none d-md-block">
			    <h5>JASET VAPE만의 특별함</h5>
			    <p>타사와는 비교안되는 퀄리티를 추구합니다.</p>
			</div>
    </div>
  </div>

				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>

				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
			   </div>





<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="css/bootstrap.min.css"></script>

<jsp:include page="./footer.jsp" flush="true"/>
</body>

</html>