import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
			request.setAttribute("name", uname);
			request.setAttribute("password", pass);
			
			RequestDispatcher rd = request.getRequestDispatcher("/val");
			rd.forward(request, response);
		
		
	}
}
