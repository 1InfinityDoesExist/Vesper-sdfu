import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class dbmodifier extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		
		String customerName = (String)session.getAttribute("cn");
		String customerAddres = (String)session.getAttribute("ca");
		String date = (String)session.getAttribute("da");
		String productName = (String)session.getAttribute("pn");
		
		
		String serialNumber = (String)session.getAttribute("se");
		Float price = (Float)session.getAttribute("pprice");
		
		
		int q1 = ((Integer)session.getAttribute("qqu") == null)? 0 : (Integer)session.getAttribute("qqu");
		int q2 = Integer.parseInt(request.getParameter("qt"));
		float totalPrice = Float.parseFloat(request.getParameter("ip"));
		int ppid = ((Integer)session.getAttribute("idd") == null) ? 0 : (Integer)session.getAttribute("idd");
		double tt = ((Double)session.getAttribute("grand") == null) ? 0 : (Double)session.getAttribute("grand");
		
		
		System.out.println("Q1 is q1 is" + q1 + "q2 is " + q2);
		int rem = q1-q2;
	
		Double grandTotal = totalPrice + tt;
		
		
		Salesdb db = new Salesdb();
		
		System.out.println("Rem is " + rem + "Pid is" + ppid);
		
		
		
		
		Boolean b = db.isValid(rem, ppid);
		if(b)
		{
			out.print("Vendor Database Updated");
		}
		
		
		SalesDao dao = new SalesDao();
		
		System.out.println( serialNumber + " " + price );
		
		if(dao.saveDetails(customerName, customerAddres, date, productName, serialNumber, price, q2, totalPrice))
		{
			out.print("Vendor Data Successfully inserted");
			
			
			session.removeAttribute("qqu");
			session.removeAttribute("grand");
			
			session.setAttribute("qqu",	rem);
			session.setAttribute("grand", grandTotal);
			
			response.sendRedirect("copyjsp.jsp");
		}
		else
		{
			out.print("Sorry ...!!! Someting went wrong...Please try again...!!!!");
			RequestDispatcher rd = request.getRequestDispatcher("Buying.jsp");
			rd.include(request, response);
		}
	}
}
