<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table,th,td {
	border: 1px solid #333;
}
</style>
<body>


	<form action="lout" method="post">
		<input type="submit" value="LogOut" />
	</form>

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
		<!-- <h1 style="color: wheat">This is you bill / Receipt</h1> -->

		<table>
			<caption>Receipt Issued By ${uname} to ${uc }</caption>
			<tr>
				<th>Customer Name</th>
				<th>Customer Address</th>
				<th>Date</th>
				<th>Product Name</th>
				<th>Serial Number</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>

			</tr>
			<tr>

				<td>${uc}</td>
				<td>${pn }</td>
				<td>${ps }</td>
				<td>${qr }</td>
				<td>${ppu }</td>
				<td>${vn }</td>
				<td>${date }</td>
				<td>${tt}</td>
			</tr>
		</table>
		<tfoot>
			<br>
			<br>
			<br>
			<tr>
				<td colspan="3"><h1 style="color: Blue">Shopkeeper
						${uname} did your biling on ${ps}</h1></td>
			</tr>
		</tfoot>

	<!-- 	<a href="Sale.jsp"><h1>Continue Selling To Customer</h1></a> <br> -->
		<br>
		<tr>
			<td></td>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 100%;"
				type="button" value="Continue Selling "
				onclick="window.location.href='Sales.jsp'" /></td>
		</tr>
		<br></br>
		<tr>
			<td></td>
			<td><input
				style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 100%;"
				type="button" value="Go To Welocme Page"
				onclick="window.location.href='Welcome.jsp'" /></td>
		</tr>

	</center>

</body>
</html>