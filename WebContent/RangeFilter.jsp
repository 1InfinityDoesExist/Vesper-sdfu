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
	onunload="">
	<bo dy> <SCRIPT type="text/javascript">
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
	%> <%
 	response.setHeader("Cache-Control",
 			"no-cache, no-store, must-revalidate");
 	response.setHeader("Pragma", "no-cache");
 	response.setHeader("Expires", "0");

 	if (session.getAttribute("uname") == null) {
 		response.sendRedirect("SignIn.jsp");
 	}
 %> <%!Connection con = null;
	Statement stmt = null;

	PreparedStatement pstmt = null;
	String ClassName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "clappia";
	String userName = "root";
	String password = "iit2014006";

	String sql1 = "select *from customer";

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
	}%> <%
 	if (con == null) {
 		out.println("con is null");
 	}

 	float f1 = (Float) request.getAttribute("from");
 	float f2 = (Float) request.getAttribute("to");
 	ResultSet rs = stmt
 			.executeQuery("select *from customer where price between '"
 					+ f1 + "' and '" + f2 + "' ");
 %>


	<center>
		<div class="container">
			<caption>
				<h1>OverAll Sales Tracking Part...!!!</h1>
			</caption>

			<h1>This One Is For Price Based Filter</h1>
			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">InvoiceNumber</th>
						<th scope="col">ProductName</th>
						<th scope="col">ProductSerialNo</th>
						<th scope="col">Quantities</th>
						<th scope="col">PricePerPro</th>
						<th scope="col">TotalPrice</th>
						<th scope="col">SaleDate</th>
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
						<td><%=rs.getInt("quant")%></td>
						<td><%=rs.getFloat("price")%></td>
						<td><%=rs.getFloat("totalPrice")%></td>
						<td><%=rs.getString("date")%></td>
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
					style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 90%;"
					type="button" value="Go To Welocme Page"
					onclick="window.location.href='Welcome.jsp'" /></td>
			</tr>
			<br> <br>

			<tr>
				<td></td>
				<br>
				<br>
				<td><input
					style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 90%;"
					type="button" value="GoBack To SalesTracking"
					onclick="window.location.href='SalesTracking.jsp'" /></td>
			</tr>
			<br> <br>
		</div>
	</center>
</body>
</html>