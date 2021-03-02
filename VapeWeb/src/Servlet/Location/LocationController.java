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
//		String cmdIdx = request.getContextPath();
//		String command= requsetURI.substring(cmdIdx.length());
		int cmdIdx = requsetURI.lastIndexOf("/") +1;
		String command = requsetURI.substring(cmdIdx);

		LocationForward forward = null;

		Location location = null;

		String sub =  "/WEB-INF/sub/";
		String board = "/WEB-INF/board/";
		String product = "/WEB-INF/product/";
		String user = "/WEB-INF/user/";
		String question = "/WEB-INF/question/";
		String review = "/WEB-INF/review/";
		
		try {// 화면전환
			switch (command) {
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
					break;
				}
				case "header.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "header.jsp");
					break;
				}
				case "footer.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "footer.jsp");
					break;
				}
				case "menu.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "menu.jsp");
					break;
				}
				case "news.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "news.jsp");
					break;
				}
				case "Productsalespage.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(product + "Productsalespage.jsp");
					break;
				}
				case "Productdetailpage.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(product + "Productdetailpage.jsp");
					break;
				}
				case "ProductManeger.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(product + "ProductManeger.jsp");
					break;
				}
				case "review.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(product + "review.jsp");
					break;
				}
				case "community.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(board + "community.jsp");
					break;
				}
				case "communityEnter.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(board + "communityEnter.jsp");
					break;
				}
				case "communityWrite.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(board + "communityWrite.jsp");
					break;
				}
				case "communityUpdate.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(board + "communityUpdate.jsp");
					break;
				}
				case "join.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(user + "join.jsp");
					break;
				}
				case "login.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(user + "login.jsp");
					break;
				}
				case "myshopping.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(user + "myshopping.jsp");
					break;
				}
				case "update.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(user + "update.jsp");
					break;
				}
				case "thank.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(user + "thank.jsp");
					break;
				}
				
				
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
