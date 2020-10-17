package com.rbac.Interceptor;

import com.rbac.pojo.Employee;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String uri = request.getRequestURI();

        if (uri.indexOf("/checkLogin.do") >= 0 || uri.indexOf("/login.do") >= 0 ||
                uri.indexOf("/forgetPassword.do") >= 0 ||uri.indexOf("/sendCode.do") >= 0
                ||uri.indexOf("/checkCode.do") >= 0||uri.indexOf("/toUpdatePassword.do") >= 0){
            return true;
        }
        Employee e = (Employee) request.getSession().getAttribute("user");
        if (e != null){
            return true;
        }
        response.sendRedirect("/login.do");
        return false;
    }
}
