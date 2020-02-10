package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.RolePermission;
import cn.wolfcode.rbac.mapper.RolePermissionMapper;
import cn.wolfcode.rbac.service.IRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RolePermissionServiceImpl implements IRolePermissionService {
    @Autowired
    private RolePermissionMapper rolePermissionMapper;
    @Override
    public void delete(RolePermission rolePermission) {
        rolePermissionMapper.delete(rolePermission);
    }

    @Override
    public void insert(RolePermission rolePermission) {
        rolePermissionMapper.insert(rolePermission);
    }

    @Override
    public void deleteByRoleId(Long roleId) {
        rolePermissionMapper.deleteByRoleId(roleId);
    }

    @Override
    public void deleteByPermissionId(Long permissionId) {
        rolePermissionMapper.deleteByPermissionId(permissionId);
    }
}
