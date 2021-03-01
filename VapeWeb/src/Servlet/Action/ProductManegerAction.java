package Servlet.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.Products;

/**
 * Servlet implementation class ProductManegerAction
 */
@WebServlet("/PMAction")
public class ProductManegerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManegerAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Dao DAO = new Dao();
		
		Products products = new Products();
		
		Map<String, String[]> paraMeterMap = request.getParameterMap();
		Set<String> paraMeterKey = paraMeterMap.keySet();
		Iterator iter = paraMeterKey.iterator();
		String[] strAry = new String[paraMeterMap.size()];
		for(int i = 0; iter.hasNext(); i++) {
			strAry[i] = (String) iter.next();
		}
		String pname = paraMeterMap.get("pname")[0];
		String code = paraMeterMap.get("code")[0];
		String manufacturer= paraMeterMap.get("manufacturer")[0];
		String price= paraMeterMap.get("price")[0];
		String stock= paraMeterMap.get("stock")[0];
		String producttype= paraMeterMap.get("producttype")[0];
		String imgname = paraMeterMap.get("imgname")[0];
		String detailedimgname= paraMeterMap.get("detailedimgname")[0];
		products.setDetailedimagepath(detailedimgname);
		products.setPname(pname);
		products.setPrice(Integer.parseInt(price));
		products.setCode(code);
		products.setImgname(imgname);
		products.setProducttype(producttype);
		products.setStock(Integer.parseInt(stock));
		products.setManufacturer(manufacturer);
		
		int parameterSize = paraMeterMap.size();
		switch(strAry[parameterSize - 1]) {
			case "insert": {
				int result = DAO.insertProduct(products);
				PrintWriter script = response.getWriter();
				if(result == 1) {
					script.println("<script>");
					script.println("alert('상품 등록이 성공적으로 되었습니다.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('상품 등록 오류 발생.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				}
				break;
			}
			case "delete": {
				int result = DAO.deleteProduct(products.getPname());
				PrintWriter script = response.getWriter();
				if(result == 1) {
					script.println("<script>");
					script.println("alert('상품 삭제가 성공적으로 되었습니다.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('상품 삭제 오류 발생.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				}
				break;
			}
			case "update": {
				int result = DAO.UpdateProduct(products);
				PrintWriter script = response.getWriter();
				if(result == 1) {
					script.println("<script>");
					script.println("alert('상품이 성공적으로 업데이트 되었습니다.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('상품 업데이트 오류 발생.')");
					script.println("location.href = 'ProductManeger.jsp'");
					script.println("</script>");
				}
				break;
			}
		}	
	}

}
