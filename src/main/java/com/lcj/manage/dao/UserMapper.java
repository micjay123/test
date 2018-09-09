package com.lcj.manage.dao;

import com.lcj.manage.model.State;
import com.lcj.manage.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    void insertUser(User user);
    User verifyUser(User user);
    User checkPass(User user);
    void modifyPassword(User user);
    List<User> selectAllUserWithState();
    void deleteUserStateById(State state);
    void updateStateById(State state);
    void initUserState(State state);
    List<User> queryUserByCode();
    void updateUserCodeById(Integer id);
    void sectorDismiss(User user);
    List<User> selectNameBySid();
    void addUser2Sector(User user);
    List<User> selectUserRoleAndRight();
    void editUserRole(User user);
    List<User> selectUserBySex();
}
