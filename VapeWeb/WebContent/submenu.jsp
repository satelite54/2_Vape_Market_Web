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
	int nforhardware = 1;
	int nforliquid = 2;
	int nforcoil = 3;
	
	String Menuhardware_sql = "select * from products where producttype = 'hardware'";
	String Menuliquid_sql = "select * from products where producttype = 'liquid'";
	String Menucoil_sql = "select * from products where producttype = 'coil'";
	
	%>
<br>

<br>
<hr>

<div class="d-flex justify-content-around">
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=hardware%>','<%=nforhardware%>','<%="aaa"%>')">하드웨어</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=liquid%>','<%=nforliquid%>','<%="aaa"%>')">원본액상</a></div>
  <div id="submenu"><a href="#" onclick="javascript:checkForm('<%=coil%>','<%=nforcoil%>','<%="aaa"%>')">코일</a></div>
  <div id="submenu"><a href="community.jsp">커뮤니티</a></div>
       
</div>
<hr>
<form name="frm">
	<input type="hidden" name="producttype">
	<input type="hidden" name="orderbyint">
	<input type="hidden" name="sqlQuery">
</form>
<%
	String id2 = (String)session.getAttribute("id");
%>

<script type="text/javascript">
   function checkForm(producttype,orderbyint,sqlQuery) {
      if (${id==null}) {
         alert("로그인 해주세요.");
         location.href = "login.jsp";
      } else if (${id != null}) {
    	  //alert("id가 들어왔음");
    	  f=document.frm;
    	  f.producttype.value=producttype;
    	  f.orderbyint.value=orderbyint;
    	  f.sqlQuery.value=sqlQuery;
    	  f.action = "Productsalespage.jsp";
    	  f.submit();
      }
   }
</script>









