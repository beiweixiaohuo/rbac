package com.rbac.service;

import com.rbac.pojo.RolePermission;
;

public interface IRolePermissionService {
    void insert(RolePermission rolePermission);

    void delete(RolePermission rolePermission);

    void deleteByRoleId(Long roleId);

    void deleteByPermissionId(Long permissionId);
}
