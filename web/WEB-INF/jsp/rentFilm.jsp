<%-- 
    Document   : rentFilm
    Created on : Aug 24, 2016, 10:48:20 PM
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
        <title>rentFilm</title>
    </head>
    <body>
        <div class="container"> 
            <h3 class="bg-info text-info" >Rent film: " ${film2.title} "</h3>         
            </br>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Id</th>
                    <th>First Name</th> 
                    <th>Last Name</th> 
                    <th>Username</th> 
                    <th>        </th>
                </tr>
                <c:forEach var="user" items="${userList2}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.first}</td>                  
                        <td>${user.last}</td>
                        <td>${user.username}</td> 
                        <td>  
                            <a data-toggle="modal" href="#${user.id}" class="btn btn-success active">Rent</a>
                            <c:if test="${fn:length(film2.users) gt 0}">                                 
                                <div class="modal fade" id="${user.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content col-md-6">
                                            <div class="modal-header">                                                    
                                                <h4 class="modal-title" id="myModalLabel">Film '${film2.title}' has just been rented by another user.</h4>
                                            </div>
                                            <div class="modal-footer">                                                 
                                                <a href="${pageContext.request.contextPath}/availableFilms" class="btn btn-warning active btn-md" role="button">Return to available films</a> 
                                            </div>
                                        </div>
                                    </div>
                                </div>                                 
                            </c:if>
                            <c:if test="${fn:length(film2.users) eq 0}"> 
                                <c:if test="${fn:length(user.films) lt 5}">
                                    <div class="modal fade" id="${user.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content col-md-6">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">User '${user.username}' has chosen the film: '${film2.title}'</h4>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="${pageContext.request.contextPath}/choiceInfo/${film2.title}/${user.username}" class="btn btn-success active btn-md" role="button">Confirm</a>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Quit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </c:if>
                                <c:if test="${fn:length(user.films) eq 5}"> 
                                    <div class="modal fade" id="${user.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content col-md-6">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">User '${user.username}' has 5 rented films already!</h4>
                                                </div>
                                                <div class="modal-footer">                                               
                                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Quit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table> 
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/availableFilms">Return to available films</a>
            </div>
        </div> 
        </br>
        </br>
        </br>
    </body>
</html>
