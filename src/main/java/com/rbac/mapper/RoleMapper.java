package com.rbac.mapper;


import com.rbac.pojo.Role;

import java.util.List;

public interface RoleMapper {
    void deleteByPrimaryKey(Long id);

    void insert(Role role);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    void updateByPrimaryKey(Role role);
}
