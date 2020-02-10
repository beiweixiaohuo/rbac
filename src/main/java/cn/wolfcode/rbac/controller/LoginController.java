package cn.wolfcode.rbac.controller;


import cn.wolfcode.rbac.service.IEmpRoleService;
import cn.wolfcode.rbac.service.IEmployeeService;
import cn.wolfcode.rbac.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;

@Controller
public class LoginController {
    @Autowired
    private ILoginService loginService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IEmpRoleService empRoleService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/checkLogin")
    public String checkLogin(Long id, String password, HttpServletRequest request){
        //账号密码正确
        if (loginService.checkLogin(id, password)){
            //将用户信息存到session的user里
            request.getSession().setAttribute("user",employeeService.queryById(id));
            //查询用户拥有的权限,存到session中.
            HashSet<Integer> myPermissions = empRoleService.queryHasPermission(id);
            request.getSession().setAttribute("myPermissions",myPermissions);
            return "redirect:employee/list.do";
        }
        //用户名或密码错误
        request.setAttribute("msg","用户名或密码错误,请重新输入!");
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("myPermissions");
        return "login";
    }

}
