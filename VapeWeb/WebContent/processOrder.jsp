<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));

	cartId.setMaxAge(365 * 24 * 60 * 60); 
	response.addCookie(cartId);
	response.addCookie(shippingDate);


	response.sendRedirect("thank.jsp");
%>
