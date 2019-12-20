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

public class VQRfilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		try{
			int quant_received = Integer.parseInt(request.getParameter("quantreceived"));
			if(quant_received >= 1 && quant_received <= 100000)
			{
				fchain.doFilter(req, res);
			}else
			{
				out.println("Quantity Field must be a +Number ");
				RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
				rd.include(req, res);
			}
		}catch(InputMismatchException e)
		{
			out.println("Quantity Field must be a +Number ");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
