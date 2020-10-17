package com.rbac.mapper;

import com.rbac.pojo.Role;
import com.rbac.dto.EmpRoleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EmpRoleDTOMapper {
    @Select("select er.emp_id as empId,er.role_id as roleId,r.name as roleName from " +
            "emp_role as er,role as r where er.emp_id = #{id} and er.role_id = r.id")
    List<EmpRoleDTO> hasSelect(Long id);

    @Select("select * from role as r where id not in (select role_id as id from emp_role " +
            "where emp_id = #{id} )")
    List<Role> enableSelect(Long id);
}
