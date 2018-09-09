package com.lcj.manage.dao;

import com.lcj.manage.model.Role;
import com.lcj.manage.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RoleMapper {
    void insertRole(Role role);
    List<Role> selectAllRole2Right();
    void delRole(Role role);
    void updateRoleById(Role role);
    List<Role> selectAllRole();
    String selectRoleById(Integer id);
}
