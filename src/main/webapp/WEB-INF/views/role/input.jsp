<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>

<div id="wrapper" >
    <%@include file="../common/top.jsp" %>

    <c:set var="menu" value="role"/>
    <%@include file="../common/menu.jsp" %>
    <main >
        <c:if test="${param.id == null}">
            <h1 >角色新增</h1>
        </c:if>
        <c:if test="${param.id != null}">
            <h1>角色修改</h1>
        </c:if>
        <div style="width: 50%;margin: 35px auto">
            <form class="form-horizontal" action="/role/saveOrUpdate.do" method="post" id="editForm">
                <input type="hidden" name="id" value="${role.id}">
                <div class="form-group">
                    <label class="control-label">角色名：</label>
                    <input type="text" class="form-control" name="name" value="${role.name}"
                           placeholder="请输入角色名">
                </div>
                <div class="form-group">
                    <label class="control-label">备注：</label>
                    <input type="text" class="form-control" name="description" value="${role.description}"
                           placeholder="请输入备注(可为空)">
                </div>

                <div class="floatright">
                    <button id="btn_submit" type="button" class="btn btn-success">
                        <span class="glyphicon glyphicon-saved"></span> 保存
                    </button>
                </div>
            </form>
        </div>

    </main>
    <%@include file="../common/footer.jsp" %>


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