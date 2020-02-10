package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.Department;
import cn.wolfcode.rbac.mapper.DepartmentMapper;
import cn.wolfcode.rbac.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/12/29.
 */
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
}
