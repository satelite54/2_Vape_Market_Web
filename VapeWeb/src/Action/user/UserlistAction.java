package Action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class UserlistAction implements Location {

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		request.setAttribute("AllUsersList", getAllUsersList());
		forward.setNextPath("update.do");
		forward.isRedirect();
		forward.setRedirect(false);
		return forward;
	}

	public List<Users> getAllUsersList() {
		Dao dao = new Dao();
		List<Users> list = dao.getAllUserList();
		return list;
	}

}
