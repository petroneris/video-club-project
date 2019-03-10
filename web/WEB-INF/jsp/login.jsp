<%-- 
    Document   : login
    Created on : Aug 24, 2016, 11:37:39 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>  
        <title>Login</title>
    </head>
    <body>
        <div class="container"> 
            <form class="logform" action="/VideoKlubProjekat/login" method="POST">
                <div class="form-group">                   
                    <input id="username" class="form-control" type="text" name="username" value="" size="20" placeholder="Username" required/>
                </div>              
                <br>
                <div class="form-group">                  
                    <input id="password" class="form-control" type="password" name="password" value="" size="20" placeholder="Password" required/>
                </div>          
                <br> 
                <div class="indexLog">
                    <input class="btn btn-primary btn-lg" type="submit" value="Login" name="login" />
                </div>
                <br>                              
                <br>                 
                <p class="text-danger bg-danger" >${message}</p>
            </form> 
        </div>
    </body>
</html>
