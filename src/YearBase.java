import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class YearBase extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String f1 = request.getParameter("from");
		String f2 = request.getParameter("to");
		
		request.setAttribute("from", f1);
		request.setAttribute("to", f2);
		
		RequestDispatcher rd = request.getRequestDispatcher("YearBaseFilter.jsp");
		rd.forward(request, response);
	}
}
