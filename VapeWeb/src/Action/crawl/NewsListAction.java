package Action.crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import DTO.News;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class NewsListAction implements Location {
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LocationForward forward = new LocationForward();
		List<News> newsList = new ArrayList<News>();
		String search = "전자담배";
		for (int j = 0; j < 1; j += 1) {
			String URL = "https://search.naver.com/search.naver?&where=news&query=" + search
					+ "&sm=tab_pge&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so:dd,p:all,a:all&mynews=0&start="
					+ j + "&refresh_start=0";
			Document doc = Jsoup.connect(URL).get();
			List<String> title = doc.getElementsByClass("news_tit").eachText();
			List<String> href = doc.getElementsByClass("news_tit").eachAttr("href");
			List<String> contents = doc.getElementsByClass("api_txt_lines dsc_txt_wrap").eachText();
			
			for (int i = 0; i < title.size(); i++) {
			    	News news = new News();
				news.setTitle(title.get(i));
				news.setHref(href.get(i));
				news.setContent((String) contents.get(i).subSequence(0, 100));
				newsList.add(news);
			}
		}
		request.setAttribute("newsList", newsList);
		forward.setNextPath("news.do");
		forward.setRedirect(false);
		return forward;
	}
}


