<%-- 
    Document   : rentedFilms
    Created on : Aug 24, 2016, 10:48:32 PM
    Author     : Snezana
--%>

<%@page import="com.snezana.models.Film"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>rentedFilms</title>
    </head>
    <body>
        <div class="container"> 
            <h4 id="ttl0">Review of rented films</h4>               
            </br>       
            </br>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Film Id</th>
                    <th>Title</th>
                    <th>User Id</th>
                    <th>First Name</th> 
                    <th>Last Name</th> 
                    <th>Username</th>
                    <th>Start Renting time</th> 
                    <th>NOTE</th>  
                    <th>Duration Time</th>
                    <th> </th>
                </tr>
                <c:forEach var="flm" items="${rentedFilmsList}">
                    <tr>
                        <td>${flm.id}</td>
                        <td>${flm.title}</td>                   
                        <c:forEach var="user" items="${flm.users}">
                            <td>${user.id}</td>   
                            <td>${user.first}</td> 
                            <td>${user.last}</td>   
                            <td>${user.username}</td> 
                            <c:set var="rusername" value="${user.username}"/>
                        </c:forEach>
                        <td>${flm.convertTime(flm.rentTime)}</td>
                        <c:if test="${flm.isRentalTimeExpired(flm.rentTime, currTime)}">
                            <td> <p class="text-success bg-success"><c:out value="Remaining"/><p> </td>
                        </c:if>
                        <c:if test="${not flm.isRentalTimeExpired(flm.rentTime, currTime)}">
                            <td> <p class="text-danger bg-danger"><c:out value="!!!Exceeded"/><p> </td>
                        </c:if>
                        <td>${flm.remainingTime(flm.rentTime, currTime)}</td> 
                        <td>                                           
                            <a data-toggle="modal" href="#${flm.id}" class="btn btn-primary active">Return film</a>
                            <div class="modal fade" id="${flm.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content col-md-6">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">The user '<c:out value="${rusername}"/>' returns the film: '${flm.title}'</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="${pageContext.request.contextPath}/returnInfo/${flm.title}" class="btn btn-success active btn-md" role="button">Confirm</a>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Quit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                                                                                                      
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
