package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Department;
import com.rbac.pojo.Position;
import com.rbac.query.QueryObject;
import com.rbac.service.IDepartmentService;
import com.rbac.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/position")
public class PositionController {
    @Autowired
    private IPositionService positionService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/list")
    public String list(Model model,@ModelAttribute("qo") QueryObject qo){
        // 调用service层方法，完成业务操作
        PageInfo<Position> positions = positionService.queryAllPage(qo);
        // 将数据封装到Model中，Model对象可以共享到JSP页面
        model.addAttribute("page", positions);


        List<Department> departments = departmentService.queryAll();
        model.addAttribute("departments", departments);
        // 跳转到JSP，在JSP中展示数据
        return "position/list";
    }

    @RequestMapping("/input")
    public String input(Model model, Integer id){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(4)){
            return "common/nopermission";
        }
        // 判断id是否为空，如果不为空，则根据id查询数据
        if (id != null) {// id.null : 判空快捷键
            Position pos = positionService.queryById(id);// alt+enter
            model.addAttribute("pos",pos);

        }
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("departments",departments);
        return "position/input";
    }


    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Position position){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(4)){
            return "common/nopermission";
        }
        // 新增或修改数据
        positionService.saveOrUpdate(position);
        // 重定向到列表页面
        return "redirect:/position/list.do";
    }

    @RequestMapping("/delete")
    public String delete(Integer id){
        HashSet<Integer> myPermissions =
                (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(4)){
            return "common/nopermission.do";
        }
        // 新增或修改数据
        positionService.deleteById(id);
        // 重定向到列表页面
        return "redirect:/position/list.do";
    }
}
