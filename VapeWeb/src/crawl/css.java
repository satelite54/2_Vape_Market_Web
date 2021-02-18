package crawl;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class css {

	public static void main(String[] args) throws IOException {
//		String URL = "http://www.thevapor.co.kr";
		String URL = "http://www.naver.com";
		Document doc = Jsoup.connect(URL).get();
		List<String> css = doc.getElementsByAttributeValueMatching("rel","stylesheet").eachAttr("href");
		System.out.println(css);
		
	}

}
