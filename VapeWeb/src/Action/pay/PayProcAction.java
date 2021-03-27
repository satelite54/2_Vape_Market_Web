package Action.pay;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class PayProcAction implements Location {
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		
	     String name = (String)request.getParameter("name");
	     String email = (String)request.getParameter("email");
	     String mobile = (String)request.getParameter("mobile");
	     String address = (String)request.getParameter("address");
	     String stotalPrice = (String)request.getParameter("totalPrice");
	     String zip = (String)request.getParameter("zip");
	     int totalPrice = Integer.parseInt(stotalPrice);
		
//	     if(email.contains("@")) {
//	    	 for(int i = 0; i < email.length(); i++) {
//	    		 if(email.charAt(i) == '@') {
//	    			 email = email.replace("@", "&#64;");
//	    		 }
//	    	 }
//	     }
	     
	     request.setAttribute("name", name);
	     request.setAttribute("email", email);
	     request.setAttribute("mobile", mobile);
	     request.setAttribute("address", address);
	     request.setAttribute("totalPrice", totalPrice);
	     request.setAttribute("zip", zip);
	     
	     forward.setRedirect(false);
	     
	     forward.setNextPath("payProc.do");
	     
		return forward;
	}
}
