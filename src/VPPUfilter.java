import java.io.IOException;
import java.io.PrintWriter;
import java.util.InputMismatchException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VPPUfilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		try{
			float price_per_unit = Float.parseFloat(request.getParameter("priceperunit"));
			if(price_per_unit >= 1 && price_per_unit <= 1000000)
			{
				
				fchain.doFilter(req, res);
			}else
			{
				out.println("Price Per Unit Field Must be +Number");
				RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
				rd.include(req, res);
			}
		}catch(InputMismatchException e)
		{
			out.println("Price Per Unit Field Must be +Number");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
