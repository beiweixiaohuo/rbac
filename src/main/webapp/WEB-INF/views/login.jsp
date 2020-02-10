<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="css/login/reset.css">
    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="css/login/style.css">
</head>
<script src="js/jquery/jquery.min.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script>
   $(function() {
       $(".connect p").eq(0).animate({"left":"0%"}, 600);
       $(".connect p").eq(1).animate({"left":"0%"}, 400);

       function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
       function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
       $("#submit").on('click', function () {
           var id =  document.getElementById("id").value;
           var password =  document.getElementById("password").value;
           if (id.length == 0 || password.length == 0){
               alert("账号或密码不能为空！");
               return false;
           }
       });
   })
</script>


<body>

    <div class="page-container">
        <h1>Login</h1>
        <form action="/checkLogin.do" method="post" id="loginForm">
            <div>
                <input type="text" name="id" class="username" id="id" placeholder="账号" autocomplete="off"/>
            </div>
            <div>
                <input type="password" name="password" id="password" class="password" placeholder="密码" />
            </div>
            <button id="submit" type="submit" >登录</button>
        </form>
        <div class="connect">
            <p>If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
            <p style="margin-top:20px;">如果只是遇见，不能停留，不如不遇见。</p>
        </div>
    </div>
    <br><br><br><br>
    <span>
        ${msg}
    </span>
</body>
</html>
