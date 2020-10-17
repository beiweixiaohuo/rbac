<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>

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
    <%@include file="../common/top.jsp" %>
    <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
    <c:set var="menu" value="department"/>
    <%@include file="../common/menu.jsp" %>
    <main>
        <h1 class="page-head-line">部门管理</h1>
        <div class="floatright">
            <c:forEach var="myPermission" items="${myPermissions}">
                <c:if test="${myPermission == 2}">
                    <c:set var="flag" value="true"></c:set>
                </c:if>
            </c:forEach>
            <c:if test="${flag=='true'}">
                <button type="button" class="btn btn-success bt" data-toggle="modal" data-target="#addModal">添加</button>
            </c:if>
        </div>


        <table class="table table-striped table-hover" style="margin-top: 12px">
            <tr>
                <th>编号</th>
                <th>部门名称</th>
                <th>部门编号</th>
                <c:if test="${flag=='true'}">
                    <th>操作</th>
                </c:if>
            </tr>
            <c:forEach var="data" items="${page.list}" varStatus="vs">
                <tr>
                    <td>${data.id}</td>
                    <td>${data.name}</td>
                    <td>${data.sn}</td>
                    <c:if test="${flag=='true'}">
                        <td>
                            <a class="btn btn-info btn-xs" href="/department/input.do?id=${data.id}" data-toggle="modal"
                               data-target="#updateModal">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
                            <a href="/department/delete.do?id=${data.id}" class="btn btn-danger btn-xs" onclick="del()">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        <form class="form-inline" id="searchForm" action="#" method="post">
            <input type="hidden" name="currentPage" id="currentPage" value="1">
        </form>
        <%@ include file="../common/page.jsp" %>


        <%--添加按钮模态框--%>
        <div class="modal fade" tabindex="-1" role="dialog" id="addModal" aria-labelledby="addLargeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <%@include file="input.jsp"%>
                </div>
            </div>
        </div>
        <%--编辑按钮模态框--%>
        <div class="modal fade" tabindex="-1" id="updateModal" role="dialog" aria-labelledby="updateLargeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <%@include file="input.jsp"%>
                </div>
            </div>
        </div>
    </main>
    <%@include file="../common/footer.jsp" %>

</div>
</body>
</html>
