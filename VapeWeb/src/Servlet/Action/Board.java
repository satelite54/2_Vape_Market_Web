package Servlet.Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.dao;

	

	@WebServlet({ "/board" })
	public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;
	
	public Board() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		dao DAO = new dao();
		request.setAttribute("list", DAO.getList());
		RequestDispatcher dis = request.getRequestDispatcher("community.jsp");
		dis.forward(request, response);
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/************************************************************************************************************************/


}
