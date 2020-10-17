package com.rbac.controller;


import com.rbac.dto.MailModel;
import com.rbac.pojo.Employee;
import com.rbac.service.*;
import com.rbac.utils.CodecUtils;
import com.rbac.utils.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.concurrent.TimeUnit;

@Controller
public class LoginController {
    @Autowired
    private ILoginService loginService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IEmpRoleService empRoleService;
    @Autowired
    private IMailService mailService;
    @Autowired
    private IEmpInfoService empInfoService;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private HttpServletRequest request;

    static final String CODE_PREFIX = "user:code:email:";
    static final String ID_PREFIX = "user:id:email:";

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/checkLogin")
    public String checkLogin(Long id, String password){
        Employee employee = employeeService.queryById(id);
        if (employee.getIslock()==1){
            request.setAttribute("msg","账号已被锁定,请联系相关负责人!");
            return "login";
        }
        //账号密码正确
        if (loginService.checkLogin(id, password)){
            //将用户信息存到session的user里
            request.getSession().setAttribute("user",employee);
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

    @RequestMapping("/forgetPassword")
    public String forgetPassword(){

        return "forgetPassword";
    }

    /**
     * 发送验证码
     * @param email
     * @return
     */
    @RequestMapping("sendCode")
    public String sendCode(Model model,@RequestParam("email") String email){
        //要先校验邮箱是否存在
        Integer i = empInfoService.selectWorkIDByEmail(email);
        if (i == null){
            i = 1/0;
        }
        this.redisTemplate.opsForValue().set(ID_PREFIX + email, i.toString(), 5, TimeUnit.MINUTES);
        // 生成验证码
        String code = NumberUtils.generateCode(6);
        this.redisTemplate.opsForValue().set(CODE_PREFIX + email, code, 5, TimeUnit.MINUTES);

        MailModel mailModel = new MailModel();
        mailModel.setAttachFileNames(null);
        mailModel.setFromAddress("2801685997@qq.com");
        mailModel.setToAddresses(email);
        mailModel.setContent("您的验证码是："+code+",验证码5分钟内有效，请尽快进行操作！");
        mailModel.setSubject("员工管理系统修改密码");
        mailService.sendAttachMail(mailModel);
        return "redirect:/forgetPassword.do";
    }

    /**
     * 校验验证码
     * @param model
     * @param email
     * @param code
     * @return
     */
    @RequestMapping("checkCode")
    public String checkCode(Model model, @RequestParam("email") String email, @RequestParam("code")String code){
        String cacheCode = (String)this.redisTemplate.opsForValue().get(CODE_PREFIX + email);
        if (!StringUtils.equals(code, cacheCode)) {
            model.addAttribute("msg","验证码错误");
            return "forgetPassword";
        }
        model.addAttribute("email",email);
        return "updatePassword";//校验通过转到updatePassword页面
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping(value = "toUpdatePassword",method = RequestMethod.POST)
    public String toUpdatePassword(@RequestParam("email")String email,@RequestParam("password")String password){
        String salt = CodecUtils.generateSalt();
        String newpassword = CodecUtils.md5Hex(password, salt);
        Long id = Long.parseLong((String)this.redisTemplate.opsForValue().get(ID_PREFIX + email)) ;
        employeeService.updatePassword(newpassword,salt,id);
        return "login";
    }
}
