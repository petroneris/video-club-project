<%-- 
    Document   : logout
    Created on : Aug 26, 2016, 1:58:08 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>  
        <title>logout</title>
    </head>
    <body>
        <div class="container"> 
            <div class="accden"> 
                <h1 class="text-info bg-info">User: ${userout.username}</h1>
                </br>
                <h1 class="text-info bg-info">is logout successfully!</h1>
                </br>
                </br>
                </br>
            </div>
            <div class="indexLog"> 
                <a href="${pageContext.request.contextPath}/">Return to the beginning of application</a>
            </div>
        </div>
    </body>
</html>
