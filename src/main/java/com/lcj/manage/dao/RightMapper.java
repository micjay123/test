package com.lcj.manage.dao;

import com.lcj.manage.model.Right;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RightMapper {
    void insertRight(Right right);
    List<Right> selectAllRight();
    void delRight(Right right);
    void updateRightById(Right right);
}
