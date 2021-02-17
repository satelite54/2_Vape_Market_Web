<%@page import="org.apache.tomcat.util.buf.Utf8Encoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" href="css/custom.css">	
<%-- <%
	//로그인과정에서 저장된 세션 id를 가져온다. 없으면 null값.
	String sessionId = (String) session.getAttribute("sessionId");
%> --%>

<%! String hardware = "hardware";
	String liquid = "liquid";
	String coil = "coil";
	%>
<br>

<br>
<hr>

<div class="d-flex justify-content-around">
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=hardware%>')">하드웨어</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=liquid%>')">원본액상</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=coil%>')">코일</a></div>
  <div id="submenu"><a href="community.jsp">커뮤니티</a></div>
       
</div>
<hr>
<form name="frm">
	<input type="hidden" name="Producttype">
</form>
<%
	String id2 = (String)session.getAttribute("id");
%>

<script type="text/javascript">
   function checkForm(Producttype) {
      if (${id==null}) {
         alert("로그인 해주세요.");
         location.href = "login.jsp";
      } else if (${id != null}) {
    	  //alert("id가 들어왔음");
    	  f=document.frm;
    	  f.Producttype.value=Producttype;
    	  f.action = "ProductListSort";
    	  f.submit();
      }
   }
</script>









