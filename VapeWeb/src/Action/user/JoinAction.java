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

public class JoinAction implements Location{

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		Dao dao = new Dao();
		Users user = new Users();
		HttpSession session;
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("name"));
		user.setAdmin(0);
		user.setAuthority(1);
		user.setZip(request.getParameter("zip"));
		user.setStreet(request.getParameter("street"));
		user.setBuilding(request.getParameter("building"));
		user.setBirthday(request.getParameter("birthday"));
		user.setMobile(request.getParameter("mobile"));
		
		
		
		
		
		
		if	(session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
		}
		
		if	(id != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		}
		
		if (user.getName() == null || user.getId() == null || user.getPw() == null || user.getZip() == null || user.getStreet() == null || user.getBuilding() == null || user.getMobile() == null || user.getBirthday() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		} 
		
		else {
		Dao userDAO = new Dao();
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.do'");
			script.println("</script>");
		}

		}
		
		
		forward.setRedirect(false);
		forward.setNextPath("main.do");
		return forward;
	}

}
