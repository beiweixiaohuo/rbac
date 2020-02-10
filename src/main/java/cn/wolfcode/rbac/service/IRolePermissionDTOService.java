package cn.wolfcode.rbac.service;

import cn.wolfcode.rbac.domain.Permission;
import cn.wolfcode.rbac.dto.RolePermissionDTO;

import java.util.List;

public interface IRolePermissionDTOService {
    List<RolePermissionDTO> hasSelect(Long id);
    List<Permission> enableSelect(Long id);
}
