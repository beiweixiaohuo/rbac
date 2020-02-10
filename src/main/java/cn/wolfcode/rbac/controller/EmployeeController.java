package cn.wolfcode.rbac.controller;

import cn.wolfcode.rbac.domain.Department;
import cn.wolfcode.rbac.domain.Employee;
import cn.wolfcode.rbac.service.IDepartmentService;
import cn.wolfcode.rbac.service.IEmpRoleService;
import cn.wolfcode.rbac.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

@Controller// 告诉Spring，帮我们创建EmployeeController对象并管理
@RequestMapping("/employee")// 告诉客户端，EmployeeController的访问路径
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IEmpRoleService empRoleService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/list")// 告诉客户端，该方法的访问路径
    public String list(Model model){
        // 调用service层方法，完成业务操作
        List<Employee> employees = employeeService.queryAll();
        List<Department> departments = departmentService.queryAll();
        // 将数据封装到Model中，Model对象可以共享到JSP页面
        model.addAttribute("list", employees);
        model.addAttribute("depts", departments);
        // 跳转到JSP，在JSP中展示数据
        return "employee/list";
    }

    @RequestMapping("/input")
    public String input(Model model, Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(1)){
            return "common/nopermission";
        }
        // 查询所有部门信息
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("depts",departments);
        return "employee/input";
    }

    @RequestMapping("/update")
    public String update(Model model, Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(2)){
            return "common/nopermission";
        }
        // 判断id是否为空，如果不为空，则根据id查询数据
        if (id != null) {// id.null : 判空快捷键
            Employee employee = employeeService.queryById(id);// alt+enter
            model.addAttribute("emp",employee);
        }
        // 查询所有部门信息
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("depts",departments);
        return "employee/update";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Employee employee, HttpServletRequest request){
        // 新增或修改数据
        employeeService.saveOrUpdate(employee);

        Employee user = (Employee) request.getSession().getAttribute("user");
        //如果修改的时登录的用户,需要修改session信息
        if (employee.getId() == user.getId()){
            request.getSession().setAttribute("user",employee);
        }
        // 重定向到列表页面
        return "redirect:/employee/list.do";
    }

    @RequestMapping("/delete")
    public String delete(Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(3)){
            return "common/nopermission";
        }
        employeeService.delete(id);
        empRoleService.deleteByEmpId(id);
        return "redirect:/employee/list.do";
    }

    @RequestMapping("/page")
    public String page( HttpServletRequest request,Model model){
        List<Employee> employees =null;
        String key = request.getParameter("keyword");
        Integer id =Integer.parseInt( request.getParameter("deptId"));//取选中的部门id
        if(id==-1){//只使用字段查找
            employees = employeeService.onlyFindByWord(key);
            model.addAttribute("list", employees);
        }else {//字段+部门
            employees = employeeService.findByWord(key, id);
            model.addAttribute("list", employees);
        }
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("depts",departments);
        model.addAttribute("qoKeyword",key);
        model.addAttribute("qoDeptId",id);//保存选中的部门id
        return "employee/list";

    }



}
