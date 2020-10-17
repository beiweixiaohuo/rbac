<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>

<body>

<div style="padding:0 15px">
    <div class="modal-header">
        <c:if test="${pos==null||pos.id==null}">
            <span>职位添加</span>
        </c:if>
        <c:if test="${pos!=null&&pos.id!=null}">
            <span>职位编辑</span>
        </c:if>
        <button class="close" data-dismiss="modal" aria-label="close"><span aria-hidden="true">&times;</span></button>
    </div>
                <form class="form-horizontal" action="/position/saveOrUpdate.do" method="post" id="editForm">
                    <div class="modal-body">
                        <input type="hidden" value="${pos.id}" name="id">
                        <div class="form-group">
                            <label for="name">职位名称：</label>
                            <input type="text" class="form-control" id="name" name="name" value="${pos.name}"
                                   placeholder="请输入职位名称">
                        </div>
                        <div class="form-group">
                            <label>部门：</label>
                            <%-- <div class="col-sm-6">
                                 <input type="text" class="form-control" name="deptId" value="${pos.deptId}"
                                        placeholder="请输入部门编号">
                             </div>--%>
                            <select class="form-control" name="deptId">
                                <c:forEach var="dept" items="${departments}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="description">描述：</label>
                                <input type="text" class="form-control" id="description" name="description" value="${pos.description}"
                                       placeholder="请输入职位编号">
                            </div>
                        </div>


                    <div class="modal-footer">
                            <button id="btn_submit" type="submit" class="btn btn-success">
                                <span class="glyphicon glyphicon-saved"></span> 保存
                            </button>
                    </div>
                </form>
</div>
</body>
</html>
