package Action.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Products;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class ProductListSortAction implements  Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();

		HttpSession session = request.getSession();
		String producttype = request.getParameter("Producttype");
		String Sortmethod = request.getParameter("Sortmethod");
		String Search = request.getParameter("Search");
		String Page = request.getParameter("Page");
		String NowPageNum = request.getParameter("NowPageNum");
		if(Page == null) {
			Page = "1";
		}
		if(NowPageNum == null) {
			NowPageNum = "1";
		}

		List<Products> checkproducts = (List<Products>) session.getAttribute("products");
		if(checkproducts != null) {
			if(!checkproducts.isEmpty() && Search.equals("???") && producttype.equals("Common")) {
//				response.sendRedirect("Productsalespage.jsp?Producttype="+producttype+"&Sortmethod="+Sortmethod+"&Search="+Search +"&Page="+Page +"&NowPageNum="+NowPageNum);
				forward.setRedirect(false);
				forward.setNextPath("productsalespage.do");
				return forward;
			}
		}
		List<Products> products = makeProductList(Sortmethod, producttype, Search);
		Page = String.valueOf(products.size()/10 + 1);
		session.setAttribute("products", products);
//		response.sendRedirect("Productsalespage.jsp?Producttype="+producttype+"&Sortmethod="+Sortmethod+"&Search="+Search +"&Page="+Page +"&NowPageNum="+NowPageNum);
		forward.setRedirect(false);
		forward.setNextPath("productsalespage.do");
		return forward;
	}

	public List<Products> makeProductList(String Sortmethod, String producttype, String Search) {
		List<Products> products = new ArrayList<Products>();
		Dao DAO = new Dao();

		String OrderBy1 = " order by price asc";
		String OrderBy2 = " order by price desc";
		String OrderBy3 = " order by adddate asc";
		if(producttype == null) {
			producttype = "";
		}
		if(Sortmethod == null) {
			Sortmethod = "";
		}
		if(Search == null || Search == "???") {
			Search =" ";
		}
		if(producttype.equals("Common"))
			producttype = "";
		String WhereProducttype = " and producttype"+" like "+"'%"+ producttype +"%'";
		String whereProducttype1 = " where producttype"+" like "+"'%"+ producttype +"%'";
		if(Search != "") {
				if(Search == " ")
					Search = "";
			switch (Sortmethod) {
				case "1": {
					products = DAO.makeProductsList("select * from products where pname like '%"+ Search +"%'"+ WhereProducttype + OrderBy1);
					return products;
				}
				case "2": {

					products = DAO.makeProductsList("select * from products where pname like '%"+ Search +"%'"+ WhereProducttype + OrderBy2);
					return products;
				}
				case "3": {
					products = DAO.makeProductsList("select * from products where pname like '%"+ Search+ "%'"+ WhereProducttype +OrderBy3);
					return products;
				}
				default : {
					products = DAO.makeProductsList("select * from products where pname like '%"+ Search+ "%'"+ WhereProducttype);
					return products;
				}
			}
		} else {
			switch (Sortmethod) {
				case "1": {
					products = DAO.makeProductsList("select * from products"+ whereProducttype1 + OrderBy1);
					return products;
				}
				case "2": {
					products = DAO.makeProductsList("select * from products"+ whereProducttype1 + OrderBy2);
					return products;
				}
				case "3": {
					products = DAO.makeProductsList("select * from products"+ whereProducttype1 + OrderBy3);
					return products;
				}
				default : {
					products = DAO.makeProductsList("select * from products"+ whereProducttype1);
					return products;
				}
			}
		}
	}
}
