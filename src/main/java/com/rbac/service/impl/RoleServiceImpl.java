package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Permission;
import com.rbac.pojo.Role;
import com.rbac.mapper.RoleMapper;
import com.rbac.query.QueryObject;
import com.rbac.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void deleteById(Long id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(Role role) {
        if (role != null && role.getId()!=null) {// department.nn ：非空判断
            // 修改
            roleMapper.updateByPrimaryKey(role);
        }else {
            // 新增
            roleMapper.insert(role);
        }
    }


    @Override
    public Role selectById(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }

    @Override
    public PageInfo<Role> selectAllPage(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<Role> list = roleMapper.selectAll();
        return new PageInfo<>(list);
    }

}
