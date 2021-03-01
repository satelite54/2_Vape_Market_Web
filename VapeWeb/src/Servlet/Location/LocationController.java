package Servlet.Location;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("*.do")
public class LocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LocationController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String requsetURI = request.getRequestURI();
		int cmdIdx = requsetURI.lastIndexOf("/") +1;
		String command = requsetURI.substring(cmdIdx);

		LocationForward forward = null;

		Location location = null;

		String sub =  "/WEB-INF/sub/";
		String board = "/WebContent/WEB-INF/board";
		String product = "/WebContent/WEB-INF/product";
		String user = "/WebContent/WEB-INF/user";
		String question = "/WebContent/WEB-INF/question";
		String review = "/WebContent/WEB-INF/review";
		
		try {// 화면전환
			switch (command) {
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
				}
				case "community.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(b + "main.jsp");
				}
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
				}
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
				}
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
				}
				break;
				
				default:
					break;
			}
			
			// 화면이동
			if(forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getNextPath());
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getNextPath());
					dispatcher.forward(request, response);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
