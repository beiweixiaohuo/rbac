package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Role;
import com.rbac.pojo.Permission;
import com.rbac.pojo.RolePermission;
import com.rbac.dto.RolePermissionDTO;
import com.rbac.query.QueryObject;
import com.rbac.service.IPermissionService;
import com.rbac.service.IRolePermissionDTOService;
import com.rbac.service.IRolePermissionService;
import com.rbac.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IPermissionService permissionService;
    @Autowired
    private IRolePermissionService rolePermissionService;
    @Autowired
    private IRolePermissionDTOService rolePermissionDTOService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/page")
    public String page(Model model,@ModelAttribute("qo") QueryObject qo){
        List<Role> roles = roleService.selectAll();
        List<Permission> permissions = permissionService.selectAll();
        PageInfo<Role> page = roleService.selectAllPage(qo);
        model.addAttribute("page",page);
        model.addAttribute("roles",roles);
        model.addAttribute("permissions",permissions);
        return "permission/page";
    }

    @RequestMapping("/update")
    public String update(Long id, Model model){
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        if (!myPermissions.contains(5)){
            return "common/nopermission";
        }
        //查询角色未拥有的权限
        List<Permission> enableSelects = rolePermissionDTOService.enableSelect(id);
        //查询角色已拥有的权限
        List<RolePermissionDTO> hasSelects = rolePermissionDTOService.hasSelect(id);
        model.addAttribute("hasSelects",hasSelects);
        model.addAttribute("enableSelects",enableSelects);
        return "permission/update";
    }

    @RequestMapping("/addRolePermission")
    public String addRolePermission(Long roleId, Long[] checkbox1){
        for (int i = 0;i < checkbox1.length;i++) {
            RolePermission RP = new RolePermission();
            RP.setRoleId(roleId);
            RP.setPermissionId(checkbox1[i]);
            rolePermissionService.insert(RP);
        }
        return "redirect:update.do?id="+ roleId;
    }
    @RequestMapping("/delRolePermission")
    public String delRolePermission(Long roleId,Long[] checkbox2){
        for (int i = 0;i < checkbox2.length;i++) {
            RolePermission RP = new RolePermission();
            RP.setRoleId(roleId);
            RP.setPermissionId(checkbox2[i]);
            rolePermissionService.delete(RP);
        }
        return "redirect:update.do?id="+roleId;
    }
}
