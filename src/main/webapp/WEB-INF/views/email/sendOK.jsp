<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
    <style>
        .button-group a{
            margin-left: 12px;
            margin-top: 15px;

        }
    </style>
</head>

<body>

<div id="wrapper">
    <%@include file="../common/top.jsp" %>
            <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
            <c:set var="menu" value="email"/>
            <%@include file="../common/menu.jsp" %>
    <main>
        <h1 class="page-head-line">发送成功</h1>
        <div class="button-group">
            <a class="btn btn-success" href="/email/list.do" role="button" >继续发送</a>

            <a class="btn btn-info " href="/email/readEmail.do" role="button" data-toggle="modal"
               data-target="#addModal">查看邮件</a>

        </div>
    </main>
            <%--添加按钮模态框--%>
            <div class="modal fade" tabindex="-1" role="dialog" id="addModal" aria-labelledby="addLargeModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <%@include file="readEmail.jsp"%>
                    </div>
                </div>
            </div>
    <%@include file="../common/footer.jsp" %>
</div>
</body>
</html>
