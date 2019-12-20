import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VUCFilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		//int unique_code = Integer.parseInt(request.getParameter("uncode"));
		try
		{
			int unique_code = Integer.parseInt(request.getParameter("uncode"));
			if(unique_code >= 1 && unique_code <= 10000)
			{
				fchain.doFilter(req, res);
			}
			else 
			{
				out.println("UniqueCode cant be negaive");
				RequestDispatcher rd = req.getRequestDispatcher("Inbound.jsp");
				rd.include(req, res);
			}
		}catch(NumberFormatException e)
		{
			out.println("UniqueCode cant be negative or alpha not mysql ");
			RequestDispatcher rd = req.getRequestDispatcher("Inbound.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
