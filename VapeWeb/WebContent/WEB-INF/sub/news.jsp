<%@page import="DTO.News"%>
<%@page import="Servlet.Action.crawl.naver"%>
<%@page import="org.apache.naming.HandlerRef"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<body>
	<c:forEach var="news" items="${NewsList}" varStatus="vs">
			<div class="card" style="
			  	width: 400px;
			  	height: 300px;
			  	text-align:center;
			  	position:static;
				display:inline-flex;
				align-items:center;
				justify-content: center

			">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<div>
					<p class="card-title"
					style="width:100px;
					overflow:hidden;
					text-overflow:ellipsis;
					white-space:nowrap;
					text-align: center;
					margin-left: 35px;
					margin-bottom: 5px">
						<a href="${news.href}">${news.title}</a>
					</p>
					</div>
					<div style="
					position: relative;
					">
					<p class="card-text"
					style="width:100px;
					overflow:hidden;
					text-overflow:ellipsis;
					white-space:nowrap;
					text-align: center;
					margin-left: 35px;
					margin-bottom: 5px">
						<a href="${news.href}">${news.content}</a>
					</p>
					</div>
					<a href="${news.href}" class="btn btn-primary">본문보기</a>
				</div>
			</div>
	</c:forEach>


	<!--
	<div>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">컨텐츠</th>
    </tr>
  </thead>
  <tbody>

    <tr>
      <th scope="row">${vs.count}</th>
      <td><a href="${news.href}">${news.title}</a></td>
      <td><a href="#">${news.content}</a></td>
    </tr>

  </tbody>
</table>

	</div>
	-->
</body>



