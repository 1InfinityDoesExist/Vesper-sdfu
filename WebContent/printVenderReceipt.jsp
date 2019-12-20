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
	<body> <SCRIPT type="text/javascript">
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
	</div><%
		response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		if (session.getAttribute("uname") == null) {
			response.sendRedirect("SignIn.jsp");
		}
	%>
	<%
		String d = (String) session.getAttribute("ps");
	%>
	<!-- '"+jempid+"' -->
	<%!Connection con = null;
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
	<%
		if (con == null) {
			out.println("con is null");
		}

		ResultSet rs = stmt
				.executeQuery("select * from vendor where pnum = '" + d
						+ "' ");
	%>

	<body>
		<center>
			<div class="container">
				<!-- <h1 style="color: wheat">This is you bill / Receipt</h1> -->

				<table class="table table-dark">
					<thead>
					<caption>Receipt Issued By ${uname} to ${vn }</caption>
					<tr>
						<th scope="col">UniqueCode</th>
						<th scope="col">Product Name</th>
						<th scope="col">Product Serial Number</th>
						<th scope="col">Quantities Received</th>
						<th scope="col">Pirce Per Unit</th>
						<th scope="col">Grand Total</th>
						<th scope="col">Vendor Name</th>
						<th scope="col">Date</th>

					</tr>
					</thead>
					<tbody>

						<%
							while (rs.next()) {
						%>

						<tr>
							<td><%=rs.getInt("id")%></td>
							<td><%=rs.getString("pname")%></td>
							<td><%=rs.getString("pnum")%></td>
							<td><%=rs.getInt("quant")%></td>
							<td><%=rs.getFloat("price")%></td>
							<td>${gtt}</td>
							<td><%=rs.getString("vname")%></td>
							<td><%=rs.getString("date")%></td>

						</tr>
					</tbody>
					<br>
					<br>

					<%
						}
					%>

				</table>
				<tfoot>
					<br>
					<br>
					<br>
					<tr>
						<td colspan="3"><h1 style="color: Blue">Shopkeeper
								${uname} did your biling on <%= new java.util.Date() %> of Total <kbd>${gtt }</kbd></h1></td>
					</tr>
				</tfoot>

				<!-- <a href="Inbound.jsp"><h1>Continue Buying From Vendors</h1></a> -->



				<tr>
					<td></td>
					<td><input
						style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 120%;"
						type="button" value="Continue Buying "
						onclick="window.location.href='Inbound.jsp'" /></td>
				</tr>
				<br> <br>
				<tr>
					<td></td>
					<td><input
						style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 100%;"
						type="button" value="Go To Welocme Page "
						onclick="window.location.href='Welcome.jsp'" /></td>
				</tr>

			</div>
		</center>
	</body>
</html>











