package com.rbac.query;

import com.rbac.pojo.Employee;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QueryEmpObject{

    /**关键字*/
    private String keyword;

    /**部门ID*/
    private Integer deptId;

    /**封装分页数据*/
    private int currentPage;// 当前页
    private int pageSize=8;// 页大小

}
