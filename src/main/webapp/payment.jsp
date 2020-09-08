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
  	 String bookingid = (String)request.getParameter("bookingid");
     String tourid = (String)request.getParameter("tourid");
     String name = (String)request.getParameter("name");
     String email = (String)request.getParameter("email");
     String people = (String)request.getParameter("people");
     String totalfare = (String)request.getParameter("totalfare");
     String date = (String)request.getParameter("date");
	%>
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
                       <form action="paybook" method="POST">
                       
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">TOUR ID :</label>
			             <input type="text" id="tourId" name="tourId" value="<%= tourid %>" class="form-control" readonly="readonly">
			            </div>
			            
				        <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">BOOKING ID :</label>
				         <input type="text" value="<%= bookingid %>" name="bookid" id="bookid" class="form-control" readonly="readonly">
				        </div>
				        
				          <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR BOOK DATE :</label>
				         <input type="text" id="date" readonly="readonly" name="date" value="<%= date %>" class="form-control" required="required">
				        </div>
   
			            <div class="form-group">
			             <label class="text-uppercase font-weight-bold text-primary">CUSTOMER NAME  :</label>
			             <input type="text" id="cusName" name="cusName" value="<%= name %>" class="form-control" readonly="readonly">
			            </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">CUSTOMER EMAIL:</label>
				         <input type="text" value="<%= email %>" name="cusEmail" id="cusEmail" class="form-control" readonly="readonly">
				        </div>
				        
				           <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">NUMBER OF PEOPLE:</label>
				         <input type="text" value="<%= people %>" name="people" id="people" class="form-control" readonly="readonly">
				        </div>
			            
			            <div class="form-group">
				         <label class="text-uppercase font-weight-bold text-primary">TOUR TOTAL FARE:</label>
				         <input type="text" value="<%= totalfare %>" name="totalrupee" id="totalrupee" class="form-control" readonly="readonly">
				        </div>
				           
			            <div class="form-group">
						<label for="payment" class="text-uppercase font-weight-bold">Payment *</label>
 							<input type="radio" name="payment" id="payment" value="SuccessFull Payment" onclick="clearPayment()" />
 									<span id="successfullpay">SuccessFull Payment</span>
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
 </div>
</body>
</html>