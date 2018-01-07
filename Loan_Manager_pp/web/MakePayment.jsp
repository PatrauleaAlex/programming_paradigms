<%@page import="domain.Loan"%>
<%@page import="dao.LoanDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Payment"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    LoanDAO loanDAO = LoanDAO.getInstance();
    ArrayList<Loan> loans = loanDAO.getLoans((String)request.getSession().getAttribute("user"));
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Make Payment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
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
                    <li><a href="Payments.jsp">Payments</a></li>
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
            <h2>Make Payment</h2>   
            <form method="post" action="MakePaymentController">
                <%for (Loan t : loans) {%>
                <div class="form-element">
                    <input type="radio" name="loan" id ="loan" value="<%=t.getId()%>"><%=t.toString()%><br>
                </div>
                <%}%>
                <div class="form-element">
                    <label for="amount">Amount: </label>
                    <input type="number" min="1" name="amount" id="amount" required>
                </div>
                <div class="form-element">
                    <label for="date">Date: </label>
                    <input type="text" name="date" id="date" required>
                </div>
                <div class="form-element">
                    <label for="info">Info: </label>
                    <input type="text" name="info" id="info" required>
                </div>
                <div class="form-element">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>                 
                
            </form>
             
        </div>
            <div id="footer">PP</div>
        </div>
        <div id="right">
                 
        </div>
        

    </body>

</html>