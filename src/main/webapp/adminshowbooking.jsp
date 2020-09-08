<%@page import="com.proj.model.Payment"%>
<%@page import="com.proj.model.BookingModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Show Bookings</title>
</head>
<body>
<div class="container">

<%
	String admin = (String)session.getAttribute("adminusername");
	
	if(admin == null)
		response.sendRedirect("adminlogin.jsp");
	
	ArrayList<Payment> blist = (ArrayList<Payment>)session.getAttribute("bookinglist");
	if(blist.size()>0)
	{
%>
<jsp:include page="menu.jsp"></jsp:include><br><br>
 <br><br>
	<form action="searchbypay" method="post">
	<input type="text" name="tourId" placeholder="Enter Tour id" required>
	<input type="submit" value="SEARCH">
	</form>
<br><br>
	<form action="searchpaydate" method="post">
	<input type="text" name="date" placeholder="Enter Tour date" required>
	<input type="submit" value="SEARCH">
	</form>
<br><br>
<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>TOUR ID</th>
		<th>CUSTOMER NAME</th>
		<th>CUSTOMER E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>DATE OF TOUR</th>
		<th>PAYMENT</th>
	</tr>
	<%for(Payment payment : blist){ %>
	<tr>
		<td><%= payment.getBookid()%></td>
		<td><%= payment.getTourId()%></td>
		<td><%= payment.getCusName()%></td>
		<td><%= payment.getCusEmail()%></td>
		<td><%= payment.getPeople()%></td>
		<td><%= payment.getTotalrupee()%></td>
		<td><%= payment.getDate()%></td>
		<td><%= payment.getPayment()%></td>
	</tr>
	<%}%>
</table>
<%}
	else
	{%>
	<jsp:include page="menu.jsp"></jsp:include><br><br>
<h1 style="brown: red;">NO RECORDS FOUND</h1>

 <%
 }
%>


</div>
</body>
</html>