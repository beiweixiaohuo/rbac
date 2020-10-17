package com.rbac.mapper;

import com.rbac.pojo.Permission;
import com.rbac.dto.RolePermissionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RolePermissionDTOMapper {
    @Select("select rp.role_id as roleId,rp.permission_id as permissionId,p.name as permissionName from " +
            "role_permission as rp,permission as p where rp.permission_id = p.id and rp.role_id = #{id}")
    List<RolePermissionDTO> hasSelect(Long id);

    @Select("select * from permission as p where id not in " +
            "(select permission_id as id from role_permission where role_id = #{id} )")
    List<Permission> enableSelect(Long id);
}
