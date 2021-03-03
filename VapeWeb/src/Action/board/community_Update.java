package Action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;



	@WebServlet("/comminity_Update.at")
	public class community_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;

	public community_Update() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);




	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dao DAO = new Dao();


		String BTitle = request.getParameter("BTitle");
		String BContent= request.getParameter("BContent");
		int BNum = Integer.parseInt(request.getParameter("BNum"));

		DAO.updateBoard(BTitle, BContent, BNum);
		response.sendRedirect("communityenter.jsp");
	}

}
