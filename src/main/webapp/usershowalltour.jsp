<%@page import="com.proj.model.TourModel"%>
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
<title>SHOW ALL TOUR FOR USER</title>
</head>
<body>
<div class="container">
<%String usern = (String)session.getAttribute("userid");

	if (usern == null)
		response.sendRedirect("userlogin.jsp");

	ArrayList<TourModel> atlist = (ArrayList<TourModel>)session.getAttribute("tlist");
	if(atlist.size()>0)
	{
%>

<jsp:include page="menu.jsp"></jsp:include>
<br><br>
	<form action="searchbytour" method="post">
	<input type="text" name="tourname" placeholder="Enter Place Name" required>
	<input type="submit" value="SEARCH">
	</form>
<br><br>
	<table class="table table-striped">
		<tr>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>DATE</th>
			<th>FARE</th>
			<th>CAPACITY</th>
			<th>CLICK</th>
		</tr>
	<% 
		for(TourModel tourmodel : atlist) 
		{
	%>
		<tr>
			<td><%= tourmodel.getTourname() %></td>
			<td><%= tourmodel.getVisiting_places() %></td>
			<td><%= tourmodel.getDuration() %></td>
			<td><%= tourmodel.getDescription() %></td>
			<td><%= tourmodel.getDate() %></td>
			<td><%= tourmodel.getFare() %></td>
			<td><%= tourmodel.getCapacity() %></td>
						
			<td><a href="applybooking.jsp?id= <%= tourmodel.getId()%>&fare= <%= tourmodel.getFare() %>">BOOKING</a></td>
		</tr>
<%
	}
%>
	</table>	
<%
	}
	else
	{
%>
 	<jsp:include page="menu.jsp"></jsp:include>
<br>
<h4>NO RECORDS </h4>
<jsp:include page="menu.jsp"></jsp:include>
 <%
 }
%>
</div>
</body>
</html>