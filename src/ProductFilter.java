import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InputMismatchException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductFilter implements Filter {
	
	boolean isValid(String p ) 
	{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String connectionDriver_class = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "clappia";
		String username = "root";
		String password = "iit2014006";
		String sql = "Select *from vendor where pname = ? ";
		
		try
		{
			Class.forName(connectionDriver_class);
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{
			con = DriverManager.getConnection(connectionUrl+dbName, username, password);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				System.out.println("yes present...");
				return true;
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public void init(FilterConfig fconfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fchain) throws IOException, ServletException
	{
		
		ProductFilter fil = new ProductFilter();
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		try{
			String productName = request.getParameter("product");
			if(fil.isValid(productName))
			{
				fchain.doFilter(req, res);
			}else
			{
				out.println("Soory it not available right now...!!!! Choose others...!!!");
				RequestDispatcher rd = request.getRequestDispatcher("Salesjsp.jsp");
				rd.include(req, res);
			}
		}catch(InputMismatchException e)
		{
			out.println("Except String nothing will be entertained....!!!! in Vendor Name ");
			RequestDispatcher rd = request.getRequestDispatcher("copyjsp.jsp");
			rd.include(req, res);
		}
		
	}
	public void destroy(){
		
	}
}
