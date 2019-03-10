<%-- 
    Document   : userChoiceInfo
    Created on : Aug 29, 2016, 8:36:58 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>userChoiceInfo</title>
    </head>
    <body>
        <div class="container">             
            <div class="infoch"> 
                <div class="infk">
                    <h3>Rented film is:</h3>               
                    <p class="text-info bg-info"> Title: ${film.title}</p>
                    <p class="text-info bg-info"> Genre: ${film.genre}</p>
                    <p class="text-info bg-info"> Year: ${film.year}</p>
                    </br>
                    <h3>User:</h3>                    
                    <p class="text-info bg-info"> Username : ${user.username}</p>         
                    </br>
                </div>
            </div>            
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/userRentNewFilm">Return to available films</a>
            </div> 
        </div>
    </body>
</html>
