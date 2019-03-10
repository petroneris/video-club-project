<%-- 
    Document   : userRentedFilms
    Created on : Aug 29, 2016, 1:30:30 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>userRentedFilms</title>
    </head>
    <body>
        <div class="container">  
            <h4 id="ttl0">Review of rented films</h4>
            </br>
            <div class="usertable1">
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Year</th>                                            
                    </tr>           
                    <c:forEach var="flm" items="${userRentedFilms}">
                        <tr>
                            <td>${flm.title}</td>  
                            <td>${flm.genre}</td> 
                            <td>${flm.year}</td> 
                        </tr>
                    </c:forEach>                                                
                </table>
                <h4 class="text-info bg-info">No of rented films: ${userNumFilms}</h4>
            </div>
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/userHome">Return to userHome</a> 
            </div> 
        </div>
    </body>
</html>
