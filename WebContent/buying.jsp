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
			<h1>Hello ${cn } You Have Choose To Buy : <kbd> ${pn } </kbd></h1>
			<form method="post" action="dbm">
				<table>
					<tr>
						<td><div class="col-xs-2" />Product_ID</td>
						<td><input type="text" name="pid" id="text4" class="form-control"
							placeholder=${idd } size="25" readonly></td>
						</div>
					</tr>
					<tr>
						<td>Product_Name</td>
						<td><input type="text" name="pn" id="text4" class="form-control"
							placeholder=${pn } size="25" readonly></td>
						</div>
					</tr>
					<tr>
						<td><div class="col-xs-2" />Serial_Number</td>
						<td><input type="text" name="sn" id="text4" class="form-control" placeholder=${se} size="25" readonly></td>
						</div>
					</tr>
					<tr>
						<td><div class="col-xs-2" />Per_Price</td>
						<td><input type="text" name="pr" id="text1" class="form-control"
							placeholder=${pprice } size="25" readonly></td>
						</div>
					</tr>


					<tr>
						<td><div class="col-xs-2" />Quantity</td>
						<td><input type="text" id="text2" placeholder=${qqu }
							name="qt" class="form-control" onkeyup="sum();" /> <%-- <select name="department">
								<c:forEach begin="1" end="${qqu}" var="position">
									<option>
										<c:out value="${position}" />
									</option>
								</c:forEach> --%>
						</select></td>
					<tr>
						<td><div class="col-xs-2" />Total_${pn}_Price</td>
						<td><input type="text" name="ip" id="text3"
							placeholder="Automatic"  class="form-control" size="25" readonly></td>
					</tr>

					<tr>
						<td></td>
						<div class="container">
						<td><input type="submit" class="btn btn-info" value="Contiue" /></td>
						</div>
					</tr>
				</table>
			</form>

			<tr>
				<td></td>
				<br>
				<br>
				<td><input
					style="width: 200px; padding: 20px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 150%;"
					type="button" value="Discard"
					onclick="window.location.href='copyjsp.jsp'" /></td>
			</tr>



			<script>
				function sum() {
					var to = document.getElementById('text2').value;

					var prev = ${pprice};
					var result = parseInt(to) * prev;
					if (!isNaN(result)) {
						document.getElementById('text3').value = result;
					}
				}
			</script>
		</div>
	</center>
</body>

</html>