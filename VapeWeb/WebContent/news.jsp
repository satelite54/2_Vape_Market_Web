<%@page import="DTO.News"%>
<%@page import="crawl.naver"%>
<%@page import="org.apache.naming.HandlerRef"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
naver Naver = new naver();
News news = new News();
Naver.newsNaver();
%>

<body>
	<div>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">컨텐츠</th>
    </tr>
  </thead>
  <tbody>
  <%System.out.println(request.getAttribute("newsList"));%>
  <c:forEach var = "news" items="${newsList}" varStatus="vs">
    <tr>
      <th scope="row">${vs.count}</th>
      <td><a href="${news.href}">${news.title}</a></td>
      <td><a href="#">${news.content}</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
	
	</div>
</body>



