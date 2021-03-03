package Action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class UpdateAction implements Location {
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward(); //// 필수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		Dao userDAO = new Dao();
		Users user = new Users();

		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setBirthday(request.getParameter("birthday"));
		user.setZip(request.getParameter("zip"));
		user.setStreet(request.getParameter("street"));
		user.setBuilding(request.getParameter("building"));
		user.setMobile(request.getParameter("mobile"));
		user.setAdmin(Integer.parseInt(request.getParameter("admin")));
		user.setAuthority(Integer.parseInt(request.getParameter("authority")));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));

		int Updateresult = userDAO.set_update(user, session);

		PrintWriter pw = response.getWriter();
		if(Updateresult > 0) {
			pw.println("<script>");
			pw.println("alert('수정이 완료되었습니다.')");
//			pw.println("location.href = 'main.do'");
			pw.println("</script>");
		} else if(Updateresult == 0) {
			pw.println("<script>");
			pw.println("alert('수정사항이 적용 안됬습니다. 잠시 후 시도해 주세요.')");
//			pw.println("location.href = 'main.do'");
			pw.println("</script>");
		}
			forward.isRedirect();
			forward.setRedirect(false);
			forward.setNextPath("main.do");
			return forward;
	}
}
