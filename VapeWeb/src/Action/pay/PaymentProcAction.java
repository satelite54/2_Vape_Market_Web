package Action.pay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class PaymentProcAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		//applynum값 & paid_amount값을 DB에 연동
		int applynum = Integer.parseInt(request.getParameter("apply_num"));
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		String msg = "카드승인번호 및 승인금액 : "+ applynum + " : "  + paid_amount;
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		pw.println("<script>");
		pw.println("alert("+ msg +");");
		pw.println("location.href = main.do");
		pw.println("<script/>");
		
		return null;
	}
	
}
