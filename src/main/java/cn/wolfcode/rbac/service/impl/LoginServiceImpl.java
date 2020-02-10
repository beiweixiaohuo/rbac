package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.Employee;
import cn.wolfcode.rbac.mapper.EmployeeMapper;
import cn.wolfcode.rbac.service.ILoginService;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;

@Service
public class LoginServiceImpl implements ILoginService {
    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public boolean checkLogin(Long id, String password) {
        Employee employee = employeeMapper.selectById(id);
        if (employee != null && employee.getPassword().equals(password)){
            return true;
        }
        return false;
    }
}
