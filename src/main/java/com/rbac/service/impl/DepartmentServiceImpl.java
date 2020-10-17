package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Department;
import com.rbac.mapper.DepartmentMapper;
import com.rbac.query.QueryObject;
import com.rbac.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public void deleteById(Long id) {
        departmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(Department department) {
        if (department != null && department.getId()!=null) {// department.nn ：非空判断
            // 修改
            departmentMapper.updateByPrimaryKey(department);
        }else {
            // 新增
            departmentMapper.insert(department);
        }
    }

    @Override
    public Department queryById(Long id) {
        return departmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Department> queryAll() {
        return departmentMapper.selectAll();
    }

    @Override
    public PageInfo<Department> queryAllPage(@ModelAttribute("qo") QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<Department> list = departmentMapper.selectAll();
        return new PageInfo<>(list);
    }
}
