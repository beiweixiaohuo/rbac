<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    nav{
        float:left;
        width:200px;
        /*font-weight: bold;*/
        letter-spacing: 0.2em;
        /*background-color: #B3C7E6;*/
        padding: 0;
        /*position: fixed;*/
    }
    #list-group-item{

        padding:0 0;
        border-radius:5px;
    }
    nav ul { list-style-type: none;
        margin: 0;
        padding: 0;
    }
    nav a { text-decoration: none;
        padding: 15px;
        display: block;


        /*background-color: #B3C7E6; */
        /*background-color: #B3C7E6;*/
        /*background-color: #3C3C3C;*/
        /*border-bottom: 1px solid #FFFFFF;*/
    }
    #menu>li>ul>li a:link{color:#000000}
    /*#menu>li>ul>li a:visited{color: #999999;*/
    /*}*/
    #menu>li>ul>li a:hover{ color: #f5e79e;
        background-color: #00005D;
        text-decoration: none;
    }

    #menu>li>ul>li.active {
        background-color: #869DC7;
    }
</style>

<nav>
    <ul id="menu" class="list-group">
        <li class="list-group-item">
            <a href="javascript:" list-toggle="collapse" list-target="#strategy_detail">
                <span>系统管理</span>
            </a>
        <ul class="in" id="strategy_detail">
            <li class="department"><a href="/department/list.do"><span class="glyphicon glyphicon-th-list"> 部门管理</span></a></li>
            <li class="position"><a href="/position/list.do"><span class="glyphicon glyphicon-pawn"> 职位管理</span> </a></li>
            <li class="role"><a href="/role/page.do"><span class="glyphicon glyphicon-sunglasses"> 角色管理</span> </a></li>

            <c:forEach var="myPermission" items="${myPermissions}">
                <c:if test="${myPermission == 5}">
                    <li class="permission"><a href="/permission/page.do"><span class="glyphicon glyphicon-lock"> 权限管理</span> </a></li>
                </c:if>
                <c:if test="${myPermission == 7}">
                    <li class="account"><a href="/account/list.do"><span class="glyphicon glyphicon-list-alt"> 账号管理</span> </a></li>
                </c:if>
            </c:forEach>

            <li class="employee"><a href="/employee/list.do"><span class="glyphicon glyphicon-user"> 员工信息</span></a></li>
            <li class="email"><a href="/email/list.do"><span class="glyphicon glyphicon-envelope"> 发送邮件</span> </a></li>
            <li class="board"><a href="/board/list.do"><span class="glyphicon glyphicon-bell"> 公告栏</span> </a></li>
            <li class="personal"><a href="/personal/list.do"><span class="glyphicon glyphicon-home"> 个人中心</span></a></li>



            </ul>
        </li>
    </ul>

</nav>

<script type="text/javascript">
    $(".in li.${menu}").addClass("active");//
</script>
