<%-- 
    Document   : statistics
    Created on : Sep 6, 2016, 2:09:28 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>statistics</title>
    </head>
    <body>
        <div class="container"> 
            <div class="stat"> 
                <h1 id="ttl0">Statistics</h1>
                </br>
                <h3 id="ttl0">Films</h3>
                </br>
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>Id</th>
                        <th>Title</th>                
                        <th>No of renting</th>                              
                    </tr>            
                    <c:forEach var="flm" items="${filmsList}">
                        <tr>
                            <td>${flm.id}</td>
                            <td>${flm.title}</td>
                            <td>${flm.numRents}</td>                                                                         
                        </tr>
                    </c:forEach>
                </table> 
                <h4 class="text-info bg-info">No of films: ${filmsCount}</h4>
                <h4 class="text-info bg-info">Average No of rents per film : <fmt:formatNumber type="number" groupingUsed="false" value="${avgRentsPerFilm}"/></h4>  
                </br>
                <h3 id="ttl0">Users</h3>
                </br>
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th> 
                        <th>No of rented films</th>                  
                    </tr>
                    <c:forEach var="user" items="${usersList}">                
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.first}</td>
                            <td>${user.last}</td>
                            <td>${user.username}</td>
                            <td>${user.rentedFilms}</td>                                                                                        
                        </tr>
                    </c:forEach>
                </table>                               
                <h4 class="text-info bg-info">No of users: ${numUsers}</h4>                               
                <h4 class="text-info bg-info">Average No of rented films per user: <fmt:formatNumber type="number" groupingUsed="false" value="${statsAvgFilmsPerUser}"/></h4>              
                </br>
            </div>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/adminHome">Return to adminHome</a>
            </div>
            </br>
            </br>
            </br>
        </div>
    </body>
</html>
