<%-- 
    Document   : userHome
    Created on : Aug 25, 2016, 4:53:56 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>userHome</title>
    </head>
    <body> 
        <div class="container"> 
            <div class="user">                  
                <h1>User page - WELCOME!</h1>                       
                <h3>User data:</h3>                          
                <h4>First name: ${user.first}</h4>
                <h4>Last Name: ${user.last}</h4> 
                <h4>Username: ${user.username}</h4>
                </br>                 
            </div> 
            <div class="userlink"> 
                <a href="${pageContext.request.contextPath}/userRentedFilms">Review of rented films</a> 
                </br>
                <a href="${pageContext.request.contextPath}/userRentNewFilm">Rent new film</a> 
                </br>         
                </br>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-lg active" role="button">Logout</a>  
            </div>
        </div>
    </body>
</html>
