<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>


    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.0.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>


</head>
<body>
<h1>


</h1>



<a href="#addUser"class="btn btn-sm btn-primary" data-toggle="modal"> Add New User</a>
<br>
<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
     aria-labelledby="addLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">

                </button>
                <h4 class="modal-title" id="addLabel">
                   Add New User
                </h4>
            </div>
            <div class="modal-body">
                <form:form action="savem.html" method="post" commandName="user">

                    <label>Name</label>              <br>
                    <input type="text" class="span3" name="name" placeholder="Type name here..."/>      <br>
                    <label>Last name</label>                                                <br>
                    <input type="text" class="span3" name="lastname" placeholder="Type lastname here..."/>    <br>
                    <label>Cell Number</label>                                             <br>
                    <input type="text" class="span3" name="cell" placeholder="Type cell number here..."/>    <br>
                    <tr>
                        <td> </td><br>

                        <td><input type="submit" class="btn btn-success" value="Submit"></td>
                    </tr>



                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="bs-docs-example">
    <table class="table">
        <tr>
            <th>Name</th>
            <th>Lastname</th>
            <th>Cell Number</th>
        </tr>
        <c:forEach items="${userList}" var="u">
            <tr>

                <td>${u.name}</td>
                <td>${u.lastname}</td>
                <td>${u.cell}</td>

                <td>
                    <a href="#updateUser" <c:set var="user" scope="session" value="${u}"/> class="btn btn-sm btn-primary" data-toggle="modal">Update</a>

                    <a href="#"class="btn btn-sm btn-primary" onclick="window.location='deletem?id=${u.id}'"  data-toggle="modal">Delete</a>
                </td>
            </tr>


        </c:forEach>
    </table>
</div>



<div class="modal fade" id="updateUser" tabindex="-1" role="dialog"
     aria-labelledby="updateLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">

                </button>
                <h4 class="modal-title" id="updateLabel">
                    Add New User
                </h4>
            </div>
            <div class="modal-body">
                <form:form action="updatem?id=${user.id}" method="get" commandName="user">

                    <label>Name</label>              <br>
                    <input type="text" class="span3" name="name" placeholder="<c:out value="${user.name}"/>"/>      <br>
                    <label>Last name</label>                                                <br>
                    <input type="text" class="span3" name="lastname" placeholder="<c:out value="${user.lastname}"/>"/>    <br>
                    <label>Cell Number</label>                                             <br>
                    <input type="text" class="span3" name="cell" placeholder="<c:out value="${user.cell}"/>"/>    <br>
                    <tr>
                        <td> </td><br>
                        <td><input type="submit" class="btn btn-success" value="Submit"></td>
                    </tr>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



</body>
</html>