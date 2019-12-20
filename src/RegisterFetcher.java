import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterFetcher extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = request.getParameter("username");
		String ps = request.getParameter("pass");
		
		RegisterDao dao = new RegisterDao();
		if(dao.saveDetails(un, ps)){
			out.println("Successfully Registered");
			RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("Something went wrong....Try Again....");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
		}
	}
		
}
