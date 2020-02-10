package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Department;

import java.util.List;

/**
 * Created by Administrator on 2019/12/29.
 */
public interface IDepartmentService {
    void deleteById(Long id);

    void saveOrUpdate(Department department);

    Department queryById(Long id);

    List<Department> queryAll();

}
