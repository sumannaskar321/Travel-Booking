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
<title>User Show Booking</title>
</head>
<body>
<div class="container">
<%
	String usern = (String)session.getAttribute("userid");
	
	if(usern == null)
		response.sendRedirect("userlogin.jsp");
	
	ArrayList<BookingModel> blist = (ArrayList<BookingModel>)session.getAttribute("bookinglist");
	if(blist.size()>0)
	{
%>
<jsp:include page="menu.jsp"></jsp:include>
<br>
	<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>TOUR ID</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>TOTAL FARE</th>
		<th>TOUR DATE</th>
		<th>CLICK</th>
		<th>PAYMENT</th>
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
		  <td><a href="deleteid?id= <%= bookingmodel.getBookingid()%>">CANCEL</a></td>
		<td><a href="payment.jsp?bookingid= <%= bookingmodel.getBookingid()%>&tourid= <%= bookingmodel.getTourid()%>&name= <%= bookingmodel.getName()%>&email= <%= bookingmodel.getEmail()%>&people= <%= bookingmodel.getPeople()%>&totalfare= <%= bookingmodel.getTotalfare()%>&date= <%= bookingmodel.getDate()%>">PAYMENT</a></td>
	</tr>
	<%}%>
</table>
<%}
	else
	{%>
	<jsp:include page="menu.jsp"></jsp:include>
<br>
<h4>NO RECORDS </h4>
<table class="table table-striped">
	<tr>
		<th>BOOKING ID</th>
		<th>TOUR ID</th>
		<th>NAME</th>
		<th>E-MAIL</th>
		<th>NO. OF PERSON</th>
		<th>CLICK</th>
	</tr>
</table>
 <%
 }
%>
<br/>
 <form action="feedBackCustomer" method="post">
 <div class="form-group">
 <label for="feedBack" class="text-uppercase font-weight-bold text-primary">FeedBack *</label>
 <input type="text" class="form-control" id="feedBack" name="feedBack" placeholder="Enter Your feedBack" required="required" onblur="checkname()" onfocus= "clearname()">
 <div class="text-danger font-weight-bold" id="feedBackerrormessage"></div>
 </div>
 <input type="submit" class="btn btn-success btn-block" value="send feedback">
 </form>
<br/>
</div>
</body>
</html>