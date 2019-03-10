<%-- 
    Document   : allUsers
    Created on : Aug 26, 2016, 4:49:56 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>        
        <%@include file="header.jsp" %>
        <title>allUsers</title>
    </head>
    <body>
        <div class="container">  
            <h4 id="ttl0">List of all users</h4>
            </br>            
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th> 
                    <th>      </th>    
                    <th>      </th> 
                </tr>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.first}</td>
                        <td>${user.last}</td>
                        <td>${user.username}</td>
                        <td>                         
                            <a href="${pageContext.request.contextPath}/editUser/${user.username}" class="btn btn-primary active" role="button">Edit</a>
                        </td>   
                        <td> 
                            <a href="${pageContext.request.contextPath}/infoUser/${user.username}" class="btn btn-info active" role="button">Info</a>
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
