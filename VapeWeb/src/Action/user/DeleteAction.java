package Action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class DeleteAction implements Location {

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		Dao dao = new Dao();
		HttpSession session;
		session = request.getSession();

		String[] strTemp = request.getParameterValues("UserCheck");

		if (strTemp == null) {
			dao.deleteUser(session);
			session.invalidate();
		} else {
			dao.deleteUser(strTemp);
		}

		forward.setNextPath("main.do");
		forward.isRedirect();
		forward.setRedirect(false);
		return forward;
	}

}
