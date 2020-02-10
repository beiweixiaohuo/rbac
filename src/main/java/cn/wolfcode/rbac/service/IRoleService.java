package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Role;

import java.util.List;

public interface IRoleService {
    void deleteById(Long id);

    void saveOrUpdate(Role role);

    Role selectById(Long id);

    List<Role> selectAll();

}
