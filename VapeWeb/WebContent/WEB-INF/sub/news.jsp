<%@page import="DTO.News"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<c:forEach var="news" items="${newsList}" varStatus="vs">
		<div class="card" style="width: 400px; height: 150px; text-align: center; position: static; display: inline-flex; align-items: center; justify-content: center; text-align: center;">
			<div class="card-body">
				<div>
					<p class="card-title" style="width: 300px;; overflow: hidden; text-overflow: ellipsis;; white-space: nowrap; text-align: center; margin-left: 35px; margin-bottom: 5px;">
						<a href="${news.href}">${news.title}</a>
					</p>
				</div>
				<div style="position: relative">
					<p class="card-text" style="width: inherit; overflow: hidden; text-overflow: ellipsis;; white-space: nowrap; text-align: center; margin-left: 35px; margin-bottom: 5px;">
						<a href="${news.href}">${news.content}</a>
					</p>
				</div>
				<a href="${news.href}" class="btn btn-primary">본문보기</a>
			</div>
		</div>
	</c:forEach>  
</body>
<%@ include file="footer.jsp"%>



