package Action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class ReviewWriteAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		LocationForward forward = new LocationForward();
		
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id =(String)session.getAttribute("id");
		String RTitle = request.getParameter("RTitle");
		String RContent = request.getParameter("RContent");
		Dao dao = new Dao();
		dao.writeReview(RTitle, RContent, id);
		int RNum = dao.getRNum() - 1;
		
		request.setAttribute("RNum", dao);
		
		forward.setNextPath("productdetailpage.do");
		forward.setRedirect(false);
		
		return forward;
	}
}
