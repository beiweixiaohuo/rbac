<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
     .lg2 {
        position: absolute;
        top: 26px;
        left: 150px;
    }
</style>
<div class="navbar navbar-default" style="background-color: #e5e5e5">

    <div class="navbar-header">
        <a class="navbar-brand" href="#">员工管理系统</a>
    </div>

    <span class="pageTitle">&nbsp;</span>
    <ul class="nav navbar-nav navbar-right cm-navbar-nav ">
        <li>
           <p class="navbar-text text-info">
               <span class="glyphicon glyphicon-user"></span>
               ${user.name}
           </p>
        </li>
        <li><a href="/logout.do">安全退出</a></li>
    </ul>
</div>