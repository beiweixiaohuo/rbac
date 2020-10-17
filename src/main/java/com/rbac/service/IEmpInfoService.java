package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.EmpInfo;
import com.rbac.query.QueryObject;

import java.util.List;

public interface IEmpInfoService {
    public Integer selectWorkIDByEmail(String email);

    EmpInfo selectByWorkId(String workID);

    void updateByPrimaryKey(EmpInfo empInfo);

    void deleteByWordID(String workid);

    void insert(EmpInfo empInfo);

    PageInfo<EmpInfo> queryAll(QueryObject qo);

    List<EmpInfo> queryAll();
}
