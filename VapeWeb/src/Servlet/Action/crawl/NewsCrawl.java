package Servlet.Action.crawl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crawl.naver;

/**
 * Servlet implementation class NewsCrawl
 */
@WebServlet("/NewsCrawl")
public class NewsCrawl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewsCrawl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		naver Naver = new naver();
		Naver.newsNaver();
		request.setAttribute("NewsList", Naver.newsNaver());
		RequestDispatcher dis= request.getRequestDispatcher("news.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}