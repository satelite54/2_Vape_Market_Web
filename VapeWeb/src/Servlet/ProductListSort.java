package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.dao;
import DTO.Products;

/**
 * Servlet implementation class ProductListSort
 */
@WebServlet("/ProductListSort")
public class ProductListSort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListSort() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 1 낮은 가격 2 높은가격  3 신상품
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String producttype = request.getParameter("producttype");
		String Sortmethod = request.getParameter("orderbyint");
		String Search = request.getParameter("Search");
		List<Products> products = makeProductList(Sortmethod, producttype, Search);
		session.setAttribute("products", products);
		response.sendRedirect("Productsalespage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public List<Products> makeProductList(String Sortmethod, String producttype, String Search) {
		List<Products> products = new ArrayList<Products>();
		dao DAO = new dao();
		
		String OrderBy1 = " order by price asc";
		String OrderBy2 = " order by price desc";
		String OrderBy3 = " order by adddate asc";
		if(producttype == null) {
			producttype = "";
		}
		if(Sortmethod == null) {
			Sortmethod = "";
		}
		String WhereProducttype = " and producttype"+" like "+"'%"+ producttype +"%'";
		String whereProducttype1 = " where producttype"+" like "+"'%"+ producttype +"%'";
		if(Search != null) {
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
					products = DAO.makeProductsList("select *from products where pname like '%'"+ Search+ "%'"+ WhereProducttype +OrderBy3);
					return products;
				}
				default : {
					products = DAO.makeProductsList("select *from products where pname like '%'"+ Search+ "%'"+ WhereProducttype);
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
					products = DAO.makeProductsList("select * from products order by"+ whereProducttype1 + OrderBy2);
					return products;
				}
				case "3": {
					products = DAO.makeProductsList("select * from products order by"+ whereProducttype1 + OrderBy3);
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
