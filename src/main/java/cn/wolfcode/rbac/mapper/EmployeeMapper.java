package cn.wolfcode.rbac.mapper;

import cn.wolfcode.rbac.domain.Employee;

import java.util.List;

/**
 * Created by Administrator on 2019/12/28.
 */
public interface EmployeeMapper {

    List<Employee> selectAll();

    void insert(Employee employee);

    Employee selectById(Long id);

    void update(Employee employee);

    void updateDeptId(Long id);

    void delete(Long id);

    List<Employee> findByWord(Employee employee);

    List<Employee> onlyFindByWord(Employee employee);


}
