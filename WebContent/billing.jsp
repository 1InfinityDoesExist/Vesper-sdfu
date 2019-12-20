<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body bgcolor="#f8f88">



	<BODY onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload=""><bo dy> <SCRIPT type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</SCRIPT> <script language="JavaScript" type="text/javascript">
		window.history.forward(1);
	</script>
	<div class="container">
		<form action="lout" method="post">
			<input type="submit" class="btn btn-info" value="LogOut" />
		</form>
	</div>
	<%
		response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		if (session.getAttribute("uname") == null) {
			response.sendRedirect("SignIn.jsp");
		}
	%><%!Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String ClassName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "clappia";
	String userName = "root";
	String password = "iit2014006";

	public void jspInit() {
		try {
			Class.forName(ClassName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			con = DriverManager.getConnection(connectionUrl + dbName, userName,
					password);

			stmt = con.createStatement();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void jspDestroy() {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>



	<%!String date;%>
	<%
		String date = (String) session.getAttribute("cn");
		if (con == null) {
			out.println("con is null");
		}

		ResultSet rs = stmt
				.executeQuery("select *from customer where cname = '" + date
						+ "' ");
	%>


<body bgcolor="white">
	<center>
	<div class="container">
		<caption>
			<h1 style="color: cyan">Billing For <mark>${cn}</mark> By <mark>${uname}</mark> </h1>
			
			<p> Customer Info</p>
			<p>${cn }</p>
			<p>${da }</p>
			<p>${ca }</p>
			
			<p>Total Shopping you did <kbd>${grand}</kbd>
		
		</caption>
		<table class="table table-dark">
		<thead>
			<tr>
				<th scope="col">Product InvoNO</th>
				<th scope="col">Product Name</th>
				<th scope="col">Product SerialNo</th>
				<th scope="col">PPriceP</th>
				<th scope="col">Quantity</th>
			</tr>
			</thead>
			<%
				while (rs.next()) {
			%>
			<tbody>
			<tr>
				<td><%=rs.getInt("invo")%></td>
				<td><%=rs.getString("pname")%></td>
				<td><%=rs.getString("serialno")%></td>
				
				<td><%=rs.getFloat("price")%></td>
				<td><%=rs.getInt("quant")%></td>
			</tr>
			</tbody>
			<br>
			<br>

			<%
				}
			%>
		</table>
		<tr>
			<td></td>
			<br>
			<br>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 100%;"
				type="button" value="Go To Welocme Page"
				onclick="window.location.href='Welcome.jsp'" /></td>
		</tr>
		</div>
	</center>
</body>
</html>