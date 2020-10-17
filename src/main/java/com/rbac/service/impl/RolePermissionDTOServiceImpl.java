package com.rbac.service.impl;

import com.rbac.pojo.Permission;
import com.rbac.dto.RolePermissionDTO;
import com.rbac.mapper.RolePermissionDTOMapper;
import com.rbac.service.IRolePermissionDTOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RolePermissionDTOServiceImpl implements IRolePermissionDTOService {
    @Autowired
    private RolePermissionDTOMapper rolePermissionDTOMapper;
    @Override
    public List<RolePermissionDTO> hasSelect(Long id) {
        return rolePermissionDTOMapper.hasSelect(id);
    }

    @Override
    public List<Permission> enableSelect(Long id) {
        return rolePermissionDTOMapper.enableSelect(id);
    }
}
