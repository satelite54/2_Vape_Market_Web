package Servlet.Action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Users;

@WebServlet("/login.at")
public class user_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public user_Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Users user = new Users();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));

		HttpSession session = request.getSession();
		String id = null;
		if	(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		if	(id != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.do'");
			script.println("</script>");
		}
		Dao userDAO = new Dao();
		int result = userDAO.login(user.getId(), user.getPw());
		int admin = userDAO.getadmin(user.getId());
		if (result == 1) {
			session.setAttribute("id", user.getId());
			if(admin == 1)
				session.setAttribute("admin", String.valueOf(admin));
			session.setMaxInactiveInterval(30*60);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.do'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
}
