package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.mapper.EmployeeMapper;
import com.rbac.pojo.Employee;
import com.rbac.query.QueryEmpObject;
import com.rbac.query.QueryObject;
import com.rbac.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
    // 代码补全：alt + enter

    @Autowired // 从Spring容器中取出EmployeeMapper类型的对象，设置到employeeMapper属性中
    private EmployeeMapper employeeMapper;

    @Override
    public PageInfo<Employee> queryAll(@ModelAttribute("qo") QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        // 调用mapper层方法，完成数据库的访问
        List<Employee> list = employeeMapper.selectAll();
        return new PageInfo<>(list);
    }

    @Override
    public List<Employee> findByWord(String key,Integer deptId) {
        Employee employee = new Employee();
        employee.setDeptId(deptId);
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
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateDeptId(Long id) {
        employeeMapper.updateDeptId(id);
    }

    @Override
    public void insert(Employee employee) {
        employeeMapper.insert(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeMapper.update(employee);
    }

    @Override
    public void updateLock(Integer islock,Long id) {
        employeeMapper.updateLock(islock,id);
    }

    @Override
    public void updatePassword(String password, String salt,Long id) {
        employeeMapper.updatePassword(password,salt,id);
    }

    @Override
    public PageInfo<Employee> queryList(QueryEmpObject qo) {
        // 设置分页:
        // 参数一:当前页; 参数二: 页大小
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);

        List<Employee> list = employeeMapper.selectList(qo);

        return new PageInfo<>(list);
    }


}
