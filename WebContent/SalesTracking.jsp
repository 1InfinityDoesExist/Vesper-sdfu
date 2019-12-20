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
	%> <%!Connection con = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt6 = null;
	PreparedStatement pstmt = null;
	String ClassName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "clappia";
	String userName = "root";
	String password = "iit2014006";

	String sql1 = "select *from customer";
	String sql2 = "select price from customer";
	String sql6 = "select pname from customer";

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
			stmt1 = con.createStatement();
			stmt2 = con.createStatement();
			stmt6 = con.createStatement();

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
 	ResultSet rs = stmt.executeQuery(sql1);
 	ResultSet rs1 = stmt1.executeQuery(sql2);
 	ResultSet rs2 = stmt2.executeQuery(sql2);
 	ResultSet rs6 = stmt6.executeQuery(sql6);
 %>

	<center>
		<div class="container">
			<caption>
				<h1>OverAll Sales Tracking</h1>
			</caption>

			<p>This page shows entire Transaction Details also option for
				price filter is given below...!!!!!</p>
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

			<form action="straking" method="post">
				<table>

					<%-- <h1>Price Range Filter</h1>
				<tr>
					<td><label>Price Range From <input list="Range"
							name="from" id="p" size="5" />
					</label> <datalist id="Range"> <%
 	while (rs1.next()) {
 		float pro = rs1.getFloat("price");
 %>

						<option value="<%=pro%>">
							<%=pro%></option>
						<%
							}
						%> </datalist></td>

					<td><label>Price Range From <input list="Range"
							name="to" id="p" size="5" />
					</label> <datalist id="Range"> <%
 	while (rs2.next()) {
 		float pro = rs2.getFloat("price");
 %>

						<option value="<%=pro%>">
							<%=pro%></option>
						<%
							}
						%> </datalist></td>
				</tr>
 --%>



					<!-- <!-- For just empty box...!!! -->
					<h1>Price Range Filter</h1>
					<br>
					<tr>
						<td><div class="col-xs-4" /> <label style="color: cyan">Price_Range_From
								<input list="Range" name="from" class="form-control" id="p"
								size="150" />
						</label></td>
						<td><div class="col-xs-4" /> <label style="color: cyan">Price_Range_To
								<input list="Range" name="to" class="form-control" id="p"
								size="150" />
						</label></td>
						<td><input type="submit" class="btn btn-info" value="Filter" />
					</tr>

					<%-- <tr>
					<td><label><input name="From"/>Price Range From</label> <select>
							<%
								while (rs1.next()) {
							%>
							<option><%=rs1.getFloat("price")%></option>
							<%
								}
							%>
					</select></td>

					<td><label><input name="TO"/>Price Range To</label> <select>
							<%
								while (rs2.next()) {
							%>
							<option><%=rs2.getFloat("price")%></option>
							<%
								}
							%>
					</select></td> --%>
					</tr>
				</table>
			</form>

			<!-- THIS IS FOR TEXT SEARCH FILTER....!!!!!! -->
			<br> <br>

			<h1>Product Based Filter</h1>
			<div class="container">
				<form action="pricefilter" method="post">
					<table>
						<tr>
							<td><label><div class="col-xs-2" />Product_Based_Filter
									<input list="product" name="prname" id="p" class="form-control"
									onkeyup="doSomething();" size="150" /> </label> <datalist id="product">
								<%
									while (rs6.next()) {
										String pro = rs6.getString("pname");
								%>

								<option value="<%=pro%>">
									<%=pro%></option>

								<%
									}
								%> </datalist></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn btn-info" value="Filter" />
						</tr>
						<!-- </form> -->
						</div>

					</table>
				</form>
			</div>

			<br>
			<h1>Date Range Filter</h1>

			<form action="ybase" method="post">
				<table>
					<tr>
						<td><div class="col-xs-4" /> <label style="color: cyan">Date_Range_From
								<input list="Range" name="from" placeholder="YYYY-MM-DD" class="form-control" id="p"
								size="550" />
						</label></td>
						<td><div class="col-xs-4" /> <label style="color: cyan">Date_Range_To
								<input list="Range" placeholder="YYYY-MM-DD" name="to" class="form-control" id="p"
								size="550" />
						</label></td>
						<td><input type="submit" class="btn btn-info" value="Filter" />
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>