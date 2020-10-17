<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    header{
        /*height: 50px;*/
        color: #FFFFFF;
        border-top-left-radius:5px;
        border-top-right-radius: 10px;
    }
    #navHeader{
        color:#FFFFFF;
        font-weight: bold;
        text-shadow:1px 1px 1px #00005D;
    }
    /*.navbar{*/
    /*    margin:0;*/
    /*}*/
    .logout{
        color: #FFFFFF;
        margin-right: 25px;
    }
    .logout a:hover{
        color: #FF0543;
    }
    .logout a:active{
        color:#FF0543;
    }
</style>

<header>
        <div class="navbar">
<%--            <div class="navbar-header">--%>
<%--                <a class="" id="navHeader" href="#">--%>
<%--                    <h1 style="font-size:x-large">员工管理系统--%>
<%--                    </h1>--%>
<%--                </a>--%>
<%--            </div>--%>

            <span class="pageTitle">&nbsp;</span>
            <ul class="nav navbar-nav navbar-right cm-navbar-nav ">
                <li>
                    <p class="navbar-text text-default">
                        <span class="glyphicon glyphicon-user"></span>
                        ${user.name}
                    </p>
                </li>
                <li class="logout"><a href="/logout.do"><span class="glyphicon glyphicon-log-out"> 安全退出</span></a></li>
            </ul>
        </div>


</header>
