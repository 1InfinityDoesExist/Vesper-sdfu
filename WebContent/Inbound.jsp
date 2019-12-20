<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
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
	<bod y> <SCRIPT type="text/javascript">
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
	<center>
		<div class="container">
			<h1>Inbound Page</h1>
			<form action="in" method="post">
				<table>


					<tr>
						<td><div class="col-xs-2" />UniqueCode</td>
						<td><input id="uncode" type="text" class="form-control"
							name="uncode" placeholder="Automatic" size="25" readonly></td>
						</div>

					</tr>
					<br></br>


					<tr>
						<td><div class="col-xs-2" />ProductName</td>
						<td><input id="productName" type="text" class="form-control"
							name="productName" placeholder="String >= 3" size="25" required></td>
						</div>
					</tr>
					<br></br>


					<tr>
						<td><div class="col-xs-2" />ProductSerialName</td>
						<td><input id="productsn" type="text" class="form-control"
							name="productsn" placeholder="+alphaNumeric >= 3" size="25"
							required></td>
						</div>
					</tr>
					<br></br>


					<!-- <tr>
						<td>Product Serial Number</td>
						<td><input type="text" name="productsn"
							placeholder="+alphaNumeric >= 3" required></td>
					</tr>
					<br></br> -->


					<tr>
						<td><div class="col-xs-2" />QuantityReceived</td>
						<td><input id="text1" onkeyup="sum();" type="text"
							class="form-control" name="quantreceived" placeholder="+Integer"
							size="25" required></td>
						</div>
					</tr>
					<br></br>

					<!-- <tr>
						<td>Quantities Received</td>
						<td><input type="text" name="quantreceived" id="text1"
							onkeyup="sum();" placeholder="+Integer" required></td>
					</tr>
					<br></br> -->


					<tr>
						<td><div class="col-xs-2" />PricePerUnit</td>
						<td><input id="text2" onkeyup="sum();" type="text"
							class="form-control" name="priceperunit" placeholder=" +ve Float"
							size="25" required></td>
						</div>
					</tr>
					<br></br>


					<!-- <tr>
						<td>Price per unit</td>
						<td><input type="text" name="priceperunit" id="text2"
							onkeyup="sum();" placeholder="Int Float" required></td>
					</tr>
					<br></br> -->


					<tr>
						<td><div class="col-xs-2" />TotalPrice</td>
						<td><input id="text3" type="text" class="form-control"
							name="totalp" placeholder="+ve Float" size="25" required></td>
						</div>
					</tr>
					<br></br>
					<!-- <tr>
						<td>Total Price</td>
						<td><input type="text" name="totalp" id="text3"
							placeholder="Int Float" readonly></td>
					</tr>
					<br>
					<br> -->



					<script>
						function sum() {
							var txtFirstNumberValue = document
									.getElementById('text1').value;
							var txtSecondNumberValue = document
									.getElementById('text2').value;
							var result = parseInt(txtFirstNumberValue)
									* parseInt(txtSecondNumberValue);
							if (!isNaN(result)) {
								document.getElementById('text3').value = result;
							}
						}
					</script>

					<tr>
						<td><div class="col-xs-2" />VendorName</td>
						<td><input id="vendorname" type="text" class="form-control"
							name="vendorname" placeholder="Lenght 5" Int Float" size="25"
							required></td>
						</div>
					</tr>
					<br></br>

					<!-- <tr>
						<td>Vendor Name</td>
						<td><input type="text" name="vendorname"
							placeholder="Lenght 5" required></td>
					</tr>
					<br></br> -->


					<tr>
						<td><div class="col-xs-2" />Date</td>
						<td><input id="date" type="text" class="form-control"
							name="date" placeholder="" Int Float" size="25"
							value="<%=new java.sql.Date(new java.util.Date().getTime())%>" required></td>
						</div>
					</tr>
					<br></br>
					<%-- <tr>
						<td>Date</td>
						<td><input type="text" name="date" placeholder="MM-DD-YEAR"
							value="<%=new java.util.Date()%>" readonly></td>
					</tr>
					<br></br> --%>

					<tr>
						<td></td>
						<td><input type="submit" class="btn btn-info"
							value="Register"></td>
					</tr>
					<!-- <tr>
						<td></td>
						<td><input type="submit" name="Register"></td>
					</tr>
					<br></br> -->
				</table>
				<tr>
					<td></td>
					<br>
					<br>
					<td><input
						style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 100%;"
						type="button" value="Welocme"
						onclick="window.location.href='Welcome.jsp'" /></td>
				</tr>
			</form>
		</div>
	</center>
</body>
</html>