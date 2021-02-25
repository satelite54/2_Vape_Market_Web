package crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import DTO.News;

public class naver2 {

	public static void main(String[] args) throws IOException {

		List<News> newsList = new ArrayList<News>();
		String search = "전자담배";
		for (int j = 0; j < 50; j += 10) {
			String URL = "https://search.naver.com/search.naver?&where=news&query="+search+"&sm=tab_pge&sort=1&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so:dd,p:all,a:all&mynews=0&start="+j+"&refresh_start=0";
			Document doc = Jsoup.connect(URL).get();
			List<String> title = doc.getElementsByClass("news_tit").eachText();
			List<String> href = doc.getElementsByClass("news_tit").eachAttr("href");
			List<String> contents = doc.getElementsByClass("api_txt_lines dsc_txt_wrap").eachText();
			List<String> imgsrc = doc.getElementsByClass("thumb api_get").tagName("img").eachAttr("src");
//			List<String> imgsrc = doc.getElementsByClass("news_tit").tagName("a").tagName("img").eachAttr("src");
			System.out.println(title);
			System.out.println(href);
			System.out.println(contents);
			System.out.println(imgsrc);
			for (int i = 0; i < imgsrc.size(); i++) {
				
			}
			}
		}
	}
