package crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class naver {

	public List<String> newsList() throws IOException {
		String search = "전자담배";
		for (int j = 0; j < 50; j += 10) {
			String URL = "https://search.naver.com/search.naver?&where=news&query=" + search
					+ "&sm=tab_pge&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so:dd,p:all,a:all&mynews=0&start="
					+ j + "&refresh_start=0";
			Document doc = Jsoup.connect(URL).get();
			List<String> title = doc.getElementsByClass("news_tit").eachText();
			List<String> href = doc.getElementsByClass("news_tit").eachAttr("href");
			for (int i = 0; i < title.size(); i++) {
				System.out.println(title.get(i) + "\n" + href.get(i) + "\n");
			}
		}
		return newsList();
	}

}