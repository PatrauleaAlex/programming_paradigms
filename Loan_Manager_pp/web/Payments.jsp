<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.PaymentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Payment"%>


<%
    PaymentDAO paymentDAO = PaymentDAO.getInstance();
    ArrayList<domain.Payment> payments = paymentDAO.getPayments((String) request.getSession().getAttribute("user"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Payments</title>
      
    </head>
    <body>
        
        <div id ="left">
            

        </div>


        <div id="content">
            <div class="header">
               
            </div>
            <nav>
                <%if (request.getSession().getAttribute("user") != null) {%>

                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="MakeLoan.jsp">Make Loan</a></li>
                    <li><a href="MakePayment.jsp">Make Payment</a></li>
                    
                    <li id = "tail"><a href="LogOutController">Logout</a></li>
                </ul>
                <%} else {%>
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li id = "tail" ><a href="Login.jsp">Log In</a></li>
                    <li id = "tail" ><a href="Registration.jsp">Register</a></li>
                </ul>
                <%}%>
            </nav>
            
            <div id="center">
                <%if (request.getSession().getAttribute("user") != null) {%>
                                <%for (Payment l : payments) {%>
                <div class="form-element">
                    <input type="radio" name="payment" id ="payment" value="<%=l.getInfo()%>"><%=l.toString()%><br>
                </div>
                <%}%>
                
                
                
                
                <%}%>
            </div>
            <div id="footer">PP</div>
        </div>
        <div id="right">
                 
        </div>
        

    </body>

</html>