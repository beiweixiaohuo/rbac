package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Role;
import cn.wolfcode.rbac.dto.EmpRoleDTO;

import java.util.List;

public interface IEmpRoleDTOService {
    List<EmpRoleDTO> hasSelect(Long id);
    List<Role> enableSelect(Long id);
}
