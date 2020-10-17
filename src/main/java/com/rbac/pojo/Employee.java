package com.rbac.pojo;

import com.rbac.query.QueryEmpObject;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {
    private Long id;

    private String name;

    private String password;

    private String salt;

    private String phone;

    private Integer deptId;

    private Integer islock;

   private Department department;
}
