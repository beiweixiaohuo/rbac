<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="css/login/reset.css">
    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="css/login/style.css">
</head>
<script src="js/jquery/jquery.min.js"></script>
<script src="js/jquery/jquery.cookie.js"></script>
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
<script>
    $(document).ready(function(){
        if($.cookie("password") != ''){
            $("#password").val($.cookie("password"));
        }
        if($.cookie("id") != ''){
            $("#id").val($.cookie("id"));
        }
    });

    function check(){
        //记住我功能使用
        //写入cookie
        if ($("#remember-me").prop("checked") == true) {
            var id = $("#id").val();
            var password = $("#password").val();
            $.cookie("id", id);
            $.cookie("password", password,{ expires: 7 }); // 存储一个带7天期限的 cookie 如果{ expires: 7 } 不写则cookie只相当回话效果
        } else {
            $.cookie("id", "");
            $.cookie("password", "");
        }
    }
</script>

<body>

    <div class="page-container">
        <h1>Login</h1>
        <form action="/checkLogin.do" method="post" id="loginForm" onsubmit="return check()">
            <div>
                <input type="text" name="id" class="username" id="id" placeholder="账号"  autocomplete="off" onblur="GetPwdAndChk()"/>
            </div>
            <div>
                <input type="password" name="password" id="password" class="password" placeholder="密码" />
            </div>
            <div class="remember clearfix">
                <label class="remember-me"></span>记住我</label>
                    <input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck"
                           style="width:30px; height:30px; margin:15px 10px;" checked>
            </div>
            <div>
                <label class="forgot-password">
                    <a href="/forgetPassword.do" >忘记密码？</a>
                </label>
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
