package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Employee;

import java.util.List;


public interface IEmployeeService {
    List<Employee> queryAll();

    List<Employee> findByWord(String key,Integer deptId);

    List<Employee> onlyFindByWord(String key);

    Employee queryById(Long id);

    void saveOrUpdate(Employee employee);

    void delete(Long id);

    void updateDeptId(Long id);
}
