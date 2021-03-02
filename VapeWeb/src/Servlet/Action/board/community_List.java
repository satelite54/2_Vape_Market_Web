package Servlet.Action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;



	@WebServlet("/comminity_list.at")
	public class community_List extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;

	public community_List() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);




	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dao DAO = new Dao();
		request.setAttribute("list", DAO.getList());
		RequestDispatcher dis = request.getRequestDispatcher("community_list.at");
		dis.forward(request, response);


	}

}
