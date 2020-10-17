<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
    <style>
        .bt{
            float: right;
        }
    </style>
</head>
<script type="text/javascript">
    $(function() {
        $("#submit").on('click', function () {
            var getPassword = document.getElementById("password").value;
            var getRepassword = document.getElementById("repassword").value;
            if (getPassword.length ==0 ||getRepassword.length==0){
                alert("密码不能为空！");
                return false;
            }
            if (getPassword != getRepassword) {
                alert("两次密码不一致！");
                return false;
            }
            alert("修改成功！");
            return true;
        })
    });
</script>
<body>
<div id="wrapper">

    <%@include file="../common/top.jsp" %>

            <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
            <c:set var="menu" value="personal"/>
            <%@include file="../common/menu.jsp" %>
       <main>
                    <h1 class="page-head-line">修改密码</h1>

                <div class="col-sm-5 col-sm-offset-3">
                    <form action="/personal/toUpdatePassword.do" method="post" style="margin-top: 10px">
                        <div class="form-group">
                            <label for="password">请输入新的密码：</label>
                            <input type="password" name="password" id="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="repassword">请确认密码：</label>
                            <input type="password" name="repassword" id="repassword" class="form-control">
                        </div>
                        <div class="bt">
                            <input type="submit" id="submit" value="确定" class="btn btn-primary">
                            <input type="button" class="btn btn-default" onclick="history.back(-1)" value="返回">
                        </div>

                    </form>
                </div>
        </main>
            <%@include file="../common/footer.jsp" %>
        </div>
    </div>
</div>
</div>
</body>
</html>
