package Action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class GetUserListAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dao dao = new Dao();
		LocationForward forward = new LocationForward();
		
		List<Users> users = dao.getAllUserList();
		request.setAttribute("UserList", users);
		
		forward.setNextPath("ProductManeger.do");
		forward.setRedirect(false);
		return forward;
	}
}
