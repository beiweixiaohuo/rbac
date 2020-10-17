package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Department;
import com.rbac.query.QueryObject;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface IDepartmentService {
    void deleteById(Long id);

    void saveOrUpdate(Department department);

    Department queryById(Long id);

    List<Department> queryAll();

    PageInfo<Department> queryAllPage(@ModelAttribute("qo") QueryObject qo);

}
