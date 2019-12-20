import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Validator extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String nam = (String)request.getAttribute("name");
		String pass = (String)request.getAttribute("password");
		Dao d = new Dao();
		if(d.isValid(nam, pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("uname", nam);
			
			response.sendRedirect("Welcome.jsp");
		}
		else
		{
			out.println("Credentials Didn't Match To Our DataBase");
			RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
			rd.include(request, response);
		}
	}
}
