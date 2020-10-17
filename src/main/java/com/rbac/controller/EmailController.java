package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.dto.MailModel;
import com.rbac.pojo.Department;
import com.rbac.pojo.EmpInfo;
import com.rbac.pojo.Employee;
import com.rbac.query.QueryEmpObject;
import com.rbac.query.QueryObject;
import com.rbac.service.IDepartmentService;
import com.rbac.service.IEmpInfoService;
import com.rbac.service.IEmployeeService;
import com.rbac.service.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/email")
public class EmailController {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IEmpInfoService empInfoService;
    @Autowired
    private IMailService mailService;

    MailModel one = new MailModel();

    @RequestMapping("/list")// 告诉客户端，该方法的访问路径
    public String list(Model model){

        // 调用service层方法，完成业务操作
        List<EmpInfo> empInfos = empInfoService.queryAll();

        model.addAttribute("empInfos", empInfos);

        return "email/list";
    }

    @RequestMapping("/sendMail")
    public  String sendMail(String name,String theme,String content,String[] fileUpLoad){

        one.setToAddresses(name);
        one.setFromAddress("2801685997@qq.com");
        one.setContent(content);
        one.setAttachFileNames(fileUpLoad);
        one.setSubject(theme);
        mailService.sendAttachMail(one);

        return "email/sendOK";
    }


    @RequestMapping("/readEmail")
    public  String readEmail(Model model){
        model.addAttribute("name", one.getToAddresses());
        model.addAttribute("theme", one.getSubject());
        model.addAttribute("fileUpLoad", one.getAttachFileNames());
        model.addAttribute("content", one.getContent());
        return "email/readEmail";
    }
}
