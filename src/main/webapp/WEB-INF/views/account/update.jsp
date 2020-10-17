<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改账号</title>
    <%@include file="../common/header.jsp" %>
    <style>
        .footer{
            float:right;
        }
    </style>
</head>
<body>
<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp"%>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="account"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">修改账号</h1>
                </div>
            </div>
            <div class="row">
                <form action="/account/update.do" method="post">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr></tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>工号：</td>
                                <td>${employee.id}</td>
                            </tr>
                            <tr>
                                <td>姓名：</td>
                                <td><input type="text" class="form-control" name="name" value="${employee.name}"></td>
                            </tr>
                            <tr>
                                <td>电话：</td>
                                <td><input type="text" class="form-control"name="phone" value="${employee.phone}"></td>
                            </tr>
                            <tr>
                                <td>部门：</td>
                                <td><select class="form-control" name="deptId">
                                    <c:forEach var="dept" items="${depts}">
                                    <c:if test="${dept.id == employee.deptId}">
                                    <option selected value="${dept.id}">${dept.name}
                                        </c:if>
                                        <c:if test="${dept.id != employee.deptId}">
                                    <option value="${dept.id}">${dept.name}
                                        </c:if>
                                        </c:forEach>
                                </select>
                                </td>
                            </tr>
                        </tbody>
                        <input type="hidden" name="id" value="${employee.id}"><br>
                        <input type="hidden" name="password" value="${employee.password}">
                        <input type="hidden" name="salt" value="${employee.salt}">
                        <input type="hidden" name="islock" value="${employee.islock}">

                    </table>
                    <div class="footer">
                        <input type="submit" style="margin-right:15px" class="btn btn-success" value="修改">
                        <button class="btn btn-default" onclick="javascript :history.back(-1)">返回</button>
                    </div>

                </form>
            </div>
            <div class="tb">

            </div>
        </div>
    </div>
</div>

</body>
</html>
