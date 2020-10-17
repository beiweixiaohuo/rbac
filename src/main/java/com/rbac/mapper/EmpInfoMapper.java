package com.rbac.mapper;

import com.rbac.pojo.EmpInfo;
import java.util.List;

public interface EmpInfoMapper {
    //int deleteByPrimaryKey(Integer id);

    int insert(EmpInfo record);

    EmpInfo selectByPrimaryKey(Integer id);

    EmpInfo selectByWorkId(String workid);

    List<EmpInfo> selectAll();

    int updateByPrimaryKey(EmpInfo record);

    int selectWorkIDByEmail(String email);

    void deleteByWordID(String workid);
}
