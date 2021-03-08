package Action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;



	public class community_Update implements Location{





		@Override
		public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LocationForward forward = new LocationForward();
			request.getSession();
			Dao dao = new Dao();
			String BNum= request.getParameter("BNum");
			String BTitle= request.getParameter("BTitle");
			String BContent = request.getParameter("BContent");


			dao.updateBoard(BTitle, BContent,Integer.parseInt(BNum));

			forward.setRedirect(false);
			forward.setNextPath("communityEnterAction.do");
			return forward;
		}

	}

