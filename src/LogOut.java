import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogOut extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		session.removeAttribute("uname");
		session.invalidate();
		response.sendRedirect("SignIn.jsp");
	}
}
