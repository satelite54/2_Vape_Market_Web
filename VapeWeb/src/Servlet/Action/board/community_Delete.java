package Servlet.Action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;

@WebServlet("/community_DeleteAction.at")
public class community_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public community_Delete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	public void doProcess(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{

		request.setCharacterEncoding("UTF-8");

		int BNum = 0;
		Dao DAO = new Dao();

		BNum = Integer.parseInt(request.getParameter("BNum"));
		System.out.println("BNum = " + BNum);
		DAO.deleteBoard(BNum);
		response.sendRedirect("community.jsp");

	}

}
