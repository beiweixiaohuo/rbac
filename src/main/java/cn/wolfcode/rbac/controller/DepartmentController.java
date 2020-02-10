package cn.wolfcode.rbac.controller;

import cn.wolfcode.rbac.domain.Department;
import cn.wolfcode.rbac.service.IDepartmentService;
import cn.wolfcode.rbac.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Administrator on 2019/12/28.
 * 员工管理控制器
 */
@Controller// 告诉Spring，帮我们创建DepartmentController对象并管理
@RequestMapping("/department")// 告诉客户端，DepartmentController的访问路径
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private HttpSession session;


    @RequestMapping("/list")// 告诉客户端，该方法的访问路径
    public String list(Model model){
        // 调用service层方法，完成业务操作
        List<Department> departments = departmentService.queryAll();
        // 将数据封装到Model中，Model对象可以共享到JSP页面
        model.addAttribute("list", departments);
        // 跳转到JSP，在JSP中展示数据
        return "department/list";
    }

    @RequestMapping("/input")
    public String input(Model model, Long id){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(4)){
            return "common/nopermission";
        }
        // 判断id是否为空，如果不为空，则根据id查询数据
        if (id != null) {// id.null : 判空快捷键
            Department department = departmentService.queryById(id);// alt+enter
            model.addAttribute("dept",department);
        }
        return "department/input";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Department department){
        // 新增或修改数据
        departmentService.saveOrUpdate(department);
        // 重定向到列表页面
        return "redirect:/department/list.do";
    }

    @RequestMapping("/delete")
    public String delete(Long id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(5)){
            return "common/nopermission";
        }
        // 新增或修改数据
        departmentService.deleteById(id);
        employeeService.updateDeptId(id);
        // 重定向到列表页面
        return "redirect:/department/list.do";
    }
}
