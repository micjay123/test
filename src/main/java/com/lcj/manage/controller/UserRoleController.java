package com.lcj.manage.controller;

import com.lcj.manage.dao.RoleMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.Role;
import com.lcj.manage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/user/role")
@Controller
public class UserRoleController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    /**
     * 显示用户角色信息
     * @param model
     * @return
     */
    @RequestMapping("")
    public String userRole(Model model){
        List<User> userList = userMapper.selectUserRoleAndRight();
        List<Role> userRole = roleMapper.selectAllRole();
        model.addAttribute("roleName",userRole);
        model.addAttribute("userRole",userList);
        return "userRole";
    }

    /**
     * 员工升降职称
     * @param user 用户实体类
     */
    @ResponseBody
    @RequestMapping("/editRole")
    public void edit(User user){
        if (user!=null)
        userMapper.editUserRole(user);
    }

}
