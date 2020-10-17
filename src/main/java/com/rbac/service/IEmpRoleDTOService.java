package com.rbac.service;

import com.rbac.pojo.Role;
import com.rbac.dto.EmpRoleDTO;

import java.util.List;

public interface IEmpRoleDTOService {
    List<EmpRoleDTO> hasSelect(Long id);
    List<Role> enableSelect(Long id);
}
