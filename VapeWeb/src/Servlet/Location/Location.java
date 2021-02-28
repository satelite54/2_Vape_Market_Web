package Servlet.Location;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public interface Location {
	
	public void move(String location, HttpServletResponse response) throws IOException;

}
