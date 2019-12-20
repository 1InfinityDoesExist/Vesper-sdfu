
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
import javax.servlet.http.HttpSession;

public class dbmFilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = ((HttpServletRequest) request).getSession();
		try
		{
			int q1 = ((Integer)session.getAttribute("qqu") == null)? 0 : (Integer)session.getAttribute("qqu");
			int q2 = Integer.parseInt(request.getParameter("qt"));
			
			System.out.println(q1 + " " + q2);
			if(q2 > 0 && q2 <= q1)
			{
				fchain.doFilter(req, res);
			}
			else
			{
				out.println(" Soory Choose between 1 & " + q1);
				RequestDispatcher rd = request.getRequestDispatcher("buying.jsp");
				rd.include(req, res);
			}
		}catch(InputMismatchException e)
		{
			out.println("Product Name Must Be >=  5char long");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
