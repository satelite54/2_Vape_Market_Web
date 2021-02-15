package question;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/question/questionUpdate2")
public class QuestionUpdateServlet2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		HttpSession session = request.getSession();
		QuestionBean bean = (QuestionBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		//////////////////////////////////////////////////
		MultipartRequest multi = 
				new MultipartRequest(request,QuestionMgr.SAVEFOLDER,
						QuestionMgr.MAXSIZE,QuestionMgr.ENCTYPE,
						new DefaultFileRenamePolicy());
		String inPass = multi.getParameter("pass");
		if(dbPass.equals(inPass)) {
			QuestionMgr mgr = new QuestionMgr();
			mgr.updateQuestion2(multi);
			String nowPage = multi.getParameter("nowPage");
			String numPerPage = multi.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage+
					"&numPerPage="+numPerPage+
					"&num="+bean.getNum());
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}