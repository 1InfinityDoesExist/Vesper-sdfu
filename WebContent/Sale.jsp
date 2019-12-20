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
</head>

<!-- 
<style>
table,th,td {
	border: 1px solid #333;
}
</style>
 -->
<%
	response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("uname") == null) {
		response.sendRedirect("SignIn.jsp");
	}
%>





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
	
	
	
<body>


	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->




	<center>
		<form action="inv" method="post" autocomplet="on">
			<h1>Section 1: Customer Info</h1>
			<table>
				<tr>
					<td>Customer Name</td>
					<td><input type="text" name="cname"
						placeholder="String Only >= 5" size="25" required></td>
				</tr>
				<tr>
					<td>Customer Address</td>
					<td><input type="text" name="cadd"
						placeholder="String Only >= 5" size="25" required></td>
				</tr>
				<tr>
					<td>Todays Date/Time</td>
					<td><input type="text" name="dt"
						value="<%=new java.util.Date()%>" size="25" readonly></td>
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
					<label>Product Name <input list="product" name="product"
						id="p" onkeyup="doSomething();" size="25" />
					</label>

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
				</tr>
				<tr>
					<td>Serial Number</td>
					<td><input type="text" name="sn" id="text4"
						placeholder="String Only >= 5" size="25" required></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="pr" id="text1" onkeyup="sum();"
						placeholder="String Only >= 5" size="25" required></td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td><input type="text" name="qu" id="text2" onkeyup="sum();"
						placeholder="String Only >= 5" size="25" required></td>
				</tr>
				<tr>
					<td>Item Price</td>
					<td><input type="text" name="ip" id="text3"
						placeholder="String Only >= 5" size="25" readonly></td>
				</tr>
			</table>



			<script>
				function sum() {
					var txtFirstNumberValue = document.getElementById('text1').value;
					var txtSecondNumberValue = document.getElementById('text2').value;
					var result = parseInt(txtFirstNumberValue)
							* parseInt(txtSecondNumberValue);
					if (!isNaN(result)) {
						document.getElementById('text3').value = result;
					}
				}
			</script>




			<h1>Section 3: Total Price</h1>
			<table>
				<tr>
					<td>Total Price</td>
					<td><input type="text" name="tp" id="textf"
						placeholder="String Only >= 5" size="25" readonly></td>
				</tr>
			</table>


			<!-- 
			<script>
				function sum() {
					var to = document.getElementById('text3').value;
					var prev = document.getElementById('text2').value;
					var result = parseInt(to)
							+ parseInt(prev);
					if (!isNaN(result)) {
						document.getElementById('textf').value = result;
					}
				}
			</script> -->

			<br> <br> <input type="submit" value="Submit">

		</form>

		<tr>
			<td></td>
			<br>
			<br>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 150%;"
				type="button" value="Welocme"
				onclick="window.location.href='Welcome.jsp'" /></td>
		</tr>
	</center>

	<form action="lout" method="post">
		<input type="submit" value="LogOut" />
	</form>














	<script type="text/javascript">
	<!--
		//-->

		$(document)
				.ready(
						function() {
							//@naresh action dynamic childs
							var next = 0;
							$("#add-more")
									.click(
											function(e) {
												e.preventDefault();
												var addto = "#field" + next;
												var addRemove = "#field"
														+ (next);
												next = next + 1;

												var newIn = ' <div id="field'+ next +'" name="field'+ next +'"><!-- Product Name--><div class="form-group"> <label class="col-md-4 control-label" for="product_name">Prdouct Name</label><div class="col-md-5"><input id="product_name" name="product_name" type="text" placeholder="" class="form-control input-md"></div></div><br><br><!-- Serial Number--><div class="form-group"><label class="col-md-4 control-label" for="serial_number">Serial Number</label><div class="col-md-5"><input id="serial_number" name="serial_number" type="text" placeholder="" class="form-control input-md"></div></div><br><br><!-- Price Per Unit--><div class="form-group"> <label class="col-md-4 control-label" for="price_per">Price Per Unit</label> <div class="col-md-5"><input id="price_per" name="price_per" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- Quantity--><div class="form-group"> <label class="col-md-4 control-label" for="quantity">Quality</label> <div class="col-md-5"><input id="quantity" name="quantity" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- Total Price--><div class="form-group"> <label class="col-md-4 control-label" for="total_price">Total Price</label><div class="col-md-5"><input id="total_price" name="total_price" type="text" placeholder="" class="form-control input-md"></div></div><br><br><!-- File Button --><div class="form-group"><label class="col-md-4 control-label" for="action_json"></div></div></div>';

												var newInput = $(newIn);
												var removeBtn = '<button id="remove'
														+ (next - 1)
														+ '" class="btn btn-danger remove-me" >Remove</button></div></div><div id="field">';
												var removeButton = $(removeBtn);
												$(addto).after(newInput);
												$(addRemove)
														.after(removeButton);
												$("#field" + next).attr(
														'data-source',
														$(addto).attr(
																'data-source'));
												$("#count").val(next);

												$('.remove-me')
														.click(
																function(e) {
																	e
																			.preventDefault();
																	var fieldNum = this.id
																			.charAt(this.id.length - 1);
																	var fieldID = "#field"
																			+ fieldNum;
																	$(this)
																			.remove();
																	$(fieldID)
																			.remove();
																});
											});

						});
	</script>
























</body>
</html>