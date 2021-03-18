package Action.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Servlet.Location.Location;
import Servlet.Location.LocationForward;
import question.QuestionMgr;

public class QuestionAnserWriteAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		forward.setNextPath("productdetailpage.do");
		forward.setRedirect(false);
		
		request.setCharacterEncoding("UTF-8");
		QuestionMgr mgr = new QuestionMgr();
		mgr.insertQuestion(request);
		
		
		return forward;
	}
}
