<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="css/login/reset.css">
    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="css/login/style.css">
</head>
<script src="js/jquery/jquery.min.js" type="text/javascript"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script type="text/javascript">
    $(function() {
        $("#submit").on('click', function () {
            var getPassword = document.getElementById("password").value;
            var getRepassword = document.getElementById("repassword").value;
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
<div class="page-container">
    <h1>Update Password</h1>

    <form action="/toUpdatePassword.do" method="post">
        <input type="hidden" value="${email}" name="email">
        请输入新的密码：<input type="password" name="password" id="password"><br>
        请确认密码：<input type="password" name="repassword" id="repassword"><br>
        <input type="submit" id="submit" value="确定"><br>
    </form>
    <br>
    <span>
        ${msg}
    </span>
</div>


</body>
</html>
