<%-- 
    Document   : choiceInfo
    Created on : Aug 27, 2016, 7:59:32 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>choiceInfo</title>
    </head>
    <body>
        <div class="container"> 
            <div class="infoch"> 
                <div class="infk">
                    <h3>You have chosen the film:</h3>               
                    <p class="text-info bg-info"> Title: ${film3.title}</p>
                    </br>
                    <h3>User:</h3>
                    <p class="text-info bg-info"> First Name : ${user3.first}</p>
                    <p class="text-info bg-info"> Last Name : ${user3.last}</p>
                    <p class="text-info bg-info"> Username : ${user3.username}</p>         
                    </br>
                </div>
            </div>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/availableFilms">Return to available films</a> 
            </div>
        </div>
    </body>
</html>
