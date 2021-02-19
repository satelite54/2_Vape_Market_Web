package DAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class crawling {
	public List<String[]> theVaporProducts() throws IOException {
		//처음 접속할 사이트
		String url1 = "http://www.thevapor.co.kr";
		Document doc1 = Jsoup.connect(url1).get();
		List<String> el1 = doc1.getElementsByClass("xans-record-").select("a").eachAttr("href");
		
		//카테고리 5개는 일단 제외(로그인해야 크롤링 가능)
		int categorySize = el1.size();
		for(int i = 0; i < categorySize; i++) {
			el1.remove(0);
			if(i == 4) {// 보드 게시판 목록 일단 삭제 한 후 탈출
				el1.remove(el1.size() - 1);
				break;
			}
		}
		//얻었을 때 웹사이트 주소 넣는 for문
		String[] strAry = new String[el1.size()];
		for(int i = 0; i < el1.size(); i++) {
			strAry[i] = url1 + el1.get(i);
		};
		//카테고리마다 상품 목록 크롤링
		int n = strAry.length;
		List<String[]> productsInformation = new ArrayList<String[]>();
		while(n --> 0) {
			String url2 = strAry[n];
			Document doc2 = Jsoup.connect(url2).get();
			String a = "http://www.thevapor.co.kr";
			List<String> el2 = doc2.getElementsByClass("item xans-record-").select("a").eachAttr("href");
			StringBuilder sb = new StringBuilder();
			
			for(int i = 0; i < el2.size(); i++) {
				sb.append(a + el2.get(i));
				sb.append("\n");
			}
			
			StringTokenizer tk = new StringTokenizer(sb.toString());
			List<String> listTk = new ArrayList<String>();
			try {
				while(tk.hasMoreTokens())
					listTk.add((String) tk.nextElement());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			for (int i = 0; i < listTk.size(); i++) { // 상세페이지 출력하는 부분 List나 다른 방법으로 데이터를 담아야함
				Document doc3 = Jsoup.connect(listTk.get(i)).get();
				Elements pElements = doc3.select("div.infoArea").select("div.xans-product-detaildesign")
									.select("tr.xans-record-").select("td");
				String pImg = doc3.select("div.keyImg").select("img").attr("src");
				List<String> pdata = pElements.eachText();
				int cntpData = pdata.size();
				
				String[] strArr = new String[cntpData + 1];
				for(int j = 0; j < cntpData; j++) {
					strArr[j] = pdata.get(j);
				}
				strArr[cntpData] = pImg;
				productsInformation.add(strArr);
			}
		}
		return productsInformation;
	}
}
