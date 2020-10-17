<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>公告</title>
    <%@include file="../common/header.jsp" %>
</head>
<body>
<div id="wrapper">
    <%@include file="../common/top.jsp"%>
    <c:set var="menu" value="board"/>
    <%@include file="../common/menu.jsp"%>
    <main>
        <h1 class="page-head-line">公告详情</h1>
        <div class="" style="width:80%;  margin:40px auto;">
            <form action="/board/update.do" method="post">
                <input type="hidden" value="${board.id}" name="id">
                <table class="table table-striped table-hover border=1">
                <tbody>
                <tr>
                    <td>编号：</td>
                    <td>${board.id}</td>
                </tr>
                <tr>
                    <td>标题：</td>
                    <td><input type="text" value="${board.title}" class="form-control" name="title"></td>
                </tr>
                <tr>
                    <td>内容：</td>
                    <td>
                            <textarea  rows="3" cols="20" class="form-control" name="context" id="content">${board.context}
                            </textarea></td>
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

                <input type="hidden" value="${user.name}" name="publisher">
                <input type="hidden" value="${board.createTime}" name="createTime">
                <input type="hidden" value="${board.isdelete}" name="isdelete">

                <div class="floatright">
                    <input type="submit" value="修改" class="btn btn-success">
                    <button class="btn btn-default" onclick="javascript :history.back(-1)">返回</button>
                </div>

            </form>

        </div>
    </main>
    <%@include file="../common/footer.jsp" %>


</div>
</body>
</html>
