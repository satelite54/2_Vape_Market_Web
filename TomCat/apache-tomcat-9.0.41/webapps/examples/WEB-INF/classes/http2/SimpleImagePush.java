
package http2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.PushBuilder;

public class SimpleImagePush extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();

        PushBuilder pb = req.newPushBuilder();
        if (pb != null) {
            pb.path("servlets/images/code.gif");
            pb.push();
            pw.println("<html>");
            pw.println("<body>");
            pw.println("<p>The following image was provided via a push request.</p>");
            pw.println("<img src=\"" + req.getContextPath() + "/servlets/images/code.gif\"/>");
            pw.println("</body>");
            pw.println("</html>");
            pw.flush();
        } else {
            pw.println("<html>");
            pw.println("<body>");
            pw.println("<p>Server push requests are not supported by this protocol.</p>");
            pw.println("</body>");
            pw.println("</html>");
        }
    }
}
