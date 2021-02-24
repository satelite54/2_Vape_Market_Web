package crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import DTO.News;

public class naver {

	public static void main(String[] args) throws IOException {
	}

	public List<News> newsNaver() throws IOException {
		List<News> newsList = new ArrayList<News>();
		String search = "전자담배";
		for (int j = 0; j < 50; j += 10) {
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
				news.setContent(contents.get(i));
				newsList.add(news);
			}
		}
		return newsList;
	}
}