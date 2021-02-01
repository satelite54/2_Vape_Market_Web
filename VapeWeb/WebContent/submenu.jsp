<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%-- <%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%> --%>
<%! String hardware = "hardware";
	String liquid = "liquid";
	String coil = "coil";
	int nforhardware = 1;
	int nforliquid = 2;
	int nforcoil = 3;
	%>
<br>

<br>
<hr>

<div class="d-flex justify-content-around">

<div id="submenu"><a href="Productsalespage.jsp?producttype=<%=hardware%>&orderbyint=<%=nforhardware%>&sqlQuery=<%="select * from products where producttype = 'hardware'"%>">하드웨어</a></div>
  <div id="submenu"><a href="Productsalespage.jsp?producttype=<%=liquid%>&orderbyint=<%=nforliquid%>&sqlQuery=<%="select * from products where producttype = 'liquid'"%>">원본액상</a></div>
  <div id="submenu"><a href="Productsalespage.jsp?producttype=<%=coil%>&orderbyint=<%=nforcoil%>&sqlQuery=<%="select * from products where producttype = 'coil'"%>">코일</a></div>
  <div id="submenu"><a href="community.jsp">커뮤니티</a></div>

</div>
<hr>
