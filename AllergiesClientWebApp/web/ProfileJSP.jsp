<%-- 
    Document   : ProfileJSP
    Created on : Jan 12, 2017, 11:31:20 PM
    Author     : Ada
--%>

<%@page import="java.util.Vector"%>
<%@page import="domain.TriggerFactor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">

    </head>
  <% Vector<TriggerFactor> factors = (Vector<TriggerFactor>) session.getAttribute("factors");%>

    <%
        String error = "";
        if (request.getAttribute("LOGIN_ERROR") != null) {
            error = (String) request.getAttribute("LOGIN_ERROR");
        }

    %>
    <body>
        <div id="bigmenu">

             <div id="bigmenulinks">
            <%if(session.getAttribute("user")==null){%>
            <a href="LoginJSP.jsp">Login</a>
            <a href="RegistrationJSP.jsp">Register</a>
            
            <%}else{%>
            You are logged in as <b><%=session.getAttribute("user")%></b>
            <a href="LogoutC">Logout</a>
            <%}%>
            
        </div>
        </div>
        <div id="sidebar">
            <h1><img id="pizzalogo" src="imgs/allergy-free.png" alt="#" width="120px"/></h1>
            

            <div id="menu">
                       <a  href="indexJSP.jsp">Home</a>
                        <a class="active" href="ProfileJSP.jsp">Profile</a>
                        <a href="RegisterAllergyReaction.jsp">Register Allergy Reaction Location</a>
                <a href="RegisterNoAllergyLocation.jsp">Register Visit To Location</a>
                        <a href="CheckLocationJSP.jsp">Check Location</a>
                           <a href="RiskJSP.jsp">Risk Map</a>
                <a href="AllergyReactionProb.jsp">Allergy Reactions Probabilities</a>

                

            </div>
            <br><br>
            <br><br>
            <br><br>
            <img id="logo" src="imgs/allogo.png" >
        </div>
        <div id="sidebar2">

            <div id="menu2">

            </div>
        </div>

        <div id="contentUser" style='background-size: 100% auto; background-attachment: fixed;'>
            <div id="uppermenu">
                <nav>
                    <ul>

                        <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        

                    </ul>
                </nav>
            </div>

            <h1>Set Factor</h1>
            <div class="loginform">
                <form method="post" action="ProfileC">
                    <div class="form-element">
                         <label for="name">Set Factor : </label>
                                <select id="cmb" name="cmb">
                                    <%  for (int i = 0; i < factors.size(); i++) {
                                            TriggerFactor option = factors.get(i);
                                    %>
                                    <option value="<%= option.getId()%>"><%= option.getFactorName()%></option>
                                    <% }%>
                                </select>
                    </div>
                   
                   
                    <%                     if (!"".equals(error)) {
                    %>

                    <div class="error"> error </div>
                    <%}
                    %>
                    <div class="form-element">
                        <input id="formBt" style="background-color: #EB865B;" type="submit" value="Submit">
                        <input id="formBt" style="background-color: #EB865B;" type="reset" value="Reset">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>