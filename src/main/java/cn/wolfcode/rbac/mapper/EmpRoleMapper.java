package cn.wolfcode.rbac.mapper;

import cn.wolfcode.rbac.domain.EmpRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.HashSet;
import java.util.List;

@Mapper
public interface EmpRoleMapper {

    @Insert("insert into emp_role(emp_id,role_id) values(#{empId},#{roleId})")
    void insert(EmpRole empRole);

    @Delete("delete from emp_role where emp_Id = #{empId} and role_id = #{roleId}")
    void delete(EmpRole empRole);

    @Delete("delete from emp_role where role_id = #{roleId}")
    void deleteByRoleId(Long roleId);

    @Delete("delete from emp_role where emp_id = #{empId}")
    void deleteByEmpId(Long empId);

    @Select("select rp.permission_id from emp_role as er,role_permission as rp " +
            "where emp_id=#{id} and er.role_id = rp.role_id;")
    HashSet<Integer> queryHasPermission(Long id);
}
