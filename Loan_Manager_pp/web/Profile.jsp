<%-- 
    Document   : Profile
    Created on : May 18, 2016, 3:13:51 PM
    Author     : alex
--%>

<%@page import="dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    UserDAO userDAO = UserDAO.getInstance();
    domain.User u = userDAO.getUserInfo((String) request.getSession().getAttribute("user"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Profile</title>
    </head>
    <body>
        <div id ="left">


        </div>


        <div id="content">
            <div class="header">
                <h1 class="header-text"> Loan MANAGER</h1>
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
                <h1>User Info:</h1>
                <form method="post">

                    <div class="form-element">
                        <label>Username: <%= u.getUsername()%></label>
                    </div>

                    <div class="form-element">
                        <label>First Name: <%= u.getFname()%></label>
                    </div>
                    
                    <div class="form-element">
                        <label>Last Name: <%= u.getLname()%> </label>
                    </div>          

                    <div class="form-element">
                        <label>Phone number: <%= u.getPhone()%></label>
                    </div>

                    <div class="form-element">
                        <label>Email: <%= u.getEmail()%></label>
                    </div>
                    
                    <div class="form-element">
                        <label style="color:red">*** Average Payment Value:  <%= u.getEmail()%></label>
                    </div>
                    
                    <div class="form-element">
                        <label style="color:red">*** Max Loan Value: <%= u.getEmail()%></label>
                    </div>
                    
                    <div class="form-element">
                        <label style="color:red">*** Average Payment Value: <%= u.getEmail()%></label>
                    </div>
                    
                    <div class="form-element">
                        <label style="color:red">*** Max Payment Value: <%= u.getEmail()%></label>
                    </div>

                </form>  
               
            </div>
            <div id="footer">PP</div>
        </div>
        <div id="right">

        </div>


    </body>

</html>