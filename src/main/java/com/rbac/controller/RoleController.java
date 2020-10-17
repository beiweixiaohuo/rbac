package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.EmpRole;
import com.rbac.pojo.Employee;
import com.rbac.pojo.Role;
import com.rbac.dto.EmpRoleDTO;
import com.rbac.query.QueryObject;
import com.rbac.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/role")
public class  RoleController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IEmpRoleDTOService empRoleDTOService;
    @Autowired
    private IEmpRoleService empRoleService;
    @Autowired
    private IRolePermissionService rolePermissionService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/page")
    public String page(Model model,@ModelAttribute("qo") QueryObject qo){
        List<Role> roles = roleService.selectAll();
        PageInfo<Employee> employees = employeeService.queryAll(qo);

        model.addAttribute("page",employees);
        model.addAttribute("roles",roles);
        return "role/page";
    }

    @RequestMapping("/input")
    public String input(Model model, Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(3)){
            return "common/nopermission";
        }
        if (id != null) {// id.null : 判空快捷键
            Role role = roleService.selectById(id);
            model.addAttribute("role",role);
        }
        return "role/input";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Role role){
        roleService.saveOrUpdate(role);
        return "redirect:/role/page.do";
    }

    @RequestMapping("/delete")
    public String delete(Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(3)){
            return "common/nopermission";
        }

        roleService.deleteById(id); //角色删除

        empRoleService.deleteByRoleId(id);//将员工-角色关系表中具有改角色的数据删除

        rolePermissionService.deleteByRoleId(id);//将角色-权限关系表中具有改角色的数据删除
        return "redirect:/role/page.do";
    }

    @RequestMapping("/update")
    public String update(Long id,Model model){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(3)){
            return "common/nopermission";
        }
        //取出用户未拥有的角色
        List<Role> enableSelects = empRoleDTOService.enableSelect(id);
        //取出用户已拥有的角色
        List<EmpRoleDTO> hasSelects = empRoleDTOService.hasSelect(id);

        model.addAttribute("hasSelects",hasSelects);
        model.addAttribute("enableSelects",enableSelects);
        return "role/update";
    }

    @RequestMapping("/addEmpRole")//给员工添加角色
    public String addEmpRole(Long empId, Long[] checkbox1){
        //Long[] checkbox是表单提交过来要添加的角色,通过for循环逐一添加
        for (int i = 0;i < checkbox1.length;i++) {
            EmpRole empRole = new EmpRole();
            empRole.setEmpId(empId);
            empRole.setRoleId(checkbox1[i]);
            empRoleService.insert(empRole);
        }
        return "redirect:update.do?id="+empId;
    }

    @RequestMapping("delEmpRole")//给员工删除角色
    public String delEmpRole(Long empId, Long[] checkbox2){
        //Long[] checkbox是表单提交过来要删除的角色,通过for循环逐一删除
        for (int i = 0;i < checkbox2.length;i++) {
            EmpRole empRole = new EmpRole();
            empRole.setEmpId(empId);
            empRole.setRoleId(checkbox2[i]);
            empRoleService.delete(empRole);
        }
        return "redirect:update.do?id="+empId;
    }
}
