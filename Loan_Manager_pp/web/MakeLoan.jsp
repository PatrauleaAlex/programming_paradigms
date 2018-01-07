<%-- 
    Document   : makeLoan
    Created on : Jan 6, 2018, 3:36:50 PM
    Author     : alex
--%>
<%@page import="dao.BankDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Bank"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    BankDAO bankDao = BankDAO.getInstance();
    ArrayList<domain.Bank> banks = bankDao.getBanks();
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Make Loan</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <div id ="left">
            

        </div>


        <div id="content">
            <div class="header">
                <h1 class="header-text">Loan MANAGER</h1>
            </div>
            <nav>
                <%if (request.getSession().getAttribute("user") != null) {%>

                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="MakeLoan.jsp">Make Loan</a></li>
                    <li><a href="MakePayment.jsp">Make Payment</a></li>
                    <li><a href="Payments.jsp">Payments</a></li>
                    <li><a href="Profile.jsp">Profile</a></li>
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
            <h2>Make Loan</h2>   
            <form method="post" action="MakeLoanController">
                <div class="form-element">
                    <label>Bank:</label>
                </div>
                <%for (Bank t : banks) {%>
                <div class="form-element">
                    <input type="radio" name="bank" id ="bank" value="<%=t.getId()%>"><%=t.toString()%><br>
                </div>
                <%}%>
                <div class="form-element">
                    <label for="amount">Amount: </label>
                    <input type="number" min="100" max="999999" name="amount" id="amount" required>
                </div>
                <div class="form-element">
                    <label for="rate">Rate: </label>
                    <input type="number" min="0" max="99" name="rate" id="rate" required>
                </div>
		<div class="form-element">
                    <label for="nomon">Number of Months:</label>
                    <input type="number" min="6" max="240" name="nomon" id="nomon" required>
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
