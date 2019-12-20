import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;

public class PassFilter implements Filter {
	public void init(FilterConfig fconfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String N = req.getParameter("pass");
		
		String n = req.getParameter("psw-repeat");
		
		if(n.equals(N))
		{
			if(N.length() < 4)
			{
				out.println("Pass To Sort TO Accept");
				RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
				rd.include(req, res);
			}
			else
			{
				fchain.doFilter(request, response);
			}
		}
		else
		{
			out.println("Dont Hurry Type Your Password Correctly...");
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.include(req, res);
		}
	}
	public void destroy() {

	}
}