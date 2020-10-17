<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>

<body>
    <div class="modal-header">
        <span>查看邮件</span>
        <button class="close" data-dimiss="modal" aria-label="close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <div class="form-group">
        <label for="receiver">收件人：</label>
            <input readonly id="receiver" value="${name}" class="form-control">
        </div>
        <div class="form-group">
            <label for="mailTheme">邮件主题：</label>
            <input readonly id="mailTheme"  value="${theme}" class="form-control">
        </div>
        <div>
            <lable for="mailContent">邮件内容：</lable>
            <textarea readonly id="mailContent" rows="6" class="form-control">${content}</textarea>
        </div>


</div>
</body>
</html>
