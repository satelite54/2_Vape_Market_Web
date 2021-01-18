<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="#">로그인<span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="#">회원가입</a>
      <a class="nav-item nav-link" href="#">나의 쇼핑</a>
    </div>
  </div>
</nav>
<div class="container">
<img src="<c:url value="/img/logo.png"/>"/>
<nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
</nav>

</div>