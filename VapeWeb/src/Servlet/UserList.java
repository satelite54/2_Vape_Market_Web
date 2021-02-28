package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.Users;

/**
 * Servlet implementation class UserList
 */
@WebServlet("/UList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserList() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("AllUsersList", getAllUsersList());
		RequestDispatcher dis= request.getRequestDispatcher("ProductManeger.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	private List<Users> getAllUsersList() {
		Dao dao = new Dao();
		List<Users> list = dao.getAllUserList();
		return list;
	}
}
