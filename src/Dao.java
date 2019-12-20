import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

public class Dao {
	boolean isValid(String uname, String pass) 
	{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String connectionDriver_class = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "clappia";
		String username = "root";
		String password = "iit2014006";
		String sql = "Select *from login where username = ? and password = ? ";
		
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
			pstmt.setString(1, uname);
			pstmt.setString(2, pass);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
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
