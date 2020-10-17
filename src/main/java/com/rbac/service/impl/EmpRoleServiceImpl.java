package com.rbac.service.impl;

import com.rbac.pojo.EmpRole;
import com.rbac.mapper.EmpRoleMapper;
import com.rbac.service.IEmpRoleService;
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
