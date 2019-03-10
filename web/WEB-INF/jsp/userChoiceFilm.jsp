<%-- 
    Document   : userChoiceFilm
    Created on : Sep 11, 2016, 12:26:34 PM
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
        <title>userChoiceFilm</title>
    </head>
    <body>
        <div class="container">  
            <div class="uchf"> 
                <h3 class="text-info bg-info">Please, click the button "Query".</h3>
                </br>
                <h3 class="text-info bg-info">You will be informed about film status and possibility of renting.</h3>
                </br>
                </br>
                </br>
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#${flm.id}">Query</button>          
                <c:if test="${isRented}">                                 
                    <div class="modal fade" id="${flm.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content col-md-6">
                                <div class="modal-header">                                                    
                                    <h4 class="modal-title" id="myModalLabel">Film '${flm.title}' has just been rented by another user. Please, choose another film.</h4>
                                </div>
                                <div class="modal-footer">                                                 
                                    <a href="${pageContext.request.contextPath}/userRentNewFilm" class="btn btn-warning active btn-md" role="button">Return to available films</a> 
                                </div>
                            </div>
                        </div>
                    </div> 
                </c:if>
                <c:if test="${not isRented}">    
                    <c:if test="${fn:length(user.films) lt 5}">
                        <div class="modal fade" id="${flm.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content col-md-6">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">You has chosen the film: '${flm.title}'</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="${pageContext.request.contextPath}/userChoiceInfo/${flm.title}" class="btn btn-success active btn-md" role="button">Confirm</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Quit</button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </c:if>
                    <c:if test="${fn:length(user.films) eq 5}"> 
                        <div class="modal fade" id="${flm.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content col-md-6">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">You have 5 rented films already!</h4>
                                    </div>
                                    <div class="modal-footer">                                               
                                        <a href="${pageContext.request.contextPath}/userHome" class="btn btn-warning active btn-md" role="button">Return to userHome</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>                                          
                </br>
            </div>  
                </br>
                </br>
                </br>
                <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/userRentNewFilm">Return to available films</a>
            </div>
        </div>
    </body>
</html>
