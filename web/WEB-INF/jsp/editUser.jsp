<%-- 
    Document   : editUser
    Created on : Aug 24, 2016, 10:47:43 PM
    Author     : Snezana
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>editUser</title>
    </head>
    <body>
        <div class="container"> 
            <form class="edtusr" method="POST" commandName="edtUser" action="/VideoKlubProjekat/editUser">
                <input type="hidden" name="id" value="${user1.id}">
                <div class="form-group">
                    <label for="first">First Name:</label>
                    <input id="first" class="form-control" type="text" name="first" value="${user1.first}" size="20" />
                </div>

                <div class="form-group">
                    <label for="last">Last Name:</label>
                    <input id="last" class="form-control" type="text" name="last" value="${user1.last}" size="20" />
                </div>

                <div class="form-group">
                    <label for="idNum">JMBG:</label>
                    <input id="idNum" class="form-control" type="text" name="idNum" value="${user1.idNum}" size="20" />
                </div>

                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input id="phone" class="form-control" type="text" name="phone" value="${user1.phone}" size="20" />
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input id="username" class="form-control" type="text" name="username" value="${user1.username}" size="20" readonly="true" />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input id="password" class="form-control" type="password" name="password" value="${user1.password}" size="20" />
                </div>
                <div id="centrlink">                    
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Save</button>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content col-md-6">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">The user '${user1.username}' will be changed.</h4>
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
                <a href="${pageContext.request.contextPath}/allUsers">Return to all users</a>
            </div>
        </div>
    </body>
</html>
