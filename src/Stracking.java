import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Stracking extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		float f1 = Float.parseFloat(request.getParameter("from"));
		float f2 = Float.parseFloat(request.getParameter("to"));
		
		request.setAttribute("from", f1);
		request.setAttribute("to", f2);
		
		RequestDispatcher rd = request.getRequestDispatcher("RangeFilter.jsp");
		rd.forward(request, response);
	}
}
