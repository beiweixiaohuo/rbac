<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加账号</title>
    <style>
        .modal-header{
            font-size:2em;
            text-align:center;
            font-family:Verdana,Arial,sans-serif;
            text-shadow:1.5px 1.5px 1px #8c8c8c;
        }
        .modal-body {
            color: #6C6C6C;
        }
    </style>
</head>
<body>
    <div class="modal-header form-inline">
        <span>添加账号</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <form action="/account/input.do" method="post">
            <div class="form-group">
                <lable for="account" class="form-inline">账号：
                <input type="text" name="id" id="account" class="form-control">
                </lable>
            </div>

            <div class="form-group">
                <lable for="account" class="form-inline">姓名：
                <input type="text" name="name" id="name" class="form-control">
                </lable>
            </div>

            <div class="form-group">
                <lable for="account" class="form-inline">电话：
                <input type="text" name="phone" id="phone" class="form-control">
                </lable>
            </div>
            <div class="form-group">
            <lable class="form-inline">部门：
            <select class="form-control" name="deptId">
                <c:forEach var="dept" items="${depts}">
                    <option value="${dept.id}">${dept.name}</option>
                </c:forEach>
            </select>
            </lable>
            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-success" value="添加">
            </div>


        </form>
    </div>

</body>
</html>
