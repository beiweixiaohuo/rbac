package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Employee;
import com.rbac.query.QueryEmpObject;
import com.rbac.query.QueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;


public interface IEmployeeService {
    PageInfo<Employee> queryAll(@ModelAttribute("qo") QueryObject qo);

    List<Employee> findByWord(String key,Integer deptId);

    List<Employee> onlyFindByWord(String key);

    Employee queryById(Long id);

    void saveOrUpdate(Employee employee);

    void delete(Long id);

    void updateDeptId(Long id);

    void insert(Employee employee);

    void update(Employee employee);

    void updateLock(@Param("islock") Integer islock,@Param("id")  Long id);

    void updatePassword(String password,String salt, Long id);

    PageInfo<Employee> queryList(QueryEmpObject qo);
}
