package cn.wolfcode.rbac.dto;

import lombok.Data;

@Data
public class EmpRoleDTO {
    private Long empId;
    private Long roleId;
    private String roleName;
}
