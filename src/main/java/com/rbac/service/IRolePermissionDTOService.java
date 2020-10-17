package com.rbac.service;

import com.rbac.pojo.Permission;
import com.rbac.dto.RolePermissionDTO;

import java.util.List;

public interface IRolePermissionDTOService {
    List<RolePermissionDTO> hasSelect(Long id);
    List<Permission> enableSelect(Long id);
}
