package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.Employee;
import cn.wolfcode.rbac.mapper.EmployeeMapper;
import cn.wolfcode.rbac.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/12/28.
 */

@Service// 告诉Spring，帮我们创建一个EmployeeServiceImpl对象，并存储在Spring容器中
public class EmployeeServiceImpl implements IEmployeeService {
    // 代码补全：alt + enter

    @Autowired // 从Spring容器中取出EmployeeMapper类型的对象，设置到employeeMapper属性中
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> queryAll() {
        // 调用mapper层方法，完成数据库的访问
        return employeeMapper.selectAll();
    }


    @Override
    public List<Employee> findByWord(String key,Integer deptId) {
        Employee employee = new Employee();
        employee.setDeptId((long)deptId);
        employee.setName(key);
        return  employeeMapper.findByWord(employee);
    }

    @Override
    public List<Employee> onlyFindByWord(String key) {
        Employee employee = new Employee();
        employee.setName(key);
        return employeeMapper.onlyFindByWord(employee);
    }

    @Override
    public Employee queryById(Long id) {
        return employeeMapper.selectById(id);
    }

    @Override
    public void saveOrUpdate(Employee employee) {
        if (employee != null && employee.getId()!=null) {
            // 修改操作
            employeeMapper.update(employee);
        }else {
            // 新增操作
            employeeMapper.insert(employee);
        }
    }

    @Override
    public void delete(Long id) {
        employeeMapper.delete(id);
    }

    @Override
    public void updateDeptId(Long id) {
        employeeMapper.updateDeptId(id);
    }

}
