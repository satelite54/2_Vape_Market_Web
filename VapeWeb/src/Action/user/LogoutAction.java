package Action.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class LogoutAction implements Location{

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		LocationForward forward = new LocationForward();
		session.invalidate();
		forward.setRedirect(true);
		forward.setNextPath("main.do");
		return forward;
	}

}
