package com.rbac.mapper;

import com.rbac.pojo.Employee;
import com.rbac.query.QueryEmpObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectById(Long id);

    List<Employee> selectAll();

    int update(Employee record);

    List<Employee> findByWord(Employee employee);

    List<Employee> onlyFindByWord(Employee employee);

    void updateDeptId(Long id);

    void updateLock(@Param("islock")Integer islock,@Param("id") Long id);

    void updatePassword(@Param("password")String password,@Param("salt")String salt, @Param("id")Long id);

    List<Employee> selectList(QueryEmpObject qo);
}
