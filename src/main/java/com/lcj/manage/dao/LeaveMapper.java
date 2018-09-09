package com.lcj.manage.dao;

import com.lcj.manage.model.Leave;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LeaveMapper {
    void addLeave(Leave leave);
    List<Leave> selectUserLeave();
}
