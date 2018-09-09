package com.lcj.manage.controller;

import com.lcj.manage.dao.SectorMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.Sector;
import com.lcj.manage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user/sector")
public class UserSectorController {
    @Autowired
    private SectorMapper sectorMapper;
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户部门查询
     * @param model
     * @return
     */
    @RequestMapping("")
    public String userSector(Model model){
        List<Sector> sectorList = sectorMapper.selectUserWithSector();
        List<User> userList = userMapper.selectNameBySid();
        List<Sector> sectors = sectorMapper.selectAllSector();
        model.addAttribute("sectorName",sectors);
        model.addAttribute("username",userList);
        model.addAttribute("user4sector",sectorList);
        return "userSector";
    }

    /**
     * 用户部门开除
     * @param user
     */
    @ResponseBody
    @RequestMapping("/dismiss")
    public void dismiss(User user){
        if(user!=null)
            userMapper.sectorDismiss(user);
        else
            System.out.println("error");
    }

    /**
     * 新用户添加部门
     * @param user
     */
    @ResponseBody
    @RequestMapping("/add")
    public void add(User user){
        if (user!=null)
            userMapper.addUser2Sector(user);
        else
            System.out.println("error");
    }
}
