<%-- 
    Document   : adminHome
    Created on : Aug 25, 2016, 4:53:39 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>        
        <%@include file="header.jsp" %>
        <title>adminHome</title>
    </head>
    <body>
        <div class="container">
            <div class="admin">                        
                <h1>ADMIN PAGE!</h1>                       
                <h3>Admin info:</h3>           
                <h4>Id admin: ${user.id}</h4>
                <h4>First name: ${user.first}</h4>
                <h4>Last name: ${user.last}</h4> 
                <h4>Username: ${user.username}</h4>
                </br> 
            </div>
            <div class="adminlink">                            
                <a href="${pageContext.request.contextPath}/allFilms">List of all films</a>  
                </br>
                <a href="${pageContext.request.contextPath}/rentedFilms">View / return rented films</a>
                </br>
                <a href="${pageContext.request.contextPath}/availableFilms">View / renting available films</a>         
                </br>
                <a href="${pageContext.request.contextPath}/addFilm">Add film</a>
                </br>
                </br>
                <a href="${pageContext.request.contextPath}/allUsers">List of all users</a>
                </br>
                <a href="${pageContext.request.contextPath}/usersWithRent">List of users with rented films</a>
                </br>
                <a href="${pageContext.request.contextPath}/usersNoRent">List of users without rented films</a>
                </br>
                <a href="${pageContext.request.contextPath}/addUser">Add user</a>
                </br>         
                </br>
                <a href="${pageContext.request.contextPath}/statistics">Statistics</a>
                </br>         
                </br>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-lg active" role="button">Logout</a>  
            </div>
        </div>
    </body>
</html>
