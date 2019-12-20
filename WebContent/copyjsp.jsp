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
<body>
	<SCRIPT type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</SCRIPT>
	<script language="JavaScript" type="text/javascript">
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
	%>
	
	<center>
		<div class="container">
			<form action="ses" method="post" autocomplet="on">
				<h1>Section 1: Customer Info</h1>
				<table>
					<tr>
						<td><div class="col-xs-2" />Customer_Name</td>
						<td><input id="cname" type="text" name="cname"
							class="form-control" placeholder= ${cn} size="25"
							readonly></td>
						</div>
					</tr>
					<tr>
						<td><div class="col-xs-2" />Customer_Address</td>
						<td><input type="text" name="cadd" class="form-control"
							placeholder=${ca} size="25" readonly></td>
						</div>
					</tr>
					<tr>
						<td><div class="col-xs-2" />Todays_Date/Time</td>
						<td><input type="text" name="dt" class="form-control"
							value=${da} size="25" readonly></td>
						</div>
					</tr>
				</table>
				<br>


				<%!Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String ClassName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "clappia";
	String userName = "root";
	String password = "iit2014006";

	String sql1 = "select *from vendor where quant >= 1";
	String sq12 = "select pnum from vendor where pname= ?";
	String sql3 = "select price from vendor where pname= ?";

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
			pstmt = con.prepareStatement(sql3);

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
					ResultSet rs = stmt.executeQuery(sql1);
				%>



				<h1>Section 2: Product Purchase</h1>
				<table>
					<tr>
						<label><div class="col-xs-2" /> Product_Name <input
							list="product" name="product" id="p" onkeyup="doSomething();"
							size="25" />
							<div class="dropdown"></label>

						<datalist id="product"> <%
 	while (rs.next()) {
 		String pro = rs.getString("pname");
 %>

						<option value="<%=pro%>">
							<%=pro%></option>

						<%
							}
						%> </datalist>
						</td>
						</div>
						</div>
					</tr>


					<tr>
						<td></td>
						<div class="container">
							<td><input type="submit" class="btn btn-info"
								value="Go For It"></td>
						</div>
					</tr>
				</table>


				<h1>Section 3: Total Price</h1>
				<table>
					<tr>
						<td><div class="col-xs-2" />Total_Price</td>
						<td><input type="text" name="tp" id="textf" placeholder= ${grand} 
							class="form-control" value=${grand } size="25" readonly></td>
						</div>
					</tr>
				</table>

			</form>

			<br> <br>

		<tr>
			<td></td>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 150%;"
				type="button" value="OK DONE"
				onclick="window.location.href='billing.jsp'" /></td>
		</tr>
		
		
		
		<tr>
			<td></td>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 150%;"
				type="button" value="Back To Sales"
				onclick="window.location.href='Salesjsp.jsp'" /></td>
		</tr>
	</center>



</body>
</html>