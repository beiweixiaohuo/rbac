package com.rbac.service.impl;

import com.rbac.mapper.EmployeeMapper;
import com.rbac.pojo.Employee;
import com.rbac.service.ILoginService;
import com.rbac.utils.CodecUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService {
    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public boolean checkLogin(Long id, String password) {
        Employee employee = employeeMapper.selectById(id);
        if (employee != null && employee.getPassword().equals(CodecUtils.md5Hex(password, employee.getSalt()))){
            return true;
        }
        return false;
    }
}
