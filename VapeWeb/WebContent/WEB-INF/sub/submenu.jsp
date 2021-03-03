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
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=hardware%>','<%=1%>', '<%=" "%>', '<%=1%>' , '<%=1%>')">하드웨어</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=liquid%>','<%=1%>', '<%=" "%>', '<%=1%>' , '<%=1%>')">원본액상</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=coil%>','<%=1%>', '<%=" "%>', '<%=1%>' , '<%=1%>')">코일</a></div>
  <div id="submenu"><a href="communityListAction.do?page=1">커뮤니티</a></div>
  <div id="submenu"><a href="#" onclick="javascript:NewPageMove()">뉴스</a></div>
</div>
<hr>
<%
	String id2 = (String)session.getAttribute("id");
%>

	<form name="frm">
		<input type="hidden" name="Producttype">
		<input type="hidden" name="Sortmethod">
		<input type="hidden" name="Search">
		<input type="hidden" name="Page">
		<input type="hidden" name="NowPageNum">
	</form>

	<form name="frmforNews">

	</form>

<script type="text/javascript">
   function checkForm(Producttype, Sortmethod, Search, Page, NowPageNum) {
      if (${id==null}) {
         alert("로그인 해주세요.");
         location.href = "login.do";
      } else if (${id != null}) {
    	  //alert("id가 들어왔음");
    	  f=document.frm;
    	  f.Producttype.value=Producttype;
    	  f.Sortmethod.value=Sortmethod;
    	  f.Search.value=Search;
    	  f.Page.value=Page;
    	  f.NowPageNum.value=NowPageNum;
    	  f.action = "productdetailpageAction.do";
    	  f.submit();
      }
   }
</script>
<script type="text/javascript">
   function NewPageMove() {
      if (${id==null}) {
         alert("로그인 해주세요.");
         location.href = "login.do";
      } else if (${id != null}) {
    	  f=document.frmforNews;
    	  f.action = "news.do";
    	  f.submit();
      }
   }
</script>









