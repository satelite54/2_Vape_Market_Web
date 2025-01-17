package Servlet.Location;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.admin.GetUserListAction;
import Action.admin.ProductAction;
import Action.admin.SetAuthorityAction;
import Action.admin.UserDeleteAction;
import Action.board.QuestionAnserWriteAction;
import Action.board.ReviewWriteAction;
import Action.board.community_Delete;
import Action.board.community_Enter;
import Action.board.community_List;
import Action.board.community_Update;
import Action.board.community_Write;
import Action.crawl.NewsListAction;
import Action.pay.PayProcAction;
import Action.pay.ThankAction;
import Action.product.ProductListSortAction;
import Action.user.DeleteAction;
import Action.user.JoinAction;
import Action.user.LoginAction;
import Action.user.LogoutAction;
import Action.user.ShoppingListAction;
import Action.user.UpdateAction;
import Action.user.UserlistAction;

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
		response.setContentType("text/html;");
		Location location = null;

		String sub =  "/WEB-INF/sub/";
		String board = "/WEB-INF/board/";
		String product = "/WEB-INF/product/";
		String user = "/WEB-INF/user/";
		String question = "/WEB-INF/question/";
		String review = "/WEB-INF/review/";
		String pay = "/WEB-INF/pay/";

		HttpSession session = request.getSession();
		List<String> templist = (List<String>) session.getAttribute("list");
		
		try {// 화면전환
			switch (command) {
				case "main.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "main.jsp");
					break;
				}
				case "submenu.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(sub + "submenu.jsp");
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
				case "productsalespage.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(product + "Productsalespage.jsp");
					break;
				}
				case "productdetailpage.do": {
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
					forward.setNextPath(board + "communityenter.jsp");
					break;
				}
				case "communityWrite.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
 					forward.setNextPath(board + "communitywrite.jsp");
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
				case "reviewView.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(review + "reviewView.jsp");
					break;
				}
				case "payProc.do": {
					forward= new LocationForward();
					forward.setRedirect(false);
					forward.setNextPath(pay + "payProc.jsp");
					break;
				}
				case "loginAction.do": { // 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					location = new LoginAction();// 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					forward = location.execute(request, response);// 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					break;
				}
				case "logoutAction.do": { // 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					location = new LogoutAction();// 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					forward = location.execute(request, response);// 액션쪽 필수 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					break;
				}
				case "userlistAction.do":{
					location = new UserlistAction();
					forward = location.execute(request, response);
					break;
				}
				case "updateAction.do":{
					location = new UpdateAction();
					forward = location.execute(request, response);
					break;
				}
				case "deleteAction.do":{
					location = new DeleteAction();
					forward = location.execute(request, response);
					break;
				}
				case "setauthorityAction.do":{
					location = new SetAuthorityAction();
					forward = location.execute(request, response);
					break;
				}
				case "productdetailpageAction.do":{
					location = new ProductListSortAction();
					forward = location.execute(request, response);
					break;
				}

				case "communityListAction.do": {
					location = new community_List();
					forward = location.execute(request, response);
					break;
				}
				case "communityEnterAction.do": {
					location = new community_Enter();
					forward = location.execute(request, response);
					break;
				}
				case "communityUpdateAction.do": {
					location = new community_Update();
					forward = location.execute(request, response);
					break;
				}
				case "communityWriteAction.do": {
					location = new community_Write();
					forward = location.execute(request, response);
					break;
				}
				case "communityDeleteAction.do": {
					location = new community_Delete();
					forward = location.execute(request, response);
					break;
				}
				case "ProductManegerAction.do": {
					location = new GetUserListAction();
					forward = location.execute(request, response);
					break;
				}
				case "UserManegerDeleteAction.do" : {
					location = new UserDeleteAction();
					forward = location.execute(request, response);
					break;
				}
				case "ProductIDUManegerAction.do" : {
					location = new ProductAction();
					forward = location.execute(request, response);
					break;
				}
				case "userJoinAction.do" : {
					location = new JoinAction();
					forward = location.execute(request, response);
					break;
				}
				case "reviewWriteAction.do" : {
					location = new ReviewWriteAction();
					forward = location.execute(request, response);
					break;
				}
				case "QuestionAnserWriteAction.do" : {
					location = new QuestionAnserWriteAction();
					forward = location.execute(request, response);
					break;
				}
				case "NewsListAction.do" : {
				    location = new NewsListAction();
				    forward = location.execute(request, response);
				    break;
				}
				case "ShoppingListAction.do" : {
					location = new ShoppingListAction();
					forward = location.execute(request, response);
					break;
				}
				case "PayProcAction.do" : {
					location = new PayProcAction();
					forward = location.execute(request, response);
					break;
				}
				case "ThankAction.do" : {
					location = new ThankAction();
					forward = location.execute(request, response);
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
