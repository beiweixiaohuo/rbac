package com.rbac.mapper;


import com.rbac.pojo.Permission;

import java.util.List;

public interface PermissionMapper {
    void deleteByPrimaryKey(Long id);

    void insert(Permission permission);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    void updateByPrimaryKey(Permission permission);
}
