package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Permission;
import java.util.List;

public interface IPermissionService {
    void deleteById(Long id);

    Permission selectById(Long id);

    List<Permission> selectAll();

    void saveOrUpdate(Permission permission);
}
