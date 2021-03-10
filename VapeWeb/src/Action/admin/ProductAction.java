package Action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.Products;
import Servlet.Location.Location;
import Servlet.Location.LocationForward;

public class ProductAction implements Location{
	@Override
	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Products products = new Products();
		products.setPname(request.getParameter("pname"));
		products.setCode(request.getParameter("code"));		
		products.setManufacturer(request.getParameter("manufacturer"));
		products.setPrice(Integer.parseInt(request.getParameter("price")));
		products.setStock(Integer.parseInt(request.getParameter("stock")));
		products.setProducttype(request.getParameter("producttype"));
		products.setImgname(request.getParameter("imgname"));
		products.setDetailedimagepath(request.getParameter("detailedimgname"));
	
		Dao DAO = new Dao();

		Map<String, String[]> paraMeterMap = request.getParameterMap();
		Set<String> paraMeterKey = paraMeterMap.keySet();
		Iterator iter = paraMeterKey.iterator();
		String[] strAry = new String[paraMeterMap.size()];
		for(int i = 0; iter.hasNext(); i++) {
			strAry[i] = (String) iter.next();
		}

		String detailimgpath = paraMeterMap.get("detailedimgname")[0];
		products.setDetailedimagepath(detailimgpath);


		int parameterSize = paraMeterMap.size();
		switch(strAry[parameterSize - 1]) {
		case "insert": {
			response.setContentType("text/html; charset=utf-8");
			int result = DAO.insertProduct(products);
			PrintWriter script = response.getWriter();
			if(result == 1) {
				script.println("<script>");
				script.println("alert('상품 등록이 성공적으로 되었습니다.')");
				script.println("location.href = 'ProductManegerAction.do'");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('상품 등록 오류 발생.')");
				script.println("location.href = 'ProductManegerAction.do'");
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
				script.println("location.href = 'ProductManegerAction.do'");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('상품 삭제 오류 발생.')");
				script.println("location.href = 'ProductManegerAction.do'");
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
				script.println("location.href = 'ProductManegerAction.do'");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("alert('상품 업데이트 오류 발생.')");
				script.println("location.href = 'ProductManegerAction.do'");
				script.println("</script>");
			}
			break;
		}
		}

		return null;
	}
}
