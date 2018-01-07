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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Payments</title>

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
                <%if (request.getSession().getAttribute("user") != null) {%>
                

                <h2> All your Payments: </h2>
                <table class="table table-bordered">
                    <thead>
                        <tr>

                            <th>Amount</th>
                            <th>Date</th>
                            <th>Info</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%for (Payment p : payments) {%>
                        <tr>
                            <td><%=p.getAmmount()%></td>
                            <td><%=p.getDate()%></td>
                            <td><%=p.getInfo()%></td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>




                <%}%>
            </div>
            <div id="footer">PP</div>
        </div>
        <div id="right">

        </div>


    </body>

</html>