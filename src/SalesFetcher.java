import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SalesFetcher extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String customerName = request.getParameter("cname");
		String customerAddres = request.getParameter("cadd");
		String date = request.getParameter("dt");
		
		String productName = request.getParameter("product");
		String serialNumber = request.getParameter("sn");
		Float price = Float.parseFloat(request.getParameter("pr"));
		int quantity = Integer.parseInt(request.getParameter("qu"));
		Float totalPrice = Float.parseFloat(request.getParameter("tp"));
		
		
		SalesDao dao = new SalesDao();
		
		if(dao.saveDetails(customerName, customerAddres, date, productName, serialNumber, price, quantity, totalPrice))
		{
			out.print("Vendor Data Successfully inserted");
			HttpSession session = request.getSession();
			
			session.setAttribute("uc", customerName);
			session.setAttribute("pn", customerAddres);
			session.setAttribute("ps", date);
			session.setAttribute("qr", productName);
			session.setAttribute("ppu", serialNumber);
			session.setAttribute("vn", price);
			session.setAttribute("date", quantity);
			session.setAttribute("tt", totalPrice);
			
			response.sendRedirect("printCustomerReceipt.jsp");
		}
		else
		{
			out.print("Sorry ...!!! Someting went wrong...Please try again...!!!!");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(request, response);
		}
		
	}
}
