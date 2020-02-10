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

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp"%>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="permission"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">权限管理</h1>
                </div>
            </div>


            <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target=".bs-example-modal-lg">权限列表</button>

            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
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

            <table class="table table-striped table-hover" style="margin-top: 12px">
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="role" items="${roles}" varStatus="vs">
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


        </div>
    </div>
</div>
</body>
</html>