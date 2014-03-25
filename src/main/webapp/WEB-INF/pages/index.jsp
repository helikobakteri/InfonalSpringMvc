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
    <script type="text/javascript">
        var deleteId = 0;
        var userName=0;
        var userLastName=0;
        var userCell=0;
        var updateId=0;
        function deleteUserConfirm(id){
               deleteId = id;

        }
        function updateUserConfirm(id,name,lname,cell){
             updateId=id;

            $('#id').val(id)   ;
            $('#upFormName').val(name)   ;
            $('#upFormlName').val(lname)   ;
            $('#upFormCell').val(cell)   ;
        }

    </script>

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
                <form:form action="save" method="post" commandName="user">

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
                    <a href="#updateUser" onclick="updateUserConfirm('${u.id}','${u.name}','${u.lastname}','${u.cell}')"  class="btn btn-sm btn-primary" data-toggle="modal">Update</a>

                    <a href="#deleteUser" onclick="deleteUserConfirm('${u.id}')" class="btn btn-sm btn-primary"  data-toggle="modal">Delete</a>
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
                    Update User
                </h4>
            </div>
            <div class="modal-body">

                <form:form action="update"  method="post" commandName="user">
                    <input type="hidden" name="id" id="id"/>     <br>
                    <label>Name</label>              <br>
                    <input type="text" class="span3" name="name" id="upFormName"/>      <br>
                    <label>Last name</label>                                                <br>
                    <input type="text" class="span3" name="lastname" id="upFormlName"/>    <br>
                    <label>Cell Number</label>                                             <br>
                    <input type="text" class="span3" name="cell" id="upFormCell"/>    <br>

                    <tr>
                        <td> </td><br>
                        <td><input type="submit"  class="btn btn-success" value="Submit"></td>
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
<div class="modal fade" id="deleteUser" tabindex="-1" role="dialog"
     aria-labelledby="deleteLabel" aria-hidden="true">
    <div class="modal-dialog" id="deleteUserDialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">

                </button>
                <h4 class="modal-title" id="deleteLabel">
                    Delete User
                </h4>
            </div>
            <div class="modal-body">
                            Are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close
                </button>
                <button type="button" class="btn btn-default"
                        onclick="window.location='delete?id='+deleteId"  data-dismiss="modal">Confirm
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



</body>
</html>