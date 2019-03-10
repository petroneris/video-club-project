<%-- 
    Document   : addFilm
    Created on : Aug 25, 2016, 12:33:01 AM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>addFilm</title>
    </head>
    <body>
        <div class="container"> 
            <form class="addflm" action="/VideoKlubProjekat/addFilm" method="POST">
                <div class="form-group">                    
                    <input id="title" class="form-control" type="text" name="title" value="" size="80" placeholder="Title" required/>
                </div>
                <br>
                <div class="form-group">                    
                    <input id="genre" class="form-control" type="text" name="genre" value="" size="20" placeholder="Genre" required/>
                </div>                
                <br>
                <div class="form-group">                    
                    <input id="year" class="form-control" type="number" name="year" value="" size="20" placeholder="Year" required/>
                </div>                
                <br>                                               
                <div id="centrlink">  
                    <input class="btn btn-primary btn-lg" type="submit" value="Add" name="add" />
                    <br>  
                    <br>
                    <p class="text-success bg-success">${addmess}</p>
                </div> 
            </form>
            </br>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/adminHome">Return to adminHome</a> 
            </div>
        </div>       
    </body>
</html>
