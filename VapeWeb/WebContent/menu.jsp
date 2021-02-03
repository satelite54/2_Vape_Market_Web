<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.dao"%>	
<%-- <%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%> --%>
<style>

div {text-align: center;}
.form {
    float: right;
}
</style>
	<%
		String id = null;
		if	(session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
		}
	%>
    <%
    	if(id == null) {
   	%>		
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
            	    <a class="nav-link" href="login.jsp">로그인</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="join.jsp">회원가입</a>
	            </li>
    	        <li class="nav-item">
        	        <a class="nav-link" href="myshopping.jsp" onclick="checkForm(); return false;">나의 쇼핑</a>
	            </li>
    	    </ul>
    	</div>
	</nav>
	<%
    	} else {
    %>
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
            	    <a class="nav-link" href="logout.jsp">로그아웃</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="update.jsp">회원수정</a>
            	</li>
            	<li class="nav-item">
                	<a class="nav-link" href="myshopping.jsp">나의 쇼핑</a>
            	</li>
            	
        	</ul>
    	</div>
	</nav>
    <% 	
    	}
	%>

<br>
<div ><a href="main.jsp"><img src="<c:url value="/img/logo.png"/>"/></a></div>

  <div class="item1">
  <form onsubmit="checkForm();" class="form-inline" action="#"><input class="form-control mr-sm-2 " name="search" type="search" placeholder="Search" aria-label="Search">
  <button class="btn bg-dark text-white btn-outline-white my-2 my-sm-0 {background-color: #223a6b !important;} float-right" type="submit" onclick="sendit()">Search</button>
  </form>
 </div>

  
<script type="text/javascript">
   function checkForm() {
      if (sessionStorage.getItem("id") == null) {
    	 alert("로그인 해주세요.");
      }
   }
   
   function sendit(){
		location.href ="http://localhost/VapeWeb/main.jsp";
	}
</script>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="css/bootstrap.min.css"></script>