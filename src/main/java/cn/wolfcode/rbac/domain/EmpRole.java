package cn.wolfcode.rbac.domain;

import lombok.Data;

@Data
public class EmpRole {
    private Long id;
    private Long empId;
    private Long roleId;
}
