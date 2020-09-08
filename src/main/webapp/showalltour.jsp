
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
<title>SHOW ALL TOUR</title>
</head>
<body>
 <%String uname = (String)session.getAttribute("adminusername");

	if (uname == null)
		response.sendRedirect("adminlogin.jsp");

	ArrayList<TourModel> alist = (ArrayList<TourModel>)session.getAttribute("alltourlist");
	if(alist.size()>0)
	{ 
%>
<div class="container">
<jsp:include page="menu.jsp"></jsp:include>
<br>
<h3 style="color: brown;"> ${msg} </h3>
<br>

	<table class="table table-striped">
		<tr>
			<th>TOUR ID</th>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>DATE</th>
			<th>FARE</th>
			<th>CAPACITY</th>
			<th>DELETE</th>
		</tr>
	<% for(TourModel tourmodel : alist) { %>
		<tr>
			<td><%= tourmodel.getId() %></td>
			<td><%= tourmodel.getTourname() %></td>
			<td><%= tourmodel.getVisiting_places() %></td>
			<td><%= tourmodel.getDuration() %></td>
			<td><%= tourmodel.getDescription() %></td>
			<td><%= tourmodel.getDate() %></td>
			<td><%= tourmodel.getFare() %></td>
			<td><%= tourmodel.getCapacity() %></td>

			<td><a href="/deletetour?id=<%= tourmodel.getId()%>">DELETE</a></td>

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
<jsp:include page="menu.jsp"></jsp:include><br><br>
 <h1 style="color: red;">NO RECORDS FOUND</h1>
 <table class="table table-striped">
		<tr>
			<th>TOUR ID</th>
			<th>TOUR NAME</th>
			<th>VISITING PLACES</th>
			<th>DURATION</th>
			<th>DESCRIPTION</th>
			<th>DATE</th>
			<th>FARE</th>
		</tr>
</table>
 <%
 }
%>
</div>
</body>
</html>