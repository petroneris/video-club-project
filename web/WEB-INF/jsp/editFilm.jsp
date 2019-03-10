<%-- 
    Document   : editFilm
    Created on : Aug 24, 2016, 10:47:08 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>editFilm</title>
    </head>
    <body>
        <div class="container"> 
            <form class="edtflm" method="POST" commandName="edtFilm" action="/VideoKlubProjekat/editFilm">
                <input type="hidden" name="id" value="${film1.id}">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input id="title" class="form-control" type="text" name="title" value="${film1.title}" size="50" readonly="true"/>
                </div>

                <div class="form-group">
                    <label for="genre">Genre:</label>
                    <input id="genre" class="form-control" type="text" name="genre" value="${film1.genre}" size="20"/>
                </div>

                <div class="form-group">
                    <label for="year">Year:</label>
                    <input id="year" class="form-control" type="text" name="year" value="${film1.year}" size="20"/>
                </div>                
                <div id="centrlink">                    
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Save</button>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content col-md-6">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">The film '${film1.title}' will be changed.</h4>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-info btn-md" value="yes" name="Save" >
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Quit</button>
                                </div>
                            </div>
                        </div>
                    </div>     
                </div>                
            </form>
            <div id="centrlink"> 
                <a href="${pageContext.request.contextPath}/allFilms">Return to all films</a>
            </div>
        </div>                
    </body>
</html>
