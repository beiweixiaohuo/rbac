package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.EmpRole;
import cn.wolfcode.rbac.mapper.EmpRoleMapper;
import cn.wolfcode.rbac.service.IEmpRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class EmpRoleServiceImpl implements IEmpRoleService {
    @Autowired
    private EmpRoleMapper empRoleMapper;
    @Override
    public void insert(EmpRole empRole) {
        empRoleMapper.insert(empRole);
    }

    @Override
    public void delete(EmpRole empRole) {
        empRoleMapper.delete(empRole);
    }

    @Override
    public void deleteByRoleId(Long roleId) {
        empRoleMapper.deleteByRoleId(roleId);
    }

    @Override
    public void deleteByEmpId(Long empId) {
        empRoleMapper.deleteByEmpId(empId);
    }

    @Override
    public HashSet<Integer> queryHasPermission(Long id) {
        return empRoleMapper.queryHasPermission(id);
    }
}
