<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>公告</title>
    <%@include file="../common/header.jsp" %>
    <style>
        .tb{
            float:right;
    }
    </style>
</head>
<body>
<div id="wrapper">

    <%@include file="../common/top.jsp"%>
    <c:set var="menu" value="board"/>
    <%@include file="../common/menu.jsp"%>
    <main>
        <h1 class="page-head-line">公告详情</h1>

        <table boder="1" class="table table-striped table-bordered table-hover">
            <thead>
            <tr></tr>
            </thead>
            <tbody>
            <tr>
                <td>编号：</td>
                <td>${board.id}</td>
            </tr>
            <tr>
                <td>标题：</td>
                <td>${board.title}</td>
            </tr>
            <tr>
                <td>内容：</td>
                <td>
                        <textarea disabled rows="6" cols="60" class="form-control" name="context" id="content">${board.context}
                        </textarea>
                </td>
            </tr>
            <tr>
                <td>发布者：</td>
                <td>${board.publisher}</td>
            </tr>
            <tr>
                <td>发布时间：</td>
                <td>${board.createTime}</td>
            </tr>
            <tr>
                <td>修改时间：</td>
                <td>${board.updateTime}</td>
            </tr>
            </tbody>
        </table>
        <div class="floatright">
            <button class="btn btn-default" onclick="javascript :history.back(-1)">返回</button>
        </div>
    </main>
    <%@include file="../common/footer.jsp" %>
</div>
</body>
</html>
