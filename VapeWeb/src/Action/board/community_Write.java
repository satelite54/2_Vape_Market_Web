package Action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;


public class community_Write implements Location {

		@Override
		public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LocationForward forward = new LocationForward();
			HttpSession session;
			session = request.getSession();


			String id =(String)session.getAttribute("id");
			String BTitle = request.getParameter("BTitle");
			String BContent = request.getParameter("BContent");

			Dao dao = new Dao();

			dao.boardWrite(BTitle, BContent, id);
 			int BNum = (dao.getBNum()-2);
			String sBNum = Integer.toString(BNum);


			forward.setRedirect(false);
			forward.setNextPath("communityEnterAction.do?pageNum=1&BNum="+sBNum);
			return forward;
		}

	}

