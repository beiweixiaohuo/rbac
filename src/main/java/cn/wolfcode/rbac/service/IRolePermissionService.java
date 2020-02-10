package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.RolePermission;;

public interface IRolePermissionService {
    void insert(RolePermission rolePermission);

    void delete(RolePermission rolePermission);

    void deleteByRoleId(Long roleId);

    void deleteByPermissionId(Long permissionId);
}
