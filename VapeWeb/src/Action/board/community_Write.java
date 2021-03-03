package Action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;

@WebServlet("/community_Wrtie.at")
public class community_Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public community_Write() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	public void doProcess(HttpServletRequest request , HttpServletResponse response , HttpSession session) throws ServletException , IOException{

		String id =(String)session.getAttribute("id");
		String BTitle = request.getParameter("BTitle");
		String BContent = request.getParameter("BContent");
		Dao dao = new Dao();
		dao.write(BTitle, BContent, id);
		int BNum = dao.getBNum() - 1;
		response.sendRedirect("communityenter.jsp?BNum=" + BNum);
	}

}
