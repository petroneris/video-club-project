<%-- 
    Document   : usersNoRent
    Created on : Aug 27, 2016, 3:37:49 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%@include file="header.jsp" %> 
        <title>usersNoRent</title>
    </head>
    <body>
        <div class="container"> 
            <h4 id="ttl0">List of users without rented films</h4>
            </br>
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th> 
                    <th>      </th>                              
                </tr>
                <c:forEach var="user" items="${usersNoRentList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.first}</td>
                        <td>${user.last}</td>
                        <td>${user.username}</td>
                        <td>                                                     
                            <a data-toggle="modal" href="#${user.id}" class="btn btn-warning active" role="button">Delete</a>
                            <div class="modal fade" id="${user.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content col-md-6">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">The user '${user.username}' will be deleted.</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="${pageContext.request.contextPath}/deleteUser/${user.username}" class="btn btn-danger active btn-md" role="button">Yes</a>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                        </div>
                                    </div>
                                </div>
                            </div>   
                        </td>                                      
                    </tr>
                </c:forEach>
            </table>
            </br>
            <h4 class="text-warning bg-warning">${param.message}</h4>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/adminHome">Return to adminHome</a> 
            </div>
            </br>
            </br>
            </br>
        </div>
    </body>
</html>
