package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Department;
import com.rbac.pojo.EmpInfo;
import com.rbac.pojo.Employee;
import com.rbac.pojo.Position;
import com.rbac.query.QueryEmpObject;
import com.rbac.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IPositionService positionService;
    @Autowired
    private IEmpInfoService empInfoService;

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;

    @RequestMapping("/list")
    public String list(Model model, @ModelAttribute("qo") QueryEmpObject qo){
        PageInfo<Employee> pageInfo = employeeService.queryList(qo);
        model.addAttribute("page", pageInfo);
        List<Department> departments = departmentService.queryAll();
        // 将数据封装到Model中，Model对象可以共享到JSP页面
        model.addAttribute("depts", departments);
        // 跳转到JSP，在JSP中展示数据
        return "employee/list";
    }

    /**
     * 到修改页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/update")
    public String update(Model model, Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(1)){
            return "common/nopermission";
        }
        // 判断id是否为空，如果不为空，则根据id查询数据
        if (id != null) {// id.null : 判空快捷键
            EmpInfo empInfo = empInfoService.selectByWorkId(String.valueOf(id));
            model.addAttribute("empInfo",empInfo);
        }
        // 查询所有部门信息
        List<Department> departments = departmentService.queryAll();
        //查询所有职位信息
        List<Position> positions = positionService.queryAll();

        model.addAttribute("depts",departments);
        model.addAttribute("positions",positions);
        return "employee/update";
    }

    /**
     * 执行修改
     * @param empInfo
     * @return
     */
    @Transactional
    @RequestMapping("/toUpdate")
    public String toUpdate(EmpInfo empInfo){
        empInfo.setId(Integer.valueOf(empInfo.getWorkid()));
        empInfoService.updateByPrimaryKey(empInfo);

        //同步employee表
        Employee employee = employeeService.queryById(empInfo.getId().longValue());
        employee.setName(empInfo.getName());
        employee.setDeptId(empInfo.getDepartmentid());
        employee.setPhone(empInfo.getPhone());
        employeeService.update(employee);

        Employee user = (Employee) session.getAttribute("user");
        //如果修改的时登录的用户,需要修改session信息
        if (empInfo.getWorkid().equals(user.getId().toString())){
            session.setAttribute("user",employeeService.queryById(user.getId()));

        }
        // 重定向到列表页面
        return "redirect:/employee/list.do";
    }


    @RequestMapping("/read")
    public String input(Model model, Long id){
        if (id != null) {// id.null : 判空快捷键
            EmpInfo empInfo = empInfoService.selectByWorkId(String.valueOf(id));
            model.addAttribute("empInfo",empInfo);
        }
        // 查询所有部门信息
        List<Department> departments = departmentService.queryAll();
        //查询所有职位信息
        List<Position> positions = positionService.queryAll();

        model.addAttribute("depts",departments);
        model.addAttribute("positions",positions);
        return "employee/read";
    }


}
