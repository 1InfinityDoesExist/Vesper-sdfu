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

public class VPSNfilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		try{
			String product_serial_number = request.getParameter("productsn");
			if(product_serial_number.length() >= 3)
			{
				fchain.doFilter(req, res);
			}else
			{
				out.println("Serial Numer Must Be  >=0  (alpha numberic)");
				RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
				rd.include(req, res);
			}
		}catch(InputMismatchException e)
		{
			out.println("Serial Numer Must Be  >=0  (alpha numberic)");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
