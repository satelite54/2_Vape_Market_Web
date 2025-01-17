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

public class UserlistAction implements Location {

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	Dao dao = new Dao();
	HttpSession session = request.getSession();
		LocationForward forward = new LocationForward();
		Users user = dao.getUserList(session);
		request.setAttribute("userList", dao.getUserList(session));
		forward.setNextPath("update.do");
		forward.isRedirect();
		forward.setRedirect(false);
		return forward;
	}


}
