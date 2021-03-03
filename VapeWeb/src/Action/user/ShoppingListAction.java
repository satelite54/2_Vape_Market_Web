package Action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Orders;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class ShoppingListAction implements Location {

	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		HttpSession session;
		session = request.getSession();
		Dao DAO = new Dao();

		request.setCharacterEncoding("UTF-8");

		String cartID = session.getId(); // ${}
		String idx = (String) session.getAttribute("id");

		List<String> list = (List<String>) session.getAttribute("list");
		if (list == null) {

			list = new ArrayList<String>();

		}

		list.add((String) session.getAttribute("pname"));
		list.add(request.getParameter("countresult"));
		list.add((String) session.getAttribute("price"));

		int listSize = list.size();

		for (int i = listSize - 1; i >= 0; i--) {

			if (list.get(i) == null)
			list.remove(i);

		}

		session.setAttribute("list", list);

		String temp = request.getParameter("id");

		if (temp == null) {
			temp = "1";
		}
		if (temp.equals("0")) {
			for (int i = list.size() - 1; i >= 0; i--) {

				list.remove(i);

			}
			session.setAttribute("list", list);
		}
		int Deletenumber = 0; // ${ }
		request.setAttribute("Deletenumber", Deletenumber);
		request.setAttribute("CartID", cartID);


		ArrayList<Orders> Olist = DAO.getOrderList((String)session.getAttribute("id"));
		request.setAttribute("Olist", Olist);

		forward.setRedirect(false);
		forward.setNextPath("myshopping.do");
		return forward;
	}

}
