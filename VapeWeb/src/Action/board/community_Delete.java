package Action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class community_Delete implements Location{
		@Override
		public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			LocationForward forward = new LocationForward();


			request.setCharacterEncoding("UTF-8");
			int BNum = 0;
			Dao DAO = new Dao();
			BNum = Integer.parseInt(request.getParameter("BNum"));
			DAO.deleteBoard(BNum);

			forward.setRedirect(false);
			forward.setNextPath("community.do");
			return forward;
		}


	}


