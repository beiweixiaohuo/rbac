<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp"%>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp"%>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="role"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色管理</h1>
                </div>
            </div>

            <a href="/role/list.do" class="btn btn-success">
                <span class="glyphicon glyphicon-plus"></span> 角色列表
            </a>
            <a href="/role/input.do" class="btn btn-success">
                <span class="glyphicon glyphicon-plus"></span> 添加角色
            </a>


            <table class="table table-striped table-hover" style="margin-top: 12px">
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="emp" items="${employees}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.age}</td>
                        <td>${emp.department.name}</td>
                        <td>
                            <a class="btn btn-info btn-xs" href="/role/update.do?id=${emp.id}">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
                           <%-- <a class="btn btn-danger btn-xs" href="/role/delete.do?id=${role.id}">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>--%>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <%@ include file="../common/page.jsp"%>
        </div>
    </div>
</div>
</body>
</html>