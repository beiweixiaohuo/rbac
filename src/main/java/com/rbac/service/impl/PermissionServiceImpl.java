package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.mapper.PermissionMapper;
import com.rbac.pojo.Board;
import com.rbac.query.QueryObject;
import com.rbac.service.IPermissionService;
import com.rbac.pojo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public void deleteById(Long id) {
        permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Permission selectById(Long id) {
        return permissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }

    @Override
    public PageInfo<Permission> selectAllPage(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<Permission> list = permissionMapper.selectAll();
        return new PageInfo<>(list);

    }

    @Override
    public void saveOrUpdate(Permission permission) {
        if (permission != null && permission.getId()!=null) {// department.nn ：非空判断
            // 修改
            permissionMapper.updateByPrimaryKey(permission);
        }else {
            // 新增
            permissionMapper.insert(permission);
        }
    }


}
