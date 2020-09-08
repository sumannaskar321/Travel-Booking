<%@page import="com.proj.model.BookingModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String admin = (String)session.getAttribute("adminusername");
	
	if(admin == null)
		response.sendRedirect("adminlogin.jsp");
	
	ArrayList<BookingModel> blist = (ArrayList<BookingModel>)session.getAttribute("bookinglist");
	if(blist.size()>0)
	{
%>
 <div class="container">
<jsp:include page="menu.jsp"></jsp:include><br><br>
<br><br>
	<form action="calculateTour" method="post">
	<input type="date" name="date" placeholder="Enter Tour Id" required>
	<input type="submit" value="SEARCH">
	</form>
<br><br>

<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>TOUR ID</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>DATE OF TOUR</th>
	</tr>
	<%for(BookingModel bookingmodel : blist){ %>
	<tr>
		<td><%= bookingmodel.getBookingid()%></td>
		<td><%= bookingmodel.getTourid()%></td>
		<td><%= bookingmodel.getName()%></td>
		<td><%= bookingmodel.getEmail()%></td>
		<td><%= bookingmodel.getPeople()%></td>
		<td><%= bookingmodel.getTotalfare()%></td>
		<td><%= bookingmodel.getDate()%></td>
	</tr>
	<%}%>
</table>
<%}
	else
	{%>
	<jsp:include page="menu.jsp"></jsp:include><br><br>
<h1 style="brown: red;">NO RECORDS FOUND</h1>
<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>TOUR ID</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
	</tr>
</table>
 <%
 }
%>
</div>
</body>
</html>