package Servlet.Action.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DUser")
public class user_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public user_Delete() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] userCheckBox = request.getParameterValues("UserCheck");
		delete(userCheckBox);
		response.sendRedirect("UList");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	private void delete(String[] userCheckBox) {
		Dao dao = new Dao();
		dao.deleteUser(userCheckBox);
	}
}
