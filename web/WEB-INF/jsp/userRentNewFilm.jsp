<%-- 
    Document   : userRentNewFilm
    Created on : Aug 29, 2016, 7:37:04 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>userRentNewFilm</title>
    </head>
    <body>  
        <div class="container"> 
            <h4 id="ttl0">Review of available films</h4>
            </br>
            <div class="usertable1"> 
                <table class="table table-bordered table-hover">              
                    <tr>               
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Year</th> 
                        <th>      </th>                  
                    </tr>
                    <c:forEach var="flm" items="${availableFilms}">
                        <tr>                       
                            <td>${flm.title}</td>
                            <td>${flm.genre}</td>
                            <td>${flm.year}</td>
                            <td>                         
                                <a href="${pageContext.request.contextPath}/userChoiceFilm/${flm.title}" class="btn btn-success active">Rent</a>                                                                
                            </td>                          
                        </tr>
                    </c:forEach>                                                                                                                                      
                </table>
                <h4 class="text-warning bg-warning">NOTE: User cannot rent more than 5 films simultaneously.</h4>
            </div>
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/userHome">Return to userHome</a>
            </div>  
            </br>
            </br>
            </br>
        </div>
    </body>
</html>



