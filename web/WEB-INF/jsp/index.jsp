<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>  
        <style> 
            body  {
                background-image: url("resources/images/springBloss4.png");               
            }
        </style>
        <title>WELCOME!</title>
    </head>
    <body>
        <div class="container">
            <div class="bckgrnd">
                <br>
                <h1>WELCOME!</h1>
                <br>
                <h1>VIDEO CLUB SPRING</h1>
                <br>                
                <br>
                <div class="indexLog">
                    <a href="${pageContext.request.contextPath}/login">Login</a>                    
                </div>
            </div>
        </div>
        <script>
        </script>        
    </body>
</html>
