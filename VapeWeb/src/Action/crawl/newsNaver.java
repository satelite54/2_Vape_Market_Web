package Action.crawl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.News;
import crawl.naver;

@WebServlet("/nN")
public class newsNaver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public newsNaver() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsListAction Naver = new NewsListAction();
		List <News> newsList = Naver.newsNaver();
		request.setAttribute("newsList", newsList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("news.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
