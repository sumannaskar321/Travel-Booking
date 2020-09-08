<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>FOR APPLY BOOKING/USER</title>
</head>
<body>

  <%
  	 String fare = (String)request.getParameter("fare");
     String id = (String)request.getParameter("id");
     String userid = (String)session.getAttribute("userid");
     String username = (String)session.getAttribute("username");
    
     Date date = new Date();
     SimpleDateFormat formatt = new SimpleDateFormat("dd/MM/yyyy");
     String bookingdate = formatt.format(date);
     
     

	if (userid == null)
		response.sendRedirect("userlogin.jsp");%>
<div class="container">
 <jsp:include page="menu.jsp"></jsp:include>

 <div class="row">
      <div class="col-md-6 col-sm-8 mx-auto">
           <div class="card">
               <div class="card-body" style="background-color: #eeefff">
                    <div class="mt-2 text-center">
                         <h3 style="color: red;">REGISTRATION</h3>
                         <h3 style="color: brown;">${massage}</h3>
                     </div>
               
                     <div class="mt-4 text-left">
                       <form action="tour" method="POST">

				        <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR ID :</label>
				         <input type="text" value="<%= id %>" name="tourid" class="form-control" readonly="readonly">
				        </div>
				        
				          <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR DATE :</label>
				         <input type="text" id="date" readonly="readonly" name="date" value="<%= bookingdate %>" class="form-control" required="required">
				        </div>
    
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">CUSTOMER EMAIL :</label>
			             <input type="text" id="email" name="email" value="<%= userid %>" class="form-control" readonly="readonly">
			            </div>
			
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">CUSTOMER NAME :</label>
			             <input type="text" id="name" name="name" value="<%= username %>" class="form-control" readonly="readonly">
			            </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR FARE (per person):</label>
				         <input type="text" value="<%= fare %>" name="totalfare" class="form-control" readonly="readonly">
				        </div>
				         <div class="form-group">
                           <label for="people" class="text-uppercase font-weight-bold">NO OF PEOPLE * :</label>
                            <select name="people" id="people" onchange="checkpeople()">
                                       <option selected value="Default">No of people</option>
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                 </select>
                                 <div class="text-danger font-weight-bold" id="peopleerrormessage"></div>
                             </div>    
                             <br/>
                             <br/>
			            <input type="submit" class="btn btn-success btn-block" value="APPLY">


                     </form>
                   </div> <!-- Form tag div -->
              </div> <!-- Card Body End -->
          </div> <!-- Card End -->
       </div> <!-- Col alignment end -->
     </div> <!-- Row End -->
 </div> <!-- Container End -->
    

</body>
</html>