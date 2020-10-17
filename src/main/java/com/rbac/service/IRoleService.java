package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Permission;
import com.rbac.pojo.Role;
import com.rbac.query.QueryObject;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface IRoleService {
    void deleteById(Long id);

    void saveOrUpdate(Role role);

    Role selectById(Long id);

    List<Role> selectAll();

    PageInfo<Role> selectAllPage(@ModelAttribute("qo") QueryObject qo);
}
