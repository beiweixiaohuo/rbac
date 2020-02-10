package cn.wolfcode.rbac.domain;

import lombok.*;

/**
 * Created by Administrator on 2019/12/28.
 * 员工实体类，映射employee表
 */

@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {
    //Ctrl+R：替换内容
    // 按住Alt键，按下鼠标左键，向下（向上）拖动光标，进行块状编辑

    private Long id            ;//bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    private String name          ;//varchar(20) DEFAULT NULL COMMENT '员工名称(登录账号)',
    private String password      ;//varchar(20) DEFAULT NULL COMMENT '员工密码',
    private String email         ;//varchar(255) DEFAULT NULL COMMENT '员工邮箱',
    private Integer age           ;//int(11) DEFAULT NULL COMMENT '员工年龄',
    private boolean admin         ;//bit(1) DEFAULT NULL COMMENT '是否是超级管理员',
    private Long deptId       ;//bigint(20) DEFAULT NULL COMMENT '关联字段:部门ID',

    /*关联(维护)部门对象, 员工-部门关系: 多对一. 在多方中维护一方对象*/
    private Department department;

    // Getter And Setter ...

}
