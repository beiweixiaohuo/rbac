package cn.wolfcode.rbac.domain;

import lombok.Data;

@Data
public class Role {
    private Long id;
    private String name;
    private String description;
}
