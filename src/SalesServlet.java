import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

public class SalesServlet extends HttpServlet {

	Connection con = null;
	PreparedStatement pstmt = null;

	String connectionDriver_class = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "clappia";
	String username = "root";
	String password = "iit2014006";
	String sql = "Select *from vendor where pname= ? ";

	public void init(ServletConfig fconfig) throws ServletException {

		try {
			Class.forName(connectionDriver_class);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			con = DriverManager.getConnection(connectionUrl + dbName, username,
					password);
			pstmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String customerName = request.getParameter("cname");
		String customerAddress = request.getParameter("cadd");
		String date = request.getParameter("dt");
		String productName = request.getParameter("product");
		//Double tot = Double.parseDouble(request.getParameter("tp"));

		// Float totalPrice = Float.parseFloat(request.getParameter("tp"));

		try {
			pstmt.setString(1, productName);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String pserial = rs.getString("pnum");
				Float price = rs.getFloat("price");
				int qu = rs.getInt("quant");
				int iid = rs.getInt("id");
				
				
				System.out.println("Porduct serial number is and pirce is : " + pserial + price);

				HttpSession session = request.getSession();
				session.setAttribute("cn", customerName);
				session.setAttribute("ca", customerAddress);
				session.setAttribute("da", date);
				session.setAttribute("pn", productName);
				session.setAttribute("se", pserial);
				session.setAttribute("pprice", price);
				session.setAttribute("qqu", qu);
				session.setAttribute("idd", iid);
				//session.setAttribute("tt", tot);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("buying.jsp");
	}

	public void destroy() {
		try {

			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
