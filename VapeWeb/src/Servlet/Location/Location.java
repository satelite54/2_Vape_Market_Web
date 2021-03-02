package Servlet.Location;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Location {

	public LocationForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
