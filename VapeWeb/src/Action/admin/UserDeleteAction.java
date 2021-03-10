package Action.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class UserDeleteAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		
		forward.setNextPath("ProductManegerAction.do");
		forward.setRedirect(true);
		
		String[] userCheckBox = request.getParameterValues("UserCheck");
		Dao dao = new Dao();
		dao.deleteUser(userCheckBox);
		
		return forward;
	}
}
