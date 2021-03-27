package Action.pay;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Orders;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class ThankAction implements Location {
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		
		Dao DAO = new Dao();
		String Date = DAO.Day2();
		
		HttpSession session = request.getSession();
		String cartID = session.getId();
		DAO.upDateOrder((String)session.getAttribute("id"), session);
		
		forward.setRedirect(false);
		forward.setNextPath("thank.do");
		
		return forward;
	}
}
