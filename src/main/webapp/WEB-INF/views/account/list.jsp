<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>
<script>
    function del() {
        if(confirm("确定删除？")){
            alert("删除成功");
        }else{
            window.event.returnValue = false;
        }
    }
</script>
<div id="wrapper">
    <%@include file="../common/top.jsp" %>
    <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
    <c:set var="menu" value="account"/>
    <%@include file="../common/menu.jsp" %>
    <main>
        <h1 class="page-head-line">账号管理</h1>

            <c:forEach var="myPermission" items="${myPermissions}">
                <c:if test="${myPermission == 7}">
                    <c:set var="flag" value="true"></c:set>
                </c:if>
            </c:forEach>
            <c:if test="${flag==true}">
                <a type="button" href="/account/toInput.do" class="btn btn-success floatright" data-toggle="modal"
                   data-target="#addModal">添加</a>
            </c:if>

            <table class="table table-striped table-hover" style="margin-top: 12px">
                <tr>
                    <th>工号</th>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>部门</th>
                    <th>锁定</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="emp" items="${page.list}" varStatus="vs">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.department.name}</td>
                        <c:if test="${emp.islock == 0}">
                            <td>否</td>
                        </c:if>
                        <c:if test="${emp.islock == 1}">
                            <td>是</td>
                        </c:if>
                        <td>
                        <c:if test="${flag == true}">
                            <c:if test="${emp.islock==0}">
                                <a href="/account/updateLock.do?id=${emp.id}&islock=${emp.islock}" class="btn btn-warning btn-xs">
                                    <span class="glyphicon glyphicon-lock"></span>锁定
                                </a>
                            </c:if>
                            <c:if test="${emp.islock==1}">
                                <a href="/account/updateLock.do?id=${emp.id}&islock=${emp.islock}" class="btn btn-success btn-xs">
                                    <span class="glyphicon glyphicon-lock"></span>解锁
                                </a>
                            </c:if>
                            <a class="btn btn-danger btn-xs" href="/account/delete.do?id=${emp.id}" onclick="del()">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>
                        </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <form class="form-inline" id="searchForm" action="#" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
            </form>
            <%@ include file="../common/page.jsp" %>



    <%--添加按钮模态框--%>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" id="addModal" aria-labelledby="addLargeModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">

            </div>
        </div>
    </div>
    </main>
    <%@include file="../common/footer.jsp" %>
</div>
</body>
</html>
