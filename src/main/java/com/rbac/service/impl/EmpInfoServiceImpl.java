package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.mapper.EmpInfoMapper;
import com.rbac.pojo.EmpInfo;
import com.rbac.query.QueryObject;
import com.rbac.service.IEmpInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpInfoServiceImpl implements IEmpInfoService {
    @Autowired
    private EmpInfoMapper empInfoMapper;
    @Override
    public Integer selectWorkIDByEmail(String email) {
        return empInfoMapper.selectWorkIDByEmail(email);
    }

    @Override
    public EmpInfo selectByWorkId(String workID) {
        return empInfoMapper.selectByWorkId(workID);
    }

    @Override
    public void updateByPrimaryKey(EmpInfo empInfo) {
        empInfoMapper.updateByPrimaryKey(empInfo);
    }

    @Override
    public void deleteByWordID(String workid) {
        empInfoMapper.deleteByWordID(workid);
    }

    @Override
    public void insert(EmpInfo empInfo) {
        empInfoMapper.insert(empInfo);
    }

    @Override
    public PageInfo<EmpInfo> queryAll(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<EmpInfo> list = empInfoMapper.selectAll();
        return new PageInfo<>(list);
    }

    @Override
    public List<EmpInfo> queryAll() {
        return empInfoMapper.selectAll();
    }

}
