package Action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class LoginAction implements Location {
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		
		Users user = new Users();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));

		HttpSession session = request.getSession();
		String id = null;
		if	(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		
		Dao userDAO = new Dao();
		int result = userDAO.login(user.getId(), user.getPw());
		int admin = userDAO.getadmin(user.getId());
		if (result == 1) {
			session.setAttribute("id", user.getId());
			if(admin == 1)
				session.setAttribute("admin", String.valueOf(admin));
			session.setMaxInactiveInterval(30*60);
			forward.setNextPath("main.do");
			forward.setRedirect(false);
			return forward;//// 필수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("location.href = 'login.do'");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("location.href = 'login.do'");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("location.href = 'login.do'");
			script.println("</script>");
		}
		
		return null;//// 필수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	}
}
