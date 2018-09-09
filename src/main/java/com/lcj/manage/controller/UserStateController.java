package com.lcj.manage.controller;

import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.State;
import com.lcj.manage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/userState")
public class UserStateController {
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户状态检索
     * @param model
     * @return
     */
    @GetMapping("")
    public String info(Model model){
        List<User> users = userMapper.selectAllUserWithState();
        List<User> user = userMapper.queryUserByCode();
        model.addAttribute("userInfo",user);
        model.addAttribute("userList",users);
//        System.out.println(users);
        return "user_manage";
    }

    /**
     * 删除用户
     * @param state
     */
    @ResponseBody
    @GetMapping("/delUserState")
    public void del(State state){
        if(state!=null) {
            userMapper.deleteUserStateById(state);
        }else {
            System.out.println("error!");
        }
    }

    /**
     * 更新用户状态
     * @param state
     */
    @ResponseBody
    @GetMapping("/updateUserState")
    public void update(State state){
        if(state!=null) {
            userMapper.updateStateById(state);
        }else {
            System.out.println("error!");
        }
    }

    /**
     * 添加新用户状态
     * @param state
     */
    @ResponseBody
    @GetMapping("/addState")
    public void add(State state){
        if(state!=null){
            userMapper.initUserState(state);
            userMapper.updateUserCodeById(state.getU_id());
//            System.out.println(state.getU_id());
        }else
            System.out.println("error");
    }
}
