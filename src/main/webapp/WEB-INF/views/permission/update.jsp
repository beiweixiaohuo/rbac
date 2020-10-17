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

<div id="wrapper">

    <%@include file="../common/top.jsp" %>

    <c:set var="menu" value="permission"/>
    <%@include file="../common/menu.jsp" %>
    <main>
        <h1 style="font-size: 2em">权限修改</h1>
        <div style="width:80%;margin:10px auto">
            <form class="form-horizontal" action="/permission/save.do" method="post" id="editForm">
            </form>
            <div class="ty-transfer mt20 ml20" id="ued-transfer-1">
                <div class="fl ty-transfer-list transfer-list-left" style="background-color: #F4F8FA">
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
                    <span class="" onclick="add()" style="font-size: 1.5em;background-color:#bbb;color: #ffffff;"> ></span>
                    <span class="" onclick="del()" style="font-size: 1.5em;background-color:#bbb;color: #ffffff;"> < </span>
                </div>
<%--                <div class="fl ty-transfer-operation">--%>
<%--                    <span class="ty-transfer-btn-toright to-switch" onclick="add()">--%>
<%--                    </span>--%>
<%--                    <span class="ty-transfer-btn-toleft to-switch" onclick="del()">--%>
<%--                    </span>--%>
<%--                </div>--%>
                <div class="fl ty-transfer-list transfer-list-right" style="background-color: #F4F8FA">
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
        $("#ued-transfer-1").transferItem();
    });


</script>
</body>
</html>
