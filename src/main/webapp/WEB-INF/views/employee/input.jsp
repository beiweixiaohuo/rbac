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
                    <h1 class="page-head-line">员工新增</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/employee/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="${emp.id}" name="id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="${emp.name}"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pwd" name="password"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">验证密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="repwd"
                                       id="repwd" placeholder="再输入一遍密码">
                            </div>
                        </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="email" value="${emp.email}"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="age" value="${emp.age}"
                                   placeholder="请输入年龄">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="department.id">
                                <c:forEach var="dept" items="${depts}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <script>
                            //部门回显:设置当前编辑的员工id为选中状态


                        </script>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-6">
                            <button id="btn_submit" type="button" class="btn btn-success">
                                <span class="glyphicon glyphicon-saved"></span> 保存
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
            var pwd = document.getElementById("pwd").value;
            var repwd = document.getElementById("repwd").value;
            if (pwd !=repwd){
                alert("两次密码不一致");
                return false;
            }
            $('#editForm').submit();


        });




    });


</script>
</body>
</html>