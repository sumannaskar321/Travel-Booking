
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  
    <ul class="navbar-nav">
     <li class="nav-item">
        <a class="nav-link" href="/showallFeedback">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/payinfo">SHOW PAY</a>
      </li>
      </ul>
      </nav>

   <h1 style="brown: red;">SUCCESSFULL PAYMENT</h1>
   <table class="table table-striped">
   <tr>
   <th>BOOK ID</th>
   <th>TOUR ID</th>
   <th>CUSTOMER NAME</th>
   <th>CUTOMER EMAIL</th>
   <th>PEOPLE</th>
   <th>TOTAL RUPEE</th>
   <th>DATE</th>
   <th>PAYMENT</th>
   </tr>
  
     <tr>
     <td>${event.bookid}</td>
     <td>${event.tourId}</td>
     <td>${event.cusName}</td>
     <td>${event.cusEmail}</td>
     <td>${event.people}</td>
     <td>${event.totalrupee}</td>
     <td>${event.date}</td>
     <td>${event.payment}</td>
   </tr>

   </table>

 </div>
</body>
</html>