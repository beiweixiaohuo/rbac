<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp" %>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="employee"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">员工编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/employee/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="${emp.id}" name="id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="${emp.name}">
                        </div>
                    </div>
                    <input type="hidden" id="pwd" name="password" value="${emp.password}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="email" value="${emp.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="age" value="${emp.age}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="department.id">
                                <c:forEach var="dept" items="${depts}">
                                    <c:if test="${dept.id == emp.deptId}">
                                        <option selected value="${dept.id}">${dept.name}
                                    </c:if>
                                    <c:if test="${dept.id != emp.deptId}">
                                        <option value="${dept.id}">${dept.name}
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-6">
                            <button id="btn_submit" type="button" class="btn btn-success">
                                <span class="glyphicon glyphicon-saved"></span> 修改
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    /*初始化jQuery框架*/
    $(function () {

        // 在保存按钮上绑定点击事件
        $('#btn_submit').click(function () {// function是事件处理函数
            $('#editForm').submit();
        });
    });


</script>
</body>
</html>