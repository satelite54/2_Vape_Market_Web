package Servlet.Location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LC.do")
public class LocationController extends HttpServlet implements Location {
	private static final long serialVersionUID = 1L;
       
    public LocationController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("Location");
		move(location, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	@Override
	public void move(String location, HttpServletResponse response) throws IOException {
		switch (location) {
		case "main.jsp": {
			response.sendRedirect("WEB-INF/sub/" + location);
		}
			break;
		default:
			break;
		}
	}
}
