<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
    <link rel="stylesheet" href="/js/bootstrap/css/fileinput.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/bootstrap/js/fileinput.js"></script>
    <script type="text/javascript" src="/js/bootstrap/js/zh.js"></script>
    <style>

        .list{
            /*float:right;*/
            /*margin-bottom: 100px;*/
            border: 1px solid lightgrey;
            /*position: absolute;*/
            /*top:100px;*/
            /*left: 645px;*/
            border-radius:13px ;
            padding: 0 auto;
        }
        /* li{*/
        /*    padding:5px 15px;*/
        /*}*/
        /*.main{*/
        /*    padding-left: 4px;*/
        /*}*/
        .selectOne{
            width: 80%;
            border: none;
            margin:10px 15px;
        }
        .selectOne:hover{
            color: #1f63ff;
            background-color:white ;
        }
        #receiver{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }


    </style>
</head>
<script type="text/javascript">
    $(function(){
        var state = true;
        var cb = $("input[type=checkbox]");
        var addressList =[];
        $('.select').click(function(){

            for(var i = 0; i < cb.length; i++) {
                cb[i].checked = state;
            }
            state = !state;
        });

        $(".selectOne").bind('click',function(){
            var mailTo=$(this).attr("ass");//收件人姓名
            var mailAddress=$(this).attr("alt");//收件人邮箱地址

            addressList.push(mailAddress);

            var result = addressList.join(';');//拼接成字符串
            $("#receiver").val(result);
        });
        $("#receiver").bind('keyup',function (){

                var temp = $("#receiver").val();
                addressList = temp.split(";");
                if (addressList[0] == "")
                    addressList=[];

            }
        );
    });

</script>
<body>

<div id="wrapper">
    <%@include file="../common/top.jsp" %>
    <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
    <c:set var="menu" value="email"/>
    <%@include file="../common/menu.jsp" %>
    <main style="padding-left: 45px">
            <h1 class="page-head-line">新邮件</h1>

        <div class="row" style="margin-top: 15px;">
            <div class="col-sm-9" >
                <form class="form-horizontal" action="/email/sendMail.do" method="post" id="editForm">
                    <div class="form-group">
                        <input type="text"  class="form-control " id="receiver" name="name"
                               placeholder="收件人" required>
                        <input type="hidden" name="messName" id="messName"/>
                        <input type="hidden" name="messMail" id="messMail"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="theme" placeholder="发送的主题" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="10" name="content" placeholder="请输入邮件内容" required></textarea>
                    </div>

                    <div class="floatright">
                        <button id="btn_submit" type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-envelope"></span> 确定发送
                        </button>

                    </div>
                </form>
            </div>

            <div class="col-sm-3 ">
                <ul class="list list-unstyled " style=" overflow-y:auto;;height:330px">
                    <div class="ty-transfer-list-head">
                        <h4 style="text-align: center">请选择收件人：</h4>
                    </div>
                    <c:forEach var="data" items="${empInfos}" varStatus="vs">
                        <li >
                            <button type="button" class="selectOne btn btn-default btn-xs" id="selectedOne" alt="${data.email}" ass="${data.name}">${data.name}  </button>
                        </li>
                    </c:forEach>
                </ul>
            </div>


        </div>


    </main>

    <%@include file="../common/footer.jsp" %>
</div>



</body>
</html>
