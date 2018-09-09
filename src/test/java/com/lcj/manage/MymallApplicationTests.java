package com.lcj.manage;

import com.google.gson.Gson;
import com.lcj.manage.dao.LeaveMapper;
import com.lcj.manage.dao.RoleMapper;
import com.lcj.manage.dao.SectorMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.*;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
//@Controller
public class MymallApplicationTests {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private SectorMapper sectorMapper;
    @Autowired
    private LeaveMapper leaveMapper;
    @Test
    public void contextLoads() {
//
//        String name = roleMapper.selectRoleById(4);
//        if (name!=null)
//            System.out.println(name);
////        else
////            System.out.println("error");
//        List<Sector> usersector = sectorMapper.countSector();
//        int i = usersector.get(2).getAmount();
//        Gson gson = new Gson();
//        System.out.println(i);
//        System.out.println(gson.toJson(usersector));
//        List<User> userList = userMapper.selectUserBySex();
//        System.out.println(new Gson().toJson(userList));
        List<Leave> leaveList = leaveMapper.selectUserLeave();
        System.out.println(new Gson().toJson(leaveList));
    }

}
