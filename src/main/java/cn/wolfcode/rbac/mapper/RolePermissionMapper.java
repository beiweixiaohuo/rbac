package cn.wolfcode.rbac.mapper;

import cn.wolfcode.rbac.domain.RolePermission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RolePermissionMapper {
    @Delete("delete from role_permission where role_id=#{roleId} and permission_id = #{permissionId}")
    void delete(RolePermission rolePermission);

    @Select("insert into role_permission(role_id,permission_id) values(#{roleId},#{permissionId})")
    void insert(RolePermission rolePermission);

    @Delete("delete from role_permission where role_id=#{roleId}")
    void deleteByRoleId(Long roleId);

    @Delete("delete from role_permission where permission_id=#{permissionId}")
    void deleteByPermissionId(Long permissionId);
}
