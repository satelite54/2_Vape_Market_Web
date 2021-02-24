

package filters;


import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.GenericFilter;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



public final class ExampleFilter extends GenericFilter {


    private static final long serialVersionUID = 1L;


    
    private String attribute = null;


    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Store ourselves as a request attribute (if requested)
        if (attribute != null)
            request.setAttribute(attribute, this);

        // Time and log the subsequent processing
        long startTime = System.currentTimeMillis();
        chain.doFilter(request, response);
        long stopTime = System.currentTimeMillis();
        getServletContext().log(this.toString() + ": " + (stopTime - startTime) +
             " milliseconds");
    }


    @Override
    public void init() throws ServletException {
        this.attribute = getInitParameter("attribute");
    }


    
    @Override
    public String toString() {
        return "ExampleFilter(" + getFilterConfig() + ")";
    }
}

