package com.rbac.query;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QueryObject {


    /**封装分页数据*/
    private int currentPage;// 当前页
    private int pageSize=8;// 页大小

}
