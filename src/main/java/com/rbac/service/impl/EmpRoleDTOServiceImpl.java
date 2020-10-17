package com.rbac.service.impl;

import com.rbac.pojo.Role;
import com.rbac.dto.EmpRoleDTO;
import com.rbac.mapper.EmpRoleDTOMapper;
import com.rbac.service.IEmpRoleDTOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpRoleDTOServiceImpl implements IEmpRoleDTOService {
    @Autowired
    private EmpRoleDTOMapper empRoleDTOMapper;

    @Override
    public List<EmpRoleDTO> hasSelect(Long id) {
        return empRoleDTOMapper.hasSelect(id);
    }

    @Override
    public List<Role> enableSelect(Long id) {
        return empRoleDTOMapper.enableSelect(id);
    }
}
