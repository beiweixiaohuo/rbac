package cn.wolfcode.rbac.service.impl;

import cn.wolfcode.rbac.domain.Permission;
import cn.wolfcode.rbac.dto.RolePermissionDTO;
import cn.wolfcode.rbac.mapper.RolePermissionDTOMapper;
import cn.wolfcode.rbac.service.IRolePermissionDTOService;
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
