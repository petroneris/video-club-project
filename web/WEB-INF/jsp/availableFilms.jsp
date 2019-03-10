<%-- 
    Document   : availableFilms
    Created on : Aug 26, 2016, 6:49:07 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%@include file="header.jsp" %> 
        <title>availableFilms</title>
    </head>
    <body>
        <div class="container"> 
            <h4 id="ttl0">List of available films</h4>
            </br>
            <table class="table table-bordered table-hover">
                <thead> 
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Year</th> 
                        <th>      </th> 
                        <th>      </th> 
                    </tr>
                </thead>
                <c:forEach var="flm" items="${availableFilmsList}">
                    <tbody> 
                        <tr>
                            <td>${flm.id}</td>
                            <td>${flm.title}</td>
                            <td>${flm.genre}</td>
                            <td>${flm.year}</td>
                            <td> 
                                <a href="${pageContext.request.contextPath}/rentFilm/${flm.title}" class="btn btn-primary active" role="button">Rent</a>                             
                            </td>   
                            <td>                                 
                                <a data-toggle="modal" href="#${flm.id}" class="btn btn-warning active" role="button">Delete</a>
                                <div class="modal fade" id="${flm.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content col-md-6">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Film '${flm.title}' will be deleted.</h4>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="${pageContext.request.contextPath}/deleteFilm/${flm.title}" class="btn btn-danger active btn-md" role="button">Yes</a>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>                          
                            </td>                                      
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
            </br>
            <h4 class="text-warning bg-warning">${param.message}</h4>
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
