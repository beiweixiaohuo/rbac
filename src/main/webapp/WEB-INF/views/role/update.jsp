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
        var addEmpRole = document.getElementById("addEmpRole");
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
        addEmpRole.submit();
    }
    function del() {
        var delEmpRole = document.getElementById("delEmpRole");
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
        delEmpRole.submit();
    }
</script>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp" %>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="role"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色修改</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/role/save.do" method="post" id="editForm">
                </form>
                <div class="ty-transfer mt20 ml20" id="ued-transfer-1">
                    <div class="fl ty-transfer-list transfer-list-left">
                        <div class="ty-transfer-list-head">
                            可添加角色列表
                        </div>
                        <div class="ty-transfer-list-body">
                            <ul class="ty-tree-select">
                                <form action="/role/addEmpRole.do" method="post" id="addEmpRole">
                                <input type="hidden" value="${param.id}" name="empId">
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
                            已拥有角色列表
                        </div>
                        <div class="ty-transfer-list-body">
                            <ul class="ty-tree-select">
                                <form action="/role/delEmpRole.do" method="post" id="delEmpRole">
                                    <input type="hidden" value="${param.id}" name="empId">
                                <c:forEach var="hasSelect" items="${hasSelects}">
                                <li>
                                    <div>
                                        <label class="tyue-checkbox-wrapper">
                                            <span class="tyue-checkbox">
                                                <input type="checkbox" class="tyue-checkbox-input"
                                                       value="${hasSelect.roleId}" name="checkbox2">
                                                <span class="tyue-checkbox-circle"></span>
                                            </span>
                                            <span class="tyue-checkbox-txt">
                                                ${hasSelect.roleName}
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