import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
public class InboundFetcher extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
	//	int unique_code = Integer.parseInt(request.getParameter("uncode"));
		String product_name = request.getParameter("productName");
		String product_serial_number = request.getParameter("productsn");
		int quant_received = Integer.parseInt(request.getParameter("quantreceived"));
		float price_per_unit = Float.parseFloat(request.getParameter("priceperunit"));
		float total_price = Float.parseFloat(request.getParameter("totalp"));
		String vendor_name = request.getParameter("vendorname");
		String date = request.getParameter("date");
		
		
		VendorDao dao = new VendorDao();
		if(dao.saveDetails( product_name, product_serial_number, quant_received, price_per_unit, vendor_name, date))
		{
			out.print("Vendor Data Successfully inserted");
			
			HttpSession session = request.getSession();
		//	session.setAttribute("uc", unique_code);
			session.setAttribute("pn", product_name);
			session.setAttribute("ps", product_serial_number);
			session.setAttribute("qr", quant_received);
			session.setAttribute("ppu", price_per_unit);
			session.setAttribute("gtt", total_price);
			session.setAttribute("vn", vendor_name);
			session.setAttribute("date", date);
			
			response.sendRedirect("printVenderReceipt.jsp");
			
		}
		else
		{
			out.print("Sorry ...!!! Someting went wrong...Please try again...!!!!");
			RequestDispatcher rd = request.getRequestDispatcher("Inbound.jsp");
			rd.include(request, response);
		}
				
	}
}
