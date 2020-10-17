package com.rbac.dto;

import lombok.Data;

@Data
public class RolePermissionDTO {
    private Long roleId;
    private Long permissionId;
    private String permissionName;
}
