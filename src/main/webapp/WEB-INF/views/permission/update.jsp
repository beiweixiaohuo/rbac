<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/header.jsp" %>
    <link rel="stylesheet" href="../../../css/style.css" type="text/css" />
    <script type="text/javascript" src="../../../js/Transfer.js"></script>
</head>
<script>
    function add(){
        var addRolePermission = document.getElementById("addRolePermission");
        var arr = document.getElementsByName("checkbox1");
        var flag = false ;//标记判断是否选中一个
        for(var i=0;i<arr.length;i++){
            if(arr[i].checked){
                flag = true ;
                break ;
            }
        }
        if(!flag){
            return false ;
        }
        addRolePermission.submit();
    }
    function del() {
        var delRolePermission = document.getElementById("delRolePermission");
        var arr = document.getElementsByName("checkbox2");
        var flag = false ;//标记判断是否选中一个
        for(var i=0;i<arr.length;i++){
            if(arr[i].checked){
                flag = true ;
                break ;
            }
        }
        if(!flag){
            return false ;
        }
        delRolePermission.submit();
    }
</script>
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
                    <h1 class="page-head-line">权限修改</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/permission/save.do" method="post" id="editForm">
                </form>
                <div class="ty-transfer mt20 ml20" id="ued-transfer-1">
                    <div class="fl ty-transfer-list transfer-list-left">
                        <div class="ty-transfer-list-head">
                            可添加权限列表
                        </div>
                        <div class="ty-transfer-list-body">
                            <ul class="ty-tree-select">
                                <form action="/permission/addRolePermission.do" method="post" id="addRolePermission">
                                <input type="hidden" value="${param.id}" name="roleId">
                                    <c:forEach var="enableSelect" items="${enableSelects}">
                                    <li>
                                        <div>
                                            <label class="tyue-checkbox-wrapper">
                                            <span class="tyue-checkbox">
                                                <input type="checkbox" class="tyue-checkbox-input" name="checkbox1"
                                                       value="${enableSelect.id}">
                                                <span class="tyue-checkbox-circle"></span>
                                            </span>
                                            <span class="tyue-checkbox-txt" >
                                                    ${enableSelect.name}
                                            </span>
                                            </label>
                                        </div>
                                    </li>
                                </c:forEach>
                                </form>
                            </ul>
                        </div>

                    </div>
                    <div class="fl ty-transfer-operation">
                    <span class="ty-transfer-btn-toright to-switch" onclick="add()">
                    </span>
                    <span class="ty-transfer-btn-toleft to-switch" onclick="del()">
                    </span>
                    </div>
                    <div class="fl ty-transfer-list transfer-list-right">
                        <div class="ty-transfer-list-head">
                            已拥有权限列表
                        </div>
                        <div class="ty-transfer-list-body">
                            <ul class="ty-tree-select">
                                <form action="/permission/delRolePermission.do" method="post" id="delRolePermission">
                                    <input type="hidden" value="${param.id}" name="roleId">
                                <c:forEach var="hasSelect" items="${hasSelects}">
                                <li>
                                    <div>
                                        <label class="tyue-checkbox-wrapper">
                                            <span class="tyue-checkbox">
                                                <input type="checkbox" class="tyue-checkbox-input"
                                                       value="${hasSelect.permissionId}" name="checkbox2">
                                                <span class="tyue-checkbox-circle"></span>
                                            </span>
                                            <span class="tyue-checkbox-txt">
                                                ${hasSelect.permissionName}
                                            </span>
                                        </label>
                                    </div>
                                </li>
                                </c:forEach>
                                </form>
                            </ul>
                        </div>
                    </div>
                            
                </div>
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
        $("#ued-transfer-1").transferItem();
    });


</script>
</body>
</html>