<%@ page contentType="text/html; charset=UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		//applynum값 & paid_amount값을 DB에 연동
		int applynum = Integer.parseInt(request.getParameter("apply_num"));
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		String msg = "카드승인번호 및 승인금액 : "+ applynum + " : "  + paid_amount;
		
%>
<script>
	alert("<%=msg%>");
	location.href="<%=request.getContextPath()%>/importEx/payForm.jsp";
</script>