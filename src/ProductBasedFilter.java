import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProductBasedFilter extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pbf = request.getParameter("prname");
		
		request.setAttribute("proname", pbf);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("priceFilter.jsp");
		rd.forward(request, response);
	}
}
