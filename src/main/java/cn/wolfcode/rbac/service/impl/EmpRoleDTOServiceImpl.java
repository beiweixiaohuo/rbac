package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.Role;
import cn.wolfcode.rbac.dto.EmpRoleDTO;
import cn.wolfcode.rbac.mapper.EmpRoleDTOMapper;
import cn.wolfcode.rbac.service.IEmpRoleDTOService;
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
