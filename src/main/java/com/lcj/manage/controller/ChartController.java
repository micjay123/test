package com.lcj.manage.controller;

import com.lcj.manage.dao.LeaveMapper;
import com.lcj.manage.dao.SectorMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.Leave;
import com.lcj.manage.model.Sector;
import com.lcj.manage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ChartController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SectorMapper sectorMapper;
    @Autowired
    private LeaveMapper leaveMapper;

    /**
     * 图表统计 主要有
     * 员工性别的统计
     * 部门人数的统计
     * 离职员工信息查看
     * @param model
     * @return
     */
    @RequestMapping("chart")
    public String chart(Model model){
        List<Sector> usersector = sectorMapper.countSector();
        List<User> userList = userMapper.selectUserBySex();
        List<Leave> leaveList = leaveMapper.selectUserLeave();
        model.addAttribute("sectorList",usersector);
        model.addAttribute("userList",userList);
        model.addAttribute("leaveList",leaveList);
        return "chart";
    }
}
