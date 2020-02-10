package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.mapper.PermissionMapper;
import cn.wolfcode.rbac.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.wolfcode.rbac.domain.Permission;


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
