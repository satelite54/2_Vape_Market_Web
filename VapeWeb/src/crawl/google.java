package crawl;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


public class google {
	
	public static void main(String[] args) throws IOException, InterruptedException {
		Document doc = null;

		GoogleNewsSreach(doc, "연예인");
		return;
	}
	public static void GoogleNewsSreach(Document doc, String Search) throws IOException, InterruptedException {
		Thread.sleep(2000);
		String GOOGLE ="https://www.google.com"; // 앞에 구글을 붙혀주기 위함
		if(doc == null) {
			String URL ="https://www.google.com/search?q="+Search+"&tbm=nws&start=0";
			doc = Jsoup.connect(URL).get();
		}
		
		if(doc.select("td.d6cvqb").select("a").select("span").text().contains("다음")) {
			List<String> PageSeletor = doc.select("td.d6cvqb").select("a").eachAttr("href");
			if(PageSeletor.size() == 1) {
				PageSeletor.add(0, "");
			}
				  List<String> el = doc.getElementsByClass("JheGif nDgy9d").eachText(); 
				  List<String> el2 = doc.getElementsByClass("dbsr").select("a").eachAttr("href");
				  for (int j = 0; j < el.size(); j++) {
					  System.out.println();
					  System.out.println(el.get(j)+"\n"+el2.get(j));
					  
				  }
				  Document doc1 = Jsoup.connect(GOOGLE + PageSeletor.get(1)).get();
				  
			GoogleNewsSreach(doc1, GOOGLE + PageSeletor.get(1));
		} else {
			
			return;
		}
	}
	
//	public static void P_GoogleNews(String Search)throws IOException {
//		String URL ="https://www.google.com/search?q="+Search+"&tbm=nws";
//		String GOOGLE ="https://www.google.com"; // 앞에 구글을 붙혀주기 위함
//		
//		//검색 된 페이지의 페이지를 가져오는 과정
//		Document doc = Jsoup.connect(URL).get();
//		String nextPage = doc.select("td.d6cvqb").select("a").attr("href");
//		
//		while(doc.select("td.d6cvqb").hasAttr("role")) {
//			  Document doc1 = Jsoup.connect(GOOGLE + nextPage).get();
//			  List<String> el = doc.getElementsByClass("JheGif nDgy9d").eachText(); 
//			  List<String> el2 = doc.getElementsByClass("dbsr").select("a").eachAttr("href"); 
//			  for (int j = 0; j < el.size(); j++) {
//				  System.out.println(); 
//				  System.out.println(el.get(j)+"\n"+el2.get(j));
//			  }
//			  GoogleNextPageBtn("aa");
//		}
//	}
	
	
	/*
	public static void GoogleNews(String Search)throws IOException{
		String URL ="https://www.google.com/search?q="+Search+"&tbm=nws";
		String GOOGLE ="https://www.google.com";
		
		//검색 된 페이지의 페이지를 가져오는 과정
		Document SearchPage = Jsoup.connect(URL).get();
		

			for (int i = 0; i < ifpage.size(); i++) {
				List<String> pagelink = SearchPage.getElementsByClass("d6cvqb").select("a").eachAttr("href");
				String[] pagearr = new String[pagelink.size()];
				pagearr[i] = GOOGLE+pagelink.get(i);
				System.out.println(pagearr[i]);
					Document page = Jsoup.connect(pagearr[i]).get();
				}
			}
		*/
		
		
		
	
	
	
	



}

