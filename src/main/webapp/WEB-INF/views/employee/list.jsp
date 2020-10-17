<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp"%>
</head>
<body>

<div id="wrapper">
    <%@include file="../common/top.jsp"%>
    <c:set var="menu" value="employee"/>
    <%@include file="../common/menu.jsp"%>

    <main>
        <h1 class="page-head-line">员工管理</h1>

        <div class="floatright">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/employee/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label>关键字:</label>
                    <input type="text" class="form-control" name="keyword" value="${qo.keyword}"
                           placeholder="请输入姓名/邮箱">
                </div>
                <div class="form-group">
                    <label>部门:</label>
                    <select class="form-control" name="deptId">
                        <option value="-1">全部</option>
                        <c:forEach var="dept" items="${depts}">
                            <option value="${dept.id}">${dept.name}</option>
                        </c:forEach>
                    </select>
                    <script>
                        //回显查询的部门:设置部门ID是 qo.deptId 为选中状态
                        $('#searchForm select[name=deptId]').val(${qo.deptId});
                    </script>
                </div>
                <button id="btn_query" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 查询
                </button>

                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
                     data-backdrop="static" aria-labelledby="myLargeModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <%@include file="update.jsp"%>
                        </div>
                    </div>
                </div>
            </form>
        </div>



        <table class="table table-striped table-hover" style="margin-top: 12px">
            <tr>
                <th>编号</th>
                <th>姓名</th>
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
                        <c:forEach var="myPermission" items="${myPermissions}">
                            <c:if test="${myPermission == 1}">
                                <a class="btn btn-info btn-xs" href="/employee/update.do?id=${emp.id}"
                                   data-toggle="modal" data-target=".bs-example-modal-lg">
                                    <span class="glyphicon glyphicon-pencil"></span> 编辑
                                </a>
                            </c:if>
                        </c:forEach>
                        <a class="btn btn-success btn-xs" href="/employee/read.do?id=${emp.id}"
                           data-toggle="modal" data-target=".bs-example-modal-lg">
                            <span class="glyphicon glyphicon-search"></span> 查看
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <%@ include file="../common/page.jsp"%>
    </main>
    <%@include file="../common/footer.jsp" %>

</div>
</body>
</html>
