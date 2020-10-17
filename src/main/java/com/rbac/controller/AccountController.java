package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Department;
import com.rbac.pojo.EmpInfo;
import com.rbac.pojo.Employee;
import com.rbac.query.QueryObject;
import com.rbac.service.IDepartmentService;
import com.rbac.service.IEmpInfoService;
import com.rbac.service.IEmpRoleService;
import com.rbac.service.IEmployeeService;
import com.rbac.utils.CodecUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IEmpInfoService empInfoService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IEmpRoleService empRoleService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/list")
    public String list(Model model,@ModelAttribute("qo") QueryObject qo){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(7)){
            return "common/nopermission";
        }
        PageInfo<Employee> employees = employeeService.queryAll(qo);
        List<Department> departments = departmentService.queryAll();
        // 将数据封装到Model中，Model对象可以共享到JSP页面
        model.addAttribute("page", employees);
        model.addAttribute("depts", departments);
        return "account/list";
    }

    @RequestMapping("/toInput")
    public String toInput(Model model){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(7)){
            return "common/nopermission";
        }
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("depts", departments);
        return "account/input";
    }

    @Transactional
    @RequestMapping("input")
    public String input(Employee employee){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(7)){
            return "common/nopermission";
        }
        // 生成盐
        String salt = CodecUtils.generateSalt();
        employee.setSalt(salt);
        // 对密码加密,默认密码等于手机号
        employee.setPassword(CodecUtils.md5Hex(employee.getPhone(), salt));
        employee.setIslock(0);
        employeeService.insert(employee);//添加到employee表
        //同时添加到emp_info表
        EmpInfo empInfo = new EmpInfo();
        empInfo.setId(employee.getId().intValue());
        empInfo.setWorkid(employee.getId().toString());
        empInfo.setName(employee.getName());
        empInfo.setPhone(employee.getPhone());
        empInfo.setDepartmentid(employee.getDeptId());
        empInfoService.insert(empInfo);
        return "redirect:/account/list.do";
    }

    @RequestMapping("updateLock")
    public String updateLock(@RequestParam("islock")Integer islock,@RequestParam("id")Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(7)){
            return "common/nopermission";
        }
        if (islock==0){
            employeeService.updateLock(1,id);
        }else {
            employeeService.updateLock(0,id);
        }
        return "redirect:/account/list.do";
    }

    @Transactional
    @RequestMapping("/delete")
    public String delete(Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(7)){
            return "common/nopermission";
        }
        employeeService.delete(id);
        empRoleService.deleteByEmpId(id);
        empInfoService.deleteByWordID(id.toString());
        return "redirect:/account/list.do";
    }

}
