package Servlet.Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;

/**
 * Servlet implementation class reviewAction
 */
@WebServlet("/reviewAction")
public class reviewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reviewAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("id");
		String RTitle = request.getParameter("RTitle");
		String RContent = request.getParameter("RContent");
		DAO.Dao dao = new Dao();
		dao.writeReview(RTitle, RContent, id);
		int RNum = dao.getRNum() - 1;
		response.sendRedirect("Productdetailpage.do?RNum=" + RNum);
	}

}
