<%-- 
    Document   : accessDenied
    Created on : Aug 25, 2016, 9:08:47 PM
    Author     : Snezana
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>accessDenied</title>
    </head>
    <body>
        <div class="container">
            <div class="accden">
                <h1 class="text-danger bg-danger">YOU HAVE NO ACCESS TO ADMIN PAGES!</h1> <br>
                <h3 class="text-danger bg-danger">Access attempt by user: ${user.username}</h3> <br>
                <br>
            </div>
            <div id="centrlink"> <a href="${pageContext.request.contextPath}/userHome">Return to userHome</a> <br>
                <br>
                <br>
                <br> <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-lg active" role="button">Logout</a> </div>
        </div>
    </body>
</html>