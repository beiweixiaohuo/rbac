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
<body>

<div id="wrapper">
    <%@include file="../common/top.jsp"%>
    <c:set var="menu" value="permission"/>
    <%@include file="../common/menu.jsp"%>
    <main>
        <h1 class="page-head-line">权限管理</h1>

        <button type="button" class="btn btn-primary floatright" data-toggle="modal"
                data-target=".bs-example-modal-lg">权限列表</button>

        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <span>权限列表</span>
                        <button type="button" class="close" data-dismiss="modal" aria-label="close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-hover" >
                            <tr>
                                <th>编号</th>
                                <th>名称</th>
                                <th>备注</th>
                            </tr>
                            <c:forEach var="permission" items="${permissions}" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${permission.name}</td>
                                    <td>${permission.description}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>
        </div>

        <table class="table table-striped table-hover" style="margin-top: 12px">
            <tr>
                <th>编号</th>
                <th>名称</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            <c:forEach var="role" items="${page.list}" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${role.name}</td>
                    <td>${role.description}</td>
                    <td>
                        <a class="btn btn-info btn-xs" href="/permission/update.do?id=${role.id}">
                            <span class="glyphicon glyphicon-pencil"></span> 编辑
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form class="form-inline" id="searchForm" action="#" method="post">
            <input type="hidden" name="currentPage" id="currentPage" value="1">
        </form>
        <%@ include file="../common/page.jsp" %>
    </main>
    <%@include file="../common/footer.jsp" %>
</div>
</body>
</html>
