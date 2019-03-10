<%-- 
    Document   : allFilms
    Created on : Aug 24, 2016, 10:48:42 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>        
        <%@include file="header.jsp" %>
        <title>allFilms</title>
    </head>
    <body>
        <div class="container">  
            <h4 id="ttl0">List of all films</h4>
            </br>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Year</th> 
                    <th>      </th>                              
                </tr>
                <c:forEach var="flm" items="${filmList}">
                    <tr>
                        <td>${flm.id}</td>
                        <td>${flm.title}</td>
                        <td>${flm.genre}</td>
                        <td>${flm.year}</td>
                        <td>                         
                            <a href="${pageContext.request.contextPath}/editFilm/${flm.title}" class="btn btn-primary active" role="button">Edit</a>
                        </td>                                      
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
