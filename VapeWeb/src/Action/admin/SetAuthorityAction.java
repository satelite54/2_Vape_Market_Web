package Action.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class SetAuthorityAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		Dao DAO = new Dao();

		String id = (String) request.getParameter("userid");
		int setadmin = DAO.setadmin(id);

		if (setadmin == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('" + id + "님이 관리자 권한을 획득하셨습니다." + "')");
			script.println("location.href = 'main.do'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자 권한 부여 취소')");
			script.println("location.href = 'main.do'");
			script.println("</script>");
		}


		return null;
	}


}
