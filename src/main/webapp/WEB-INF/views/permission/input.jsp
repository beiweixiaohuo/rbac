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
            <c:set var="menu" value="permission"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <c:if test="${param.id == null}">
                        <h1 class="page-head-line">权限新增</h1>
                    </c:if>
                    <c:if test="${param.id != null}">
                        <h1 class="page-head-line">权限修改</h1>
                    </c:if>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/permission/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" name="id" value="${permission.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">权限名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="${permission.name}"
                                   placeholder="请输入权限名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="description" value="${permission.description}"
                                   placeholder="请输入备注(可为空)">
                        </div>
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
            $('#editForm').submit();


        });




    });


</script>
</body>
</html>