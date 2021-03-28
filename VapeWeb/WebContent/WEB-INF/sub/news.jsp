<%@page import="DTO.News"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/News.css" />
<body>
	<div class="wrap" style="margin-top: 50px">
	<c:forEach var="news" items="${newsList}" varStatus="vs">
		<div class="card" style="width: 340px; height: 190px; display: inline-block; text-align: center; justify-content: center; margin-left: 30px; margin-bottom: 20px; margin-top: 30px; position: fixed left: 50%;">
			<div class="card-body">
				<div>
					<p class="card-title" style="width: 300px;; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: center; margin-bottom: 5px;">
						<a href="${news.href}">${news.title}</a>
					</p>
				</div>
				<div>
					<p class="card-text" style="width: auto; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; text-align: center; margin-top: 15px;">
						<a href="${news.href}">${news.content}</a>
					</p>
				</div>
				<a href="${news.href}" class="btn btn-primary" style="margin-top: 25px;">본문보기</a>
			</div>
		</div>
	</c:forEach>
	</div>
</body>
<%@ include file="footer.jsp"%>



