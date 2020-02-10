package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.EmpRole;

import java.util.HashSet;

public interface IEmpRoleService {
    void insert(EmpRole empRole);
    void delete(EmpRole empRole);
    void deleteByRoleId(Long roleId);
    void deleteByEmpId(Long empId);
    HashSet<Integer> queryHasPermission(Long id);
}
