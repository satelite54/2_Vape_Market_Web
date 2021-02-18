<%@page import="org.apache.naming.HandlerRef"%>
<%@page import="crawl.naver"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="menu.jsp"%>
<%@ include file="submenu.jsp"%>

<%
	naver Naver = new naver();
	Naver.newsList();
	ArrayList hrefList = new ArrayList();
	ArrayList titleList = new ArrayList();
	for(int i = 0 ; i < newsList.size(); i++){
		titleList.add(i, newsList.get(i));
		hrefList.add(i, newsList.get(i));
	}
%>

<body>
	<div>
		<p>
			<a href="<%=newsList.get(i) %>"><%= newsList %></a>
		</p>
		}
	</div>
</body>