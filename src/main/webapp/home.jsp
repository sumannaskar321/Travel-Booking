<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>

<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

   <h1>THIS IS HOME PAGE </h1>
   <table>
   <tr>
   <th>FEED BACK</th>
   </tr>
   <c:forEach var="obj" items="${FEED}">
     <tr>
     <td>${obj.feedBack}</td>
   </tr>
   </c:forEach>
   </table>
 </div>
</body>
</html>