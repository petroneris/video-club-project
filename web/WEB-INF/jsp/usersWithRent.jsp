<%-- 
    Document   : usersWithRent
    Created on : Aug 27, 2016, 9:13:52 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>usersWithRent</title>
    </head>
    <body>
        <div class="container">  
            <h4 id="ttl0">List of users with rented films</h4>
            </br>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th> 
                    <th colspan="5">Title</th>
                </tr>
                <c:forEach var="user" items="${usersWithRentList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.first}</td>
                        <td>${user.last}</td>
                        <td>${user.username}</td>
                        <c:forEach var="flm" items="${user.films}">                   
                            <td>${flm.title}</td>                   
                        </c:forEach>                                      
                    </tr>
                </c:forEach>
            </table>
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/adminHome">Return to adminHome</a> 
            </div>
            </br>
            </br>
            </br>
        </div>  
    </body>
</html>
