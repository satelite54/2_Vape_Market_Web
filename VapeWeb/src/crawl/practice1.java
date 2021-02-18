package crawl;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

public class practice1 {
	

//	public static void main(String[] args) throws IOException {
//		String url = "http://www.thevapor.co.kr/category/%EB%94%94%EC%A0%80%ED%8A%B8%EC%9D%8C%EC%8B%9D%ED%96%A5/37/";
//		
//			Document doc = Jsoup.connect(url).get();
//			
//			
//			String el = doc.getElementsByClass("item xans-record-").select("a").text().replaceAll("상품명 : ","\n");
//			
//			String a = "http://www.thevapor.co.kr";
//			List<String> el2 = doc.getElementsByClass("item xans-record-").select("a").eachAttr("href");
//				StringBuilder sb = new StringBuilder();
//				for(int i = 0; i < el2.size(); i++) {
//					sb.append(a + el2.get(i));
//					sb.append("\n");
//				}
//			System.out.println(sb);
//			StringTokenizer tk = new StringTokenizer(sb.toString());
//			List<String> listTk = new ArrayList<String>();
//			try {
//				while(tk.hasMoreTokens()) {
//					listTk.add((String) tk.nextElement());
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			for (int i = 0; i < listTk.size(); i++) {
//				Document doc2 = Jsoup.connect(listTk.get(i)).get();
//			}
		

				   public static void main(String[] args) throws IOException {
				      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
				      crawling theVapor = new crawling();
				      List<String[]> products = theVapor.theVaporProducts();
				      for(int i = 0; i < products.size(); i++) {
				         String[] strArr = products.get(i);
				         for(int j = 0; j < strArr.length; j++) {
				            bw.write(strArr[i]);
				         }
				         bw.write("\n");
				      }
				      bw.flush();
				      bw.close();
				   }
			
	}
