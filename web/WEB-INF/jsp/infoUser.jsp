<%-- 
    Document   : infoUser
    Created on : Aug 27, 2016, 4:14:28 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>infoUser</title>
    </head>
    <body>
        <div class="container"> 
            <div class="infou">                                    
                <div class="pkl">
                    <h3>User data:</h3>
                    </br>
                    <p class="text-info bg-info"> Id: ${infoUser.id}</p>
                    <p class="text-info bg-info"> First Name: ${infoUser.first}</p>
                    <p class="text-info bg-info"> Last Name: ${infoUser.last}</p>
                    <p class="text-info bg-info"> Username: ${infoUser.username}</p>
                    <p class="text-info bg-info"> JMBG: ${infoUser.idNum}</p>
                    <p class="text-info bg-info"> Phone: ${infoUser.phone}</p>
                    <p class="text-info bg-info"> Password: ${infoUser.password}</p>                
                    </br>
                </div>   
            </div>  
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/allUsers">Return to all users</a>
            </div>
        </div>
    </body>
</html>
