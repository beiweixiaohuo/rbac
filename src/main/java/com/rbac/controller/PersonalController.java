package com.rbac.controller;

import com.rbac.pojo.Department;
import com.rbac.pojo.EmpInfo;
import com.rbac.pojo.Employee;
import com.rbac.pojo.Position;
import com.rbac.service.IDepartmentService;
import com.rbac.service.IEmpInfoService;
import com.rbac.service.IEmployeeService;
import com.rbac.service.IPositionService;
import com.rbac.utils.CodecUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.rbac.controller.LoginController.ID_PREFIX;

@Controller
@RequestMapping("/personal")
public class PersonalController {
    @Autowired
    private HttpSession session;
    @Autowired
    private IEmpInfoService empInfoService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IPositionService positionService;
    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/list")
    public String list(Model model){
        Employee user = (Employee) session.getAttribute("user");
        EmpInfo empInfo = empInfoService.selectByWorkId(user.getId().toString());
        // 查询所有部门信息
        List<Department> departments = departmentService.queryAll();
        //查询所有职位信息
        List<Position> positions = positionService.queryAll();

        model.addAttribute("depts",departments);
        model.addAttribute("positions",positions);
        model.addAttribute("empInfo",empInfo);
        return "personal/list";
    }

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

        return "redirect:/personal/list.do";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(){

        return "/personal/updatePassword";
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping(value = "toUpdatePassword",method = RequestMethod.POST)
    public String toUpdatePassword(@RequestParam("password")String password,@RequestParam("repassword")String repassword){
        if (!password.equals(repassword)){
            return null;
        }
        String salt = CodecUtils.generateSalt();
        String newpassword = CodecUtils.md5Hex(password, salt);
        Employee user = (Employee)session.getAttribute("user");
        Long id = user.getId();
        employeeService.updatePassword(newpassword,salt,id);
        return  "redirect:/personal/list.do";
    }
}
