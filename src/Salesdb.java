import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

public class Salesdb {
	boolean isValid(int rem, int pid) 
	{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String connectionDriver_class = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "clappia";
		String username = "root";
		String password = "iit2014006";
		
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
			pstmt = con.prepareStatement("update vendor set quant = '"+rem + "' where id= '" + pid+ "' ");
			
			int rs = pstmt.executeUpdate();
			System.out.println( "sales db is : " + rs);
			//System.out.println("Rem is " + rem + "Pid is" + pid);
			if(rs > 0)
			{
				return true;
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
