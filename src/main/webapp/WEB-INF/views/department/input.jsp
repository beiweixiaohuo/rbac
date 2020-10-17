<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>
<div class="modal-header">
    <c:if test="${dept==null||dept.id==null}">
        <span class="page-head-line">部门添加</span>
    </c:if>
    <c:if test="${dept!=null&&dept.id!=null}">
        <span class="page-head-line">部门编辑</span>
    </c:if>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>

    <form  action="/department/saveOrUpdate.do" method="post" id="editForm">
        <div class="modal-body">
            <input type="hidden" name="id" value="${dept.id}">
            <div class="form-group">
                <label  for="name" class="form-inline">部门名称：</label>
                <input type="text" class="form-control" id="name" name="name" value="${dept.name}" placeholder="请输入部门的名称">
            </div>
            <div class="form-group">
                <label for="sn" class="form-inline">部门编号：</label>
                <input type="text" class="form-control" id="sn" name="sn" value="${dept.sn}" placeholder="请输入部门编号">
            </div>
        </div>
        <div class="modal-footer">
            <button id="btn_submit" type="submit" class="btn btn-success">
                <span class="glyphicon glyphicon-saved"></span> 保存
            </button>
        </div>
    </form>


</body>
</html>
