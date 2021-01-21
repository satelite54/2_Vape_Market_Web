<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%>
<style>

div {text-align: center;}
.form {
    float: right;
}
</style>

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
                <a class="nav-link" href="#">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">회원가입</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="myshopping.jsp">나의 쇼핑</a>
            </li>
     
        </ul>
    </div>
</nav>

<br>
<div ><a href="main.jsp"><img src="<c:url value="/img/logo.png"/>"/></a></div>

  <div class="item1">
  <form class="form-inline "><input class="form-control mr-sm-2 " type="search" placeholder="Search" aria-label="Search">
  <button class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;}" type="submit">Search</button>
  </form>
 </div>
