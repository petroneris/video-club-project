<%-- 
    Document   : returnInfo
    Created on : Aug 24, 2016, 10:49:26 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>returnInfo</title>
    </head>
    <body>
        <div class="container"> 
            <div class="infoch"> 
                <div class="infk">
                    <h3>Returned film is:</h3>               
                    <p class="text-success bg-success"> Title: ${film4.title}</p>
                    </br>
                    <h3>User:</h3>
                    <p class="text-success bg-success"> First Name : ${user4.first}</p>
                    <p class="text-success bg-success"> Last Name : ${user4.last}</p>
                    <p class="text-success bg-success"> Username : ${user4.username}</p>         
                    </br>
                </div>
            </div>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/rentedFilms">Return to rented films</a>
            </div>
        </div>
    </body>
</html>
