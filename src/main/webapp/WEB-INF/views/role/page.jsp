<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp"%>
</head>
<script>
    $('#myModal').modal(options);
</script>
<script>
    function del() {
        if(confirm("确定删除？")){
            alert("删除成功");
        }else{
            window.event.returnValue = false;
        }
    }
</script>
<body>
<div id="wrapper">
    <%@include file="../common/top.jsp"%>
    <c:set var="menu" value="role"/>
    <%@include file="../common/menu.jsp"%>
<main>
    <h1 class="page-head-line">角色管理</h1>
    <div class="floatright">
        <a href="/role/input.do" class="btn btn-success">
            <span class="glyphicon glyphicon-plus"></span> 添加角色
        </a>
        <button type="button" class="btn btn-primary" data-toggle="modal"
                data-target=".bs-example-modal-lg">角色列表</button>
    </div>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span>角色列表</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                <table class="table table-striped table-hover" >
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="role" items="${roles}" varStatus="vs">
                        <tr>
                            <td>${role.id}</td>
                            <td>${role.name}</td>
                            <td>${role.description}</td>
                            <td>
                                <a class="btn btn-info btn-xs" href="/role/input.do?id=${role.id}">
                                    <span class="glyphicon glyphicon-pencil"></span> 编辑
                                </a>
                                <a class="btn btn-danger btn-xs" href="/role/delete.do?id=${role.id}" onclick="del()">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    </div>
    <table class="table table-striped table-hover" style=" margin-top: 12px">
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>电话</th>
            <th>部门</th>
            <th>操作</th>
        </tr>
        <c:forEach var="emp" items="${page.list}" varStatus="vs">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.name}</td>
                <td>${emp.phone}</td>
                <td>${emp.department.name}</td>
                <td>
                    <a class="btn btn-info btn-xs" href="/role/update.do?id=${emp.id}">
                        <span class="glyphicon glyphicon-pencil"></span> 编辑
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <form class="form-inline" id="searchForm" action="#" method="post">
        <input type="hidden" name="currentPage" id="currentPage" value="1">
    </form>
    <%@ include file="../common/page.jsp"%>
</main>
    <%@include file="../common/footer.jsp" %>
        </div>
    </div>
</div>
</body>
</html>
