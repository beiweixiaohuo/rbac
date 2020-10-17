<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>

<div id="wrapper">

    <%@include file="../common/top.jsp" %>
    <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
    <c:set var="menu" value="personal"/>
    <%@include file="../common/menu.jsp" %>
    <main>
        <h1 class="page-head-line" style="margin: 0;">个人中心</h1>
        <div class="bgWhite" style="background-color: #F4F8FA;margin:15px auto;padding:15px 15px 40px 15px">
            <%@ include file="update.jsp" %>
        </div>
    </main>
    <%@include file="../common/footer.jsp" %>


</div>
</body>
</html>
