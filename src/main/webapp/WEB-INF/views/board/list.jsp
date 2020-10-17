<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp"%>
    <style>
        .modal-header{
            font-size:2em;
            text-align:center;
            font-family:Verdana,Arial,sans-serif;
            text-shadow:1.5px 1.5px 1px #8c8c8c;
        }
        .modal-body {
            color: #6C6C6C;
        }

    </style>
</head>

<script>
    function del() {
        if(confirm("确定删除？")){
            alert("删除成功");
        }else{
            window.event.returnValue = false;
        }
    }
</script>

<body>

<div id="wrapper">
    <%@include file="../common/top.jsp" %>
    <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
    <c:set var="menu" value="board"/>
    <%@include file="../common/menu.jsp" %>
    <main>
        <h1 class="page-head-line">公告栏</h1>
        <div class="floatright">
            <c:if test="${flag==true}"><%--是否具有权限--%>
                <button type="button" class="btn btn-success glyphicon glyphicon-bullhorn" data-toggle="modal"
                        data-target="#publishModal"> 发布广告</button>

                <button type="button" class="btn btn-default glyphicon glyphicon-trash" data-toggle="modal"
                        data-target="#recycleModal"> 回收站</button>
            </c:if>
        </div>

        <table class="table table-striped table-hover" style="margin-top: 12px">
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>公告内容</th>
                <th>发布者</th>
                <th>发布时间</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="publish" items="${page.list}" varStatus="vs">
                <tr>
                    <td>${publish.id}</td>
                    <td>${fn:substring(publish.title,0,15)}</td>
                    <td>${fn:substring(publish.context,0,15)}</td>
                    <td>${publish.publisher}</td>
                    <td><fmt:formatDate value='${publish.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
                    <td><fmt:formatDate value='${publish.updateTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
                    <td>
                        <a class="btn btn-info btn-xs" href="/board/detail.do?id=${publish.id}">
                            <span class="glyphicon glyphicon-pencil"></span> 详情
                        </a>
                        <c:if test="${flag==true}">
                            <a class="btn btn-success btn-xs" href="/board/toUpdate.do?id=${publish.id}">
                                <span class="glyphicon glyphicon-pencil"></span> 修改
                            </a>
                            <a href="/board/deleteToRecycle.do?id=${publish.id}" class="btn btn-danger btn-xs" onclick="del()">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form class="form-inline" id="searchForm" action="#" method="post">
            <input type="hidden" name="currentPage" id="currentPage" value="1">
        </form>
        <%@ include file="../common/page.jsp" %>



        <div class="modal fade" tabindex="-1" role="dialog" id="publishModal" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="form-inline row">
                            <span>发布公告</span>
                            <button type="button" class="close" data-dismiss="modal"aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <form action="/board/publish.do" method="post">
                            <div class="form-group">
                                <label for="title" class="form-inline">标题:
                                    <input type="text" class="form-control" name="title" id="title"></label>
                            </div>
                            <div class="form-group">
                                <label for="content">内容：</label>
                                <textarea rows="3" cols="20" class="form-control" name="context" id="content"></textarea>
                            </div>

                            <div class="modal-footer">
                                <input type="submit" value="发布" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="recycleModal" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <span>回收站</span>
                        <button class="close" data-dismiss="modal" aria-label="close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-hover" style="margin-top: 12px">
                            <tr>
                                <th>编号</th>
                                <th>标题</th>
                                <th>公告内容</th>
                                <th>发布者</th>
                                <th>发布时间</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="recycle" items="${recycleList}" varStatus="vs">
                                <tr>
                                    <td>${recycle.id}</td>
                                    <td>${fn:substring(recycle.title,0,15)}</td>
                                    <td>${fn:substring(recycle.context,0,15)}</td>
                                    <td>${recycle.publisher}</td>
                                    <td>${recycle.createTime}</td>
                                    <td>${recycle.updateTime}</td>
                                    <td>
                                        <a class="btn btn-info btn-xs" href="/board/detail.do?id=${recycle.id}">
                                            <span class="glyphicon glyphicon-pencil"></span> 详情
                                        </a>
                                        <a href="/board/delete.do?id=${recycle.id}" class="btn btn-danger btn-xs" onclick="del()">
                                            <span class="glyphicon glyphicon-trash"></span> 永久删除
                                        </a>
                                        <a href="/board/recycleToPublish.do?id=${recycle.id}" class="btn btn-success btn-xs">
                                            <span class="glyphicon glyphicon-refresh"></span> 恢复
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </main>
    <%@include file="../common/footer.jsp" %>

</div>
</body>
</html>
