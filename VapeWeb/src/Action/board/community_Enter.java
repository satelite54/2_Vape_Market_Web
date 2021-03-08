package Action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Board;
import DTO.Users;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class community_Enter implements Location{
@Override
public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	LocationForward forward = new LocationForward();
	HttpSession session = request.getSession();

	request.setCharacterEncoding("UTF-8");

		Board board = new Board();
		Dao dao = new Dao();

		int BNum = 0;

			if(request.getParameter("displayEdit") == null) {

			}

			if (request.getParameter("BNum") != null){
		 	BNum = Integer.parseInt(request.getParameter("BNum"));
		 	System.out.println(BNum) ;
		 }

		 if (BNum == 0) {
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('유효하지 않은 글 입니다.')");
			 script.println("<location.href = 'community.do'");
			 script.println("</script>");
		 }


		board = dao.getBoard(BNum);
		request.setAttribute("board", board);
		session.setAttribute("admin", String.valueOf(dao.getadmin((String) request.getAttribute("id"))));


		forward.setRedirect(false);
		forward.setNextPath("communityEnter.do");
	return forward;
}
}
