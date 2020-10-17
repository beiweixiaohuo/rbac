<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
    <link rel="stylesheet" href="css/login/reset.css">
    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css/login/style.css">


    <script src="js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap/js/bootstrap.min.js"></script>
</head>

<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script>
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    var code = ""; //验证码
    var codeLength = 6;//验证码长度
    function sendCode(){
        curCount = count;
        $("#btnSendCode").attr("disabled",true);
        $("#btnSendCode").val(+curCount + "秒再获取");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
        var getEmail = document.getElementById("email").value;
        $.ajax({
            url:"/sendCode.do?email=" + getEmail,
            type:"GET",
            success:function(){
                $("#myModal").modal("show");
                $('#alertTip').val("验证码已成功发送到该邮箱："+getEmail+",请及时查收！" ); //往id为alertTip的input里传入值
            },
            error:function(){
                curCount = 0;
                alert("未找到该邮箱对应的账号，请重新输入！");
            }
        });
        function SetRemainTime() {
            if (curCount == 0) {
                window.clearInterval(InterValObj);//停止计时器
                $("#btnSendCode").removeAttr("disabled");//启用按钮
                $("#btnSendCode").val("重新发送验证码");
                code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
            }
            else {
                curCount--;
                $("#btnSendCode").val( + curCount + "秒再获取");
            }
        }
    }
</script>
<body>

<div class="page-container">
    <h1>Reset Password</h1>

    <form action="checkCode.do" method="post">
        <div class="form-group">
            <div class="row">
                <input type="email" name="email" id="email" class="" placeholder="请输入您的邮箱：" style="margin: 10px;">
                <input type="button" id="btnSendCode" class="btn btn-primary" value="发送验证码" onclick="sendCode()">
            </div>
        </div>
        <div>
            <input type="text" name="code" class="" placeholder="请输入验证码：">
        </div>
        <div>
            <input type="submit" value="确定" class="btn btn-success">
            <input type="button" class="btn btn-default" onclick="history.back(-1)" value="返回">
            <!--<a href="http://localhost:8080/login.do">返回</a>-->
        </div>

    </form>
    <!-- Button trigger modal -->


    <span>
        ${msg}
    </span>
</div>


<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header " style="height:50px;">
                <h4 style="color:#000000">验证码发送成功：</h4>
            </div>
            <div class="modal-body">
                <div>
                    <textarea id="alertTip" name="alertTip" class="form-control color:#000000" readonly>
                    </textarea>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
