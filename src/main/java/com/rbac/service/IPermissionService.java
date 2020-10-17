package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Permission;
import com.rbac.query.QueryObject;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface IPermissionService {
    void deleteById(Long id);

    Permission selectById(Long id);

    List<Permission> selectAll();
    PageInfo<Permission> selectAllPage(@ModelAttribute("qo") QueryObject qo);

    void saveOrUpdate(Permission permission);
}
