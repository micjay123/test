package com.lcj.manage.controller;

import com.lcj.manage.dao.LeaveMapper;
import com.lcj.manage.model.Leave;
import com.lcj.manage.model.User;
import helper.SessionHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userLeave")
public class LeaveController {
    @Autowired
    private LeaveMapper leaveMapper;
    @RequestMapping("")
    public String leave(HttpSession session){
        User user = SessionHelper.getUser(session);
        int u_id = user.getId();
        session.setAttribute("uid",u_id);
        return "UserLeave";
    }

    /**
     * 员工提交离职申请
     * @param leave 离职实体类
     * @param model 容器
     */
    @ResponseBody
    @RequestMapping("/addLeave")
    public void add(Leave leave,Model model){
        if(leave!=null){
            leaveMapper.addLeave(leave);
        }else{
           model.addAttribute("error","提交失败");
        }

    }
}
