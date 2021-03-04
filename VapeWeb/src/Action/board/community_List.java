package Action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Util.Paging;
import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

	public class community_List implements Location{
		@Override
		public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LocationForward forward = new LocationForward();

			Dao dao = new Dao();
			Paging page = new Paging();
			
			
			int nowpage = 0;
			String strPage = request.getParameter("page");
			if(strPage == null) {

			} else {
				nowpage = Integer.parseInt(strPage);
				if(nowpage < 1)
					nowpage = 1;
			}
			page.makeBlock(nowpage);
			page.makeLastPageNum();

			request.setAttribute("page", page);
			request.setAttribute("BoardList", dao.getList());

			forward.setRedirect(false);
			forward.setNextPath("community.do");
			return forward;
		}
	}




