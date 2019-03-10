<%-- 
    Document   : addUser
    Created on : Aug 24, 2016, 10:47:26 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>addUser</title>
    </head>
    <body>
        <div class="container"> 
            <form class="addusr" action="/VideoKlubProjekat/addUser" method="POST">

                <div class="form-group">  
                    <input class="form-control" type="text" id="first" name="first" value="" size="20" placeholder="First Name" required/>   
                </div>

                <div class="form-group">  
                    <input class="form-control" type="text" id="last" name="last" value="" size="20" placeholder="Last Name"required/>  
                </div>

                <div class="form-group">  
                    <input class="form-control" type="number" id="jmbg" name="jmbg" value="" size="20" placeholder="JMBG" required/>  
                </div>

                <div class="form-group">  
                    <input class="form-control" type="text" id="phone" name="phone" value="" size="20" placeholder="Phone" required/>  
                </div>

                <div class="form-group">  
                    <input class="form-control" type="text" id="username" name="username" value="" size="20" placeholder="Username" required/>  
                </div>

                <div class="form-group">  
                    <input class="form-control" type="password" id="password" name="password" value="" size="20" placeholder="Password" required/>   
                </div>  

                <div class="radio-inline">
                    <label>
                        <input type="radio" name="name" id="userrole" value="USER" checked>
                        USER
                    </label>
                </div>
                <div class="radio-inline">
                    <label>
                        <input type="radio" name="name" id="adminrole" value="ADMIN">
                        ADMIN
                    </label>
                </div>

                <br>                                               
                <div id="centrlink">  
                    <input class="btn btn-primary btn-lg" type="submit" value="Add" name="add" />
                    <br>  
                    <br>
                    <p class="text-success bg-success">${addmess}</p>
                </div> 
            </form>
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/adminHome">Return to adminHome</a>
            </div>
        </div> 
    </body>
</html>
